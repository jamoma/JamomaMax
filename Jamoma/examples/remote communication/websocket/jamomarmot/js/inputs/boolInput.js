function BoolInput(attributes, parentLi)
{
    this.attributes = attributes;
    var span = parentLi.getElementsByTagName('span')[0];
    var lb = builder;

    var _this = this;
    var label = document.createElement('label') ;
    label.classList.add('switch-light', 'switch-candy') ;
    var input = document.createElement('input');
    input.type = 'checkbox';
    if (attributes.value === 'true' || attributes.value === 1)
    {
        input.checked = true;
    }
    label.appendChild(input) ;
    var parentSpan = document.createElement('span') ;
    var offSpan = document.createElement('span') ;
    offSpan.innerHTML = 'false' ;
    var onSpan = document.createElement('span') ;
    onSpan.innerHTML = 'true' ;
    parentSpan.appendChild(offSpan) ;
    parentSpan.appendChild(onSpan) ;
    label.appendChild(parentSpan) ;
    label.appendChild(document.createElement('a')) ;

    this.getHTML = function() {
        return label;
    };

    this.setEvents = function() {
        input.addEventListener('change', _this.change, false);
    };

    this.change = function() {
        var value ;
        if(input.checked)
        {
            value = 'true' ;
        }
        else
        {
            value = 'false' ;
        }
        console.log(value);
        span.setAttribute('data-value', value);
        span.innerHTML = value;
        var address = span.dataset.address;
        var message = {
            sender : 'telecommande',
            operation: 'valueChange'
        };
        message[address] = Boolean(value) ;
        ws.send(JSON.stringify(message));
		value = value === 'true' ? true : false;
		Preset.setValue(address, value);
        //_this.transformToSpan();
        return false;
    };

    this.transformToSpan = function() {
        label.remove();
        parentLi.classList.remove('editable');
        span.classList.remove('hidden');
        console.log('transformToSpan');

        var message = {
            sender : 'telecommande',
            operation : 'modifying'
        };
        message[attributes.address] = false ;
        ws.send(JSON.stringify(message));
    };

    this.setEvents();
}