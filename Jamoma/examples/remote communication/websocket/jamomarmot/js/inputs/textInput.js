function TextInput(attributes, parentLi)
{
    this.attributes = attributes ;
    var span = parentLi.getElementsByTagName('span')[0] ;
    var lb = builder ;

    var _this = this ;
    var input = document.createElement('input') ;
        input.type = 'text' ;
        input.value = attributes.value ;
        input.style.width = ((attributes.value.length + 1) * 8) + 'px' ;
        input.setAttribute('autofocus', 'autofocus') ;

    this.getHTML = function(){
        return input ;
    } ;

    this.setEvents = function() {
        //input.addEventListener('keyup', _this.change, false) ;
        input.addEventListener('change', _this.change, false) ;
        input.addEventListener('blur', _this.transformToSpan, false) ;
        input.addEventListener('focus', function(){
            this.select() ;
        }) ;
        input.addEventListener('keydown', function(){
            this.style.width = ((this.value.length + 1) * 8) + 'px';
        }) ;
    } ;

    this.change = function() {
        console.log(input.value) ;
        span.setAttribute('data-value', input.value) ;
        span.innerHTML = input.value ;
        var address = span.dataset.address ;
        var message = {
            sender : 'telecommande',
            operation : 'valueChange'
        } ;
        message[address] = input.value ;
        ws.send(JSON.stringify(message)) ;
        Preset.setValue(address, input.value);
        _this.transformToSpan() ;
        return false ;
    } ;

    this.transformToSpan = function() {
        input.remove() ;
        parentLi.classList.remove('editable') ;
        span.classList.remove('hidden') ;
        console.log('transformToSpan') ;

        var message = {
            sender : 'telecommande',
            operation : 'modifying'
        } ;
        message[attributes.address] = false ;
        ws.send(JSON.stringify(message)) ;
    } ;

    this.setEvents() ;
}