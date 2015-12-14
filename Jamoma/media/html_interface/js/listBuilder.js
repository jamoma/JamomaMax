
function ListBuilder() {
    var _this = this;
    this.currentInput = null;

    this.buildNode = function(params, open)
    {
        var label = params.label;
        var line = document.createElement('li');
        line.classList.add('node');
        var div = document.createElement('div');
        div.classList.add('toggle');

        if (typeof (params.dynamicInstances) !== "undefined")
        {
            line.dataset.dynamicInstances = params.dynamicInstances;
            line.dataset.instanceBounds = params.instanceBounds;

            if (params.address)
            {
                line.dataset.address = params.address;
            }

            var links = document.createElement('span');
            links.classList.add('showOnLiHover');

            var linkCopy = document.createElement('a');
            linkCopy.dataset.action = 'copy';
            linkCopy.innerHTML = 'copy';

            var linkDelete = document.createElement('a');
            linkDelete.dataset.action = 'delete';
            linkDelete.innerHTML = 'delete';

            links.appendChild(linkCopy);
            links.appendChild(linkDelete);

            div.appendChild(links);
        }

        //Création de la flèche d'indication
        var arrow = document.createElement('div');
        arrow.classList.add('arrow');
        arrow.innerHTML = ' ▽ ';


        var text = document.createElement('span');
        text.classList.add('label');
        text.innerHTML = label;
        div.appendChild(arrow);
        div.appendChild(text);

        //On ajoute un indicateur d'ouverture de la div
        var divClass;
        if (open)
        {
            divClass = 'open';
        }
        else
        {
            divClass = 'closed';
        }
        div.classList.add(divClass);

        line.appendChild(div);
        return line;
    };

    this.buildLine = function(params)
    {
        var labelText = params.label;
        var line = document.createElement('li');
        line.setAttribute('data-address', params.address);
        line.setAttribute('title', params.description);
        line.classList.add('input');
        var label = document.createElement('label');
        label.innerHTML = labelText + ' ';
        line.appendChild(label);

        var input = this.buildInput(params);
        line.appendChild(input);

        if (typeof (params.dynamicInstances) !== "undefined")
        {
            line.dataset.dynamicInstances = params.dynamicInstances;
            line.dataset.instanceBounds = params.instanceBounds;

            var links = document.createElement('span');
            links.classList.add('showOnLiHover');

            var linkCopy = document.createElement('a');
            linkCopy.dataset.action = 'copy';
            linkCopy.innerHTML = 'copy';

            var linkDelete = document.createElement('a');
            linkDelete.dataset.action = 'delete';
            linkDelete.innerHTML = 'delete';

            links.appendChild(linkCopy);
            links.appendChild(linkDelete);

            line.appendChild(links);
        }

        return line;
    };

    this.buildInput = function(params)
    {
        var fragment = document.createDocumentFragment();

        var span = document.createElement('span');
        fragment.appendChild(span);
        span.classList.add('data');

        span.dataset = params;
        span.dataset.type = params.type;
        if(typeof(params.value) !== 'undefined')
        {
            span.dataset.value = params.value;
        }
        else if(typeof(params.valueDefault) !== 'undefined')
        {
            span.dataset.value = params.valueDefault;
        }
        else
        {
            span.dataset.value = '' ;
        }
        
        span.dataset.address = params.address;

        if (params.type === 'integer' || params.type === 'decimal')
        {
            var bounds = params.rangeBounds.split(' ');
            span.dataset.min = bounds[0];
            span.dataset.max = bounds[1];
            span.dataset.step = params.valueStepsize;
        }

        span.innerHTML = span.dataset.value;
        return fragment;
    };
}
ListBuilder.transformToInput = function(event)
{
    if (ListBuilder.currentInput !== undefined)
    {
        ListBuilder.currentInput.transformToSpan();
    }
    this.classList.add('editable');

    var span = this.getElementsByTagName('span')[0];
    span.classList.add('hidden');
    var input = new InputFactory(span.dataset, this).getInput();
    this.appendChild(input.getHTML());
    ListBuilder.currentInput = input;
    var address = this.getAttribute('data-address');
    var message = {
        sender : 'telecommande',
        operation : 'modifying'
    };
    message[address] = true ;
    ws.send(JSON.stringify(message));
};

ListBuilder.copyField = function(event)
{
    var line = this.parentNode.parentNode;
    var ul = line.parentNode;
    var addressArray = line.dataset.address.split('.');
    console.log(addressArray) ;
    
    var position = addressArray[addressArray.length - 1];
    addressArray.pop() ;
    var address = addressArray.join('.') ;
    
    var fields = $(ul).children('li[data-address^="' + address + '"]');
    var count = fields.length;
    var instanceBounds = line.dataset.instanceBounds.split(' ');
    var instancesMin = instanceBounds[0];
    var instancesMax = instanceBounds[1];
    if (count < instancesMax)
    {
        var newLine = line.cloneNode(true);
        var newPosition = parseInt(position) + 1;
        var newAddress = address + '.' + newPosition;

        var label = line.childNodes[0].innerHTML;
        var labelText = label.substring(label.indexOf(']') + 1, label.length);
        newLine.firstChild.innerHTML = '[' + (newPosition) + '] ' + labelText;

        newLine.dataset.address = newAddress;
        newLine.querySelector('span.data').dataset.address = newAddress;
        ul.insertBefore(newLine, line.nextSibling);
        console.log(newPosition, newLine);
        for (var i = newPosition; i < count; i++)
        {
            var field = fields.get(i);
            field.dataset.address = address + '.' + (i + 1);
            field.childNodes[0].innerHTML = '[' + (i + 1) + '] ' + labelText;
            field.querySelector('span.data').dataset.address = address + '.' + (i + 1);
        }

        console.log(count);
        if (event.isTrigger !== 3)
        {
            var message = {
                sender : 'telecommande',
                operation : 'copy'
            };
            message[line.dataset.address] = null ;
            ws.send(JSON.stringify(message));
        }

        if (count + 1 === parseInt(instancesMax))
        {
            var copyLinks = ul.querySelectorAll('a[data-action="copy"]');
            for (var i = 0; i < copyLinks.length; i++) {
                copyLinks[i].classList.add('hidden');
            }
        }
        else if (count === parseInt(instancesMin))
        {
            var deleteLinks = ul.querySelectorAll('a[data-action="delete"]');
            for (var i = 0; i < deleteLinks.length; i++) {
                deleteLinks[i].classList.remove('hidden');
            }
        }
    }
    else
    {
        alert('Nombre maximum de champs atteint');
    }

    return false;
};

ListBuilder.deleteField = function(event)
{
    var line = this.parentNode.parentNode;
    var ul = line.parentNode;
    var instanceAddress = line.dataset.address ;
    var addressArray = instanceAddress.split('.');
    var position = addressArray[addressArray.length - 1];
    addressArray.pop() ;
    var address = addressArray.join('.') ;
    var fields = $(ul).children('li[data-address^="' + address + '"]');
    var count = fields.length;
    var instanceBounds = line.dataset.instanceBounds.split(' ');
    var instancesMin = instanceBounds[0];
    var instancesMax = instanceBounds[1];
    if (count > instancesMin)
    {
        var newLine = line.remove();
        var newPosition = parseInt(position) + 1;
        var label = line.childNodes[0].innerHTML;
        var labelText = label.substring(label.indexOf(']') + 1, label.length);
        
        for (var i = newPosition; i < count; i++)
        {
            var field = fields.get(i);
            field.dataset.address = address + '.' + (i - 1);
            field.childNodes[0].innerHTML = '[' + (i - 1) + '] ' + labelText;
            field.querySelector('span.data').dataset.address = address + '.' + (i - 1);
        }

        console.log(count);
        if (event.isTrigger !== 3)
        {
            var message = {
                sender : 'telecommande',
                operation : 'delete'
            };
            message[line.dataset.address] = null ;
            ws.send(JSON.stringify(message));
        }        

        if (count === parseInt(instancesMax))
        {
            var copyLinks = ul.querySelectorAll('a[data-action="copy"]');
            for (var i = 0; i < copyLinks.length; i++) {
                copyLinks[i].classList.remove('hidden');
            }
        }
        else if (count - 1 === parseInt(instancesMin))
        {
            var deleteLinks = ul.querySelectorAll('a[data-action="delete"]');
            for (var i = 0; i < deleteLinks.length; i++) {
                deleteLinks[i].classList.add('hidden');
            }
        }

        console.log(parseInt(instancesMin), count - 1)
    }
    else
    {
        alert('Nombre minimum de champs atteint');
    }

    return false;
};

ListBuilder.copyNode = function(event) {
    var line = this.parentNode.parentNode.parentNode;
    var ul = line.parentNode;
    var addressArray = line.dataset.address.split('.');
    
    var position = addressArray[addressArray.length - 1];
    addressArray.pop() ;
    var address = addressArray.join('.') ;
    
    var nodes = $(ul).children('li[data-address^="' + address + '"]');
    var count = nodes.length;
    var instanceBounds = line.dataset.instanceBounds.split(' ');
    var instancesMin = instanceBounds[0];
    var instancesMax = instanceBounds[1];
    if (count < instancesMax)
    {
        var newLine = line.cloneNode(true);
        var newPosition = parseInt(position) + 1;
        var newAddress = address + '.' + newPosition;

        var label = line.childNodes[0].childNodes[2].innerHTML;
        var labelText = label.substring(label.indexOf(']') + 1, label.length);
        newLine.childNodes[0].childNodes[2].innerHTML = '[' + (newPosition) + '] ' + labelText;

        newLine.dataset.address = newAddress;

        function changeChildrenAddress(newLine, newAddress)
        {
            var nodesWithAddressesToChange = newLine.querySelectorAll('[data-address^="' + address + '"]');
            for (var i = 0; i < nodesWithAddressesToChange.length; i++)
            {
                var relativeAddressLength = line.dataset.address.length;
                var endOfAddress = nodesWithAddressesToChange[i].dataset.address.substring(relativeAddressLength);
                nodesWithAddressesToChange[i].dataset.address = newAddress + endOfAddress;
            }
        }
        changeChildrenAddress(newLine, newAddress) ;

        ul.insertBefore(newLine, line.nextSibling);
        console.log(newPosition, newLine);
        for (var i = newPosition; i < count; i++)
        {
            var node = nodes.get(i);
            node.dataset.address = address + '.' + (i + 1);
            node.childNodes[0].childNodes[2].innerHTML = '[' + (i + 1) + '] ' + labelText;
//            node.querySelector('span.data').dataset.address = address + '.' + (i + 1);
            changeChildrenAddress(node, address + '.' + (i + 1)) ;
        }

        console.log(count);
        if (event.isTrigger !== 3)
        {
            var message = {
                sender : 'telecommande',
                operation: 'copy'
            };
            message[line.dataset.address] = null ;
            ws.send(JSON.stringify(message));
        }

        if (count + 1 === parseInt(instancesMax))
        {
            var copyLinks = ul.querySelectorAll('a[data-action="copy"]');
            for (var i = 0; i < copyLinks.length; i++) {
                copyLinks[i].classList.add('hidden');
            }
        }
        else if (count === parseInt(instancesMin))
        {
            var deleteLinks = ul.querySelectorAll('a[data-action="delete"]');
            for (var i = 0; i < deleteLinks.length; i++) {
                deleteLinks[i].classList.remove('hidden');
            }
        }
        $('ul.dynamicNode').sortable(nodeSortableOptions).on('sortupdate', refreshDynamicNode);
        $('ul.dynamicField').sortable(fieldSortableOptions).on('sortupdate', refreshDynamicField);
    }
    else
    {
        alert('Nombre maximum de noeuds atteint');
    }

    return false;
} ;

ListBuilder.deleteNode = function(event) {
    var line = this.parentNode.parentNode.parentNode;
    var ul = line.parentNode;
    var addressArray = line.dataset.address.split('.');
    var position = addressArray[addressArray.length - 1];
    addressArray.pop() ;
    var address = addressArray.join('.') ;
    var nodes = $(ul).children('li[data-address^="' + address + '"]');
    var count = nodes.length;
    var instanceBounds = line.dataset.instanceBounds.split(' ');
    var instancesMin = instanceBounds[0];
    var instancesMax = instanceBounds[1];
    if (count > instancesMin)
    {
        line.remove();
        var newPosition = parseInt(position) + 1;
        var label = line.childNodes[0].childNodes[2].innerHTML;
        var labelText = label.substring(label.indexOf(']') + 1, label.length);
        
        for (var i = newPosition; i < count; i++)
        {
            var node = nodes.get(i);
            node.dataset.address = address + '.' + (i - 1);
            node.childNodes[0].childNodes[2].innerHTML = '[' + (i - 1) + '] ' + labelText;
            var nodesWithAddressesToChange = node.querySelectorAll('[data-address^="' + address + '"]');
            console.log(nodesWithAddressesToChange) ;
            console.log(count);
            for (var j = 0; j < nodesWithAddressesToChange.length; j++)
            {
                var relativeAddressLength = line.dataset.address.length;
                var endOfAddress = nodesWithAddressesToChange[j].dataset.address.substring(relativeAddressLength);
                nodesWithAddressesToChange[j].dataset.address = node.dataset.address + endOfAddress;
            }
        }

        console.log(count);
        if (event.isTrigger !== 3)
        {
            var message = {
                sender : 'telecommande',
                operation: 'delete'
            };
            message[line.dataset.address] = null ;
            ws.send(JSON.stringify(message));
        }

        if (count === parseInt(instancesMax))
        {
            var copyLinks = ul.querySelectorAll('a[data-action="copy"]');
            for (var i = 0; i < copyLinks.length; i++) {
                copyLinks[i].classList.remove('hidden');
            }
        }
        else if (count - 1 === parseInt(instancesMin))
        {
            var deleteLinks = ul.querySelectorAll('a[data-action="delete"]');
            for (var i = 0; i < deleteLinks.length; i++) {
                deleteLinks[i].classList.add('hidden');
            }
        }

        console.log(parseInt(instancesMin), count - 1) ;
    }
    else
    {
        alert('Nombre minimum de noeuds atteint');
    }

    return false;
} ;