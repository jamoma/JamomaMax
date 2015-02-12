function RangeInput(attributes, parentLi)
{
    this.attributes = attributes;
    var span = parentLi.getElementsByTagName('span')[0];
    var lb = builder;

    var _this = this;
    var rangeInput = document.createElement('input');
    rangeInput.type = 'range';
    rangeInput.min = attributes.min;
    rangeInput.max = attributes.max;
    rangeInput.step = attributes.step;
    rangeInput.value = attributes.value;
    var numberInput = document.createElement('input');
    numberInput.type = 'number';
    numberInput.min = attributes.min;
    numberInput.max = attributes.max;
    numberInput.step = attributes.step;
    numberInput.value = attributes.value;
    var fragment = document.createDocumentFragment();
    fragment.appendChild(numberInput);
    fragment.appendChild(rangeInput);
    
    this.value = attributes.value ;

    this.getHTML = function() {
        return fragment;
    };

    this.setEvents = function() {
        rangeInput.addEventListener('input', _this.rangeChange, false);
        rangeInput.addEventListener('change', _this.transformToSpan, false);
        numberInput.addEventListener('change', _this.numberChange, false);
        numberInput.addEventListener('blur', _this.transformToSpan, false);
    };

    this.rangeChange = function() {
        console.log('rangeChange', rangeInput.value);
        numberInput.value = rangeInput.value;
        _this.change(rangeInput.value);
    };

    this.numberChange = function() {
        console.log('numberChange', numberInput.value);
        rangeInput.value = numberInput.value;
        _this.change(numberInput.value);
    };

    this.change = function(value) {
        _this.value = value;
        span.setAttribute('data-value', value);
        span.innerHTML = value;
        Preset.setValue(attributes.address, parseFloat(_this.value));
    };

    this.transformToSpan = function() {
        ListBuilder.currentInput = undefined ;
        Preset.setValue(attributes.address, parseFloat(_this.value));
        rangeInput.remove();
        numberInput.remove();
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
