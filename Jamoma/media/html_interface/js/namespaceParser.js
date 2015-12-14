
function NamespaceParser(namespace, builder) {
    this.namespace = namespace ;
    this.form = null ;
    this.builder = builder ;

    /**
     * Construit et retourne le formulaire du namespace
     * @return {[DOMElement Form]} [Formulaire contenant la structure HTML]
     */
    this.getForm = function() {
        this.form = document.createElement('form') ;
        this.form.appendChild(this.parse(this.namespace, '')) ;
        return this.form ;
    };

    this.parse = function(node, address) {
        var fragment = document.createDocumentFragment() ;
        for(var label in node)
        {
            if(address == '')
            {
                var absoluteAddress = label ;
            }
            else
            {
                var absoluteAddress = address + '/' + label ;
            }
            console.log(absoluteAddress) ;
            if(typeof(node[label]) === 'object'){

                switch(typeof(node[label]['type'])) {
                    //Si le noeud n'a pas de type (pas un champ)
                    case 'undefined':
                        console.log(node) ;
                        node.label = label ;
                        var li = this.builder.buildNode(node) ;
                        var ul = document.createElement('ul') ;
                        ul.appendChild(this.parse(node[label], absoluteAddress)) ;
                        li.appendChild(ul) ;
                        fragment.appendChild(li) ;
                        break ;

                    //Si le noeud a un type, c'est un champ
                    default:
                        node[label].label = label ;
                        node[label].address = absoluteAddress ;
                        fragment.appendChild(this.builder.buildLine(node[label])) ;
                    break ;
                }
            }
        }
        return fragment ;
    } ;
}