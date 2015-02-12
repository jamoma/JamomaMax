var Telecommande = function() {
};

var ws, builder;
var sortableOptions = {
    axis: "y",
    items: "> li",
    distance: 10,
    cursor: 'move',
    //forceHelperSize: true,
    forcePlaceholderSize: true,
    opacity: 0.5
};

var fieldSortableOptions = Object.create(sortableOptions);
fieldSortableOptions.placeholder = 'fieldPlaceholder';
var nodeSortableOptions = Object.create(sortableOptions);
nodeSortableOptions.placeholder = 'nodePlaceholder';

$(document).ready(function() {
    var node;
    var absoluteAddress = '';
    var appName = document.getElementById('appName');

        console.log('connecting') ;
        document.getElementById('fadingBarsG').classList.remove('hidden');
        var settings = {
            host: 'ws://' + window.location.hostname + ':' + window.location.port
        };

        ws = new WebSocket(settings.host);

        ws.onopen = function() {
            console.log('open');
            var message = {
                sender: 'telecommande',
                operation: '?namespace_all',
                '/' : null
            };
            ws.send(JSON.stringify(message));
        };

        ws.onerror = function(error)
        {
            document.getElementById('fadingBarsG').classList.add('hidden');
            alert('Websocket error') ;
        }

        ws.onmessage = function(message) {
            var data = JSON.parse(message.data);
            console.log(data);
            switch (data.operation)
            {
                case 'modifying' :
                    var address = Object.keys(data)[2] ;
                    var line = document.querySelector('li[data-address="' + address + '"]');
                    if (data[address] === true)
                    {
                        line.classList.add('editingByOther');
                        $(line).parents('.ui-sortable').each(function() {
                            $(this).sortable('disable');
                        });
                    }
                    else
                    {
                        line.classList.remove('editingByOther');
                        $(line).parents('.ui-sortable').each(function() {
                            $(this).sortable('enable');
                        });
                    }

                    break;

                case 'copy' :
                    var address = Object.keys(data)[2] ;
                    var link = document.querySelector('li[data-address="' + address + '"] a[data-action="copy"]');
                    $(link).trigger('click');
                    break;

                case 'delete' :
                    var address = Object.keys(data)[2] ;
                    var link = document.querySelector('li[data-address="' + address + '"] a[data-action="delete"]');
                    $(link).trigger('click');
                    break;

                case 'move' :
                    var sourceAddress = Object.keys(data)[2] ;
                    var destAddress = data[sourceAddress] ;
                    var sourceAddressArray = sourceAddress.split('.');
                    var originalPos = sourceAddressArray[sourceAddressArray.length - 1];
                    var destAddressArray = destAddress.split('.');
                    var pos = destAddressArray[destAddressArray.length - 1];
                    var $sourceLine = $('li[data-address="' + sourceAddress + '"]');
                    var $destLine = $('li[data-address="' + destAddress + '"]');
                    var $sortableElement = $sourceLine.parent('.ui-sortable');
                    var nodes = $sortableElement.get(0).childNodes;
                    $sortableElement.sortable('disable');
                    var beginningNodeIndex, endingNodeIndex;
                    if (originalPos < pos)
                    {
                        beginningNodeIndex = originalPos;
                        endingNodeIndex = pos;
                        $sourceLine.insertAfter($destLine);
                    }
                    else
                    {
                        beginningNodeIndex = pos;
                        endingNodeIndex = originalPos;
                        $sourceLine.insertBefore($destLine);
                    }
                    if ($sortableElement.hasClass('dynamicNode'))
                    {
                        updateDynamicNode(nodes, beginningNodeIndex, endingNodeIndex);
                    }
                    else if ($sortableElement.hasClass('dynamicField'))
                    {
                        updateDynamicField(nodes, beginningNodeIndex, endingNodeIndex);
                    }
                    $sortableElement.sortable('enable');
                    break;

                case 'init' :
                    Animation.namespace = data.namespace;
                    Animation.template = data.template;
                    Animation.preset = data.preset;
                    builder = new ListBuilder();
                    var templateForm = new TemplateParser(Animation.template, Animation.namespace, builder).getForm();
                    document.body.appendChild(templateForm);
                    refreshAllValues(templateForm);
                    document.getElementById('fadingBarsG').classList.add('hidden');
                    $('ul.dynamicNode').sortable(nodeSortableOptions).on('sortupdate', refreshDynamicNode)
                            .on('sortstart', sortStart);
                    $('ul.dynamicField').sortable(fieldSortableOptions).on('sortupdate', refreshDynamicField)
                            .on('sortstart', sortStart);
                    break;

                case ':namespace_all' :
                        Animation.namespace = data[Object.keys(data)[2]] ;
                        var sender = data.sender ;
                        document.getElementById('appName').innerHTML += ' - ' + sender ;
                        console.log(Animation.namespace) ;
                        builder = new ListBuilder() ;
                        var form = new NamespaceParser(Animation.namespace, builder).getForm() ;
                        var oldForm = document.getElementById('form') ;
                        document.body.replaceChild(form, oldForm) ;
                        refreshAllValues(form);
                        document.getElementById('fadingBarsG').classList.add('hidden');
                    break ;

                case 'valueChange' :
                case 'set' :
                case ':get' :
                    var address = Object.keys(data)[2] ;
                    var input = document.querySelector('span[data-address="' + address + '"]');
                    input.innerHTML = data[address];
                    input.setAttribute('data-value', data[address]);
                    console.log(input);
                    break;

                default :
                    console.error('Message not recognized', data.operation);
                    break;
            }

        };

    function refreshAllValues(form)
    {
        var $fields = $(form).find('li[data-address]');
        console.log($fields);
        $fields.each(function() {
            var $this = $(this);
            var address = $this.attr('data-address');
            var message = {
                'sender' : 'telecommande',
                'operation': '?get'
            };
            message[address] = null ;
            ws.send(JSON.stringify(message));
        });
    }

    $(document).on('click', '.toggle', function(e) {
        $(this).next().slideToggle(300);
        this.classList.toggle('closed');
        this.classList.toggle('open');
    });
    $(document).on('click', 'li.input:not(.editable, .editingByOther)', ListBuilder.transformToInput);
    $(document).on('click', '.input a[data-action="copy"]', ListBuilder.copyField);
    $(document).on('click', '.input a[data-action="delete"]', ListBuilder.deleteField);
    $(document).on('click', '.node>div a[data-action="copy"]', ListBuilder.copyNode);
    $(document).on('click', '.node>div a[data-action="delete"]', ListBuilder.deleteNode);
    $(document).on('click', 'body', function(event) {
        if (event.target.nodeName === "UL" || event.target.nodeName === "BODY")
        {
            if (ListBuilder.currentInput !== undefined)
            {
                ListBuilder.currentInput.transformToSpan();
                ListBuilder.currentInput = undefined;
            }
        }
    });
});

var sortStart = function(event, ui) {
    event.stopPropagation();
    ui.item.startPos = ui.item.index();
    ui.item.originalAddress = ui.item.get(0).dataset.address;
    this.classList.add('sorting');
};

var refreshDynamicNode = function(event, ui) {
    event.stopPropagation();
    this.classList.remove('sorting');
    var nodes = this.childNodes;
    var originalAddress = ui.item.originalAddress;
    var pos = ui.item.index();
    var originalPos = ui.item.startPos;
    var beginningNodeIndex, endingNodeIndex;
    if (originalPos < pos)
    {
        beginningNodeIndex = originalPos;
        endingNodeIndex = pos;
    }
    else
    {
        beginningNodeIndex = pos;
        endingNodeIndex = originalPos;
    }
    updateDynamicNode(nodes, beginningNodeIndex, endingNodeIndex);
    Preset.moveField(originalAddress, ui.item.get(0).dataset.address);
};

var updateDynamicNode = function(nodes, beginningNodeIndex, endingNodeIndex) {

    for (var i = beginningNodeIndex; i <= endingNodeIndex; i++)
    {
        var line = nodes[i];
        var originalAddress = line.dataset.address;
        var addressArray = originalAddress.split('.');
        var position = addressArray[addressArray.length - 1];
        addressArray.pop();
        var address = addressArray.join('.');
        var newAddress = address + "." + i;
        if (position !== i)
        {
            line.dataset.address = newAddress;

            var label = line.childNodes[0].childNodes[2].innerHTML;
            var labelText = label.substring(label.indexOf(']') + 1, label.length);
            line.childNodes[0].childNodes[2].innerHTML = '[' + i + '] ' + labelText;

            var nodesWithAddressesToChange = line.querySelectorAll('[data-address^="' + address + '"]');
            for (var j = 0; j < nodesWithAddressesToChange.length; j++)
            {
                var relativeAddressLength = originalAddress.length;
                var endOfAddress = nodesWithAddressesToChange[j].dataset.address.substring(relativeAddressLength);
                nodesWithAddressesToChange[j].dataset.address = newAddress + endOfAddress;
            }
        }
    }
};

var refreshDynamicField = function(event, ui) {
    event.stopPropagation();
    this.classList.remove('sorting');
    console.log(ui.item.originalAddress);
    var nodes = this.childNodes;
    var originalAddress = ui.item.originalAddress;
    var pos = ui.item.index();
    var originalPos = ui.item.startPos;
    var beginningNodeIndex, endingNodeIndex;
    if (originalPos < pos)
    {
        beginningNodeIndex = originalPos;
        endingNodeIndex = pos;
    }
    else
    {
        beginningNodeIndex = pos;
        endingNodeIndex = originalPos;
    }
    updateDynamicField(nodes, beginningNodeIndex, endingNodeIndex);
    Preset.moveField(originalAddress, ui.item.get(0).dataset.address);
};

var updateDynamicField = function(nodes, beginningNodeIndex, endingNodeIndex)
{
    for (var i = beginningNodeIndex; i <= endingNodeIndex; i++)
    {
        var line = nodes[i];
        var originalAddress = line.dataset.address;
        var addressArray = originalAddress.split('.');
        var position = addressArray[addressArray.length - 1];
        addressArray.pop();
        var address = addressArray.join('.');
        var newAddress = address + "." + i;
        if (position !== i)
        {
            line.dataset.address = newAddress;

            var label = line.childNodes[0].innerHTML;
            var labelText = label.substring(label.indexOf(']') + 1, label.length);
            line.childNodes[0].innerHTML = '[' + i + '] ' + labelText;
        }

    }
};