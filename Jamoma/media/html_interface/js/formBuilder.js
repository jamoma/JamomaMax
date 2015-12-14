
function FormBuilder() {
    var _this = this ;

    this.buildNode = function(label)
    {
        return this.buildFieldset(label) ;
    } ;

    this.buildFieldset = function(label)
    {
        var fieldset = document.createElement('fieldset') ;
        var legend = document.createElement('legend') ;
        legend.innerHTML = label ;
        fieldset.appendChild(legend) ;
        return fieldset ;
    } ;

    this.buildLine = function(labelText, params)
    {
        var line = document.createElement('div') ;

        var label = document.createElement('label') ;
        label.innerHTML = labelText + ' ' ;
        line.appendChild(label) ;

        var input = this.buildInput(params) ;
        line.appendChild(input) ;

        line.addEventListener('click', this.transformToInput, false) ;

        return line ;
    } ;

    this.buildInput = function(params)
    {
        var input = document.createElement('span') ;
        input.setAttribute('data-type', params.type) ;
        input.setAttribute('data-value', params.valueDefault) ;
        input.setAttribute('title', params.description) ;

        if(params.type === 'integer' || params.type === 'decimal')
        {
            var bounds = params.rangeBounds.split(' ') ;
            input.setAttribute('data-min', bounds[0]) ;
            input.setAttribute('data-max', bounds[1]) ;
            input.setAttribute('data-step', params.valueStepsize) ;
        }

        input.innerHTML = params.valueDefault ;

        return input ;
    } ;

    this.transformToInput = function(event)
    {
        this.removeEventListener('click', arguments.callee, false) ;
        var span = this.getElementsByTagName('span')[0] ;
        console.log(span) ;
        switch(span.getAttribute('data-type'))
        {
            case 'integer' :
                var input = document.createElement('input') ;
                input.type = 'range' ;
                break ;
        }
        input.addEventListener('blur', _this.transformToSpan, false) ;
        this.appendChild(input) ;
        input.focus() ;
    } ;

    this.transformToSpan = function(event)
    {
        console.log(this) ;
    } ;
}