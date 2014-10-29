function InputFactory(attributes, parentLi)
{
    this.attributes = attributes ;

    this.getInput = function()
    {
        var input ;
        switch(attributes.type)
        {
            case 'integer' :
                input = new RangeInput(attributes, parentLi) ;
                break ;
            case 'decimal' :
                input = new RangeInput(attributes, parentLi) ;
                break ;
            case 'string' :
                input = new TextInput(attributes, parentLi) ;
                break ;
            case 'boolean' :
                input = new BoolInput(attributes, parentLi) ;
                break ;
            default :
                input = new TextInput(attributes, parentLi) ;
                break ;
        }
        return input ;
    } ;

    this.getBoolInput = function()
    {
        var span = document.createElement('span') ;
        var lbTrue = document.createElement('label') ;
        lbTrue.innerHTML = 'true' ;
        var cbTrue = document.createElement('input') ;
        lbTrue.appendChild(cbTrue) ;
        var lbFalse = document.createElement('label') ;
        lbFalse.innerHTML = 'false' ;
        var cbFalse = document.createElement('input') ;
        lbFalse.appendChild(cbFalse) ;
        cbTrue.type = cbFalse.type = 'radio' ;
        span.appendChild(lbTrue) ;
        span.appendChild(lbFalse) ;
        return span ;
    } ;
}