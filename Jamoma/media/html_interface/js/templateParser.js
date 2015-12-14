
function TemplateParser(template, ns, builder) {
    this.template = template;
    this.builder = builder;
    this.ns = ns;
    this.maxOpenDepth = 3;
    this.ul = document.createElement('ul');
    var _this = this;
    var relativeAddress = "";
    var parentAddress = "";

    this.getForm = function() {
        var li = document.createElement('li');
        li.classList.add('node');
        this.ul.appendChild(li);
        var div = document.createElement('div');
        div.classList.add('toggle', 'open');
        div.innerHTML = this.template.label;
        li.appendChild(div);
        li.appendChild(this.parse(this.template, 0));
        return this.ul;
    };

    this.parse = function(node, currentDepth) {
        function buildNode()
        {
            var li = _this.builder.buildNode(node[child], open);
            li.appendChild(_this.parse(node[child], currentDepth));
            fragment.appendChild(li);
        }
        
        var fragment = document.createDocumentFragment();
        
        for (var child in node)
        {
            switch (child) {
                case 'content' :
                    var ul = document.createElement('ul');
                    if (currentDepth > this.maxOpenDepth)
                    {
                        ul.style.display = 'none'; 
                    }
                    else
                    {
                        ul.style.display = 'block';
                    }
                    var li = this.parse(node[child], currentDepth);
                    ul.appendChild(li);
                    fragment.appendChild(ul);
                    break;

                case 'node' :
                    currentDepth += 1;
                    var open = currentDepth < this.maxOpenDepth;
                    if (node[child]['dynamicInstances'])
                    {
                        //console.log("node[child]['address']", node[child]['address'])
                        if (node[child]['address'])
                        {
                            if (node[child]['instanceBounds'])
                            {
                                relativeAddress = node[child]['address'];
                                instanceBounds = node[child]['instanceBounds'].split(' ');
                                instancesMin = instanceBounds[0];
                                instancesMax = instanceBounds[1];
                                var originalLabel = node[child]['label'];
                                
                                var li = document.createElement('li');

                                var label = document.createElement('label');
                                label.innerHTML = originalLabel;
                                label.classList.add('node');
                                li.appendChild(label);

                                var ul = document.createElement('ul');
                                ul.classList.add('dynamicNode');
                                li.appendChild(ul);
                                
                                var i = 0 ;
                                while(i < instancesMin || typeof(Preset.getValue(relativeAddress + "." + i)) !== 'undefined')
                                {
                                    //console.log(relativeAddress + "." + (i + 1), Preset.getValue(relativeAddress + "." + (i + 1))) ;
                                    node[child]['label'] = "[" + i + "] ";
                                    parentAddress = relativeAddress + "." + i;
                                    node[child]['address'] = parentAddress ;
                                    var nodeLi = _this.builder.buildNode(node[child], open);
                                    nodeLi.appendChild(_this.parse(node[child], currentDepth));
                                    ul.appendChild(nodeLi);
                                    i++ ;
                                }
                                fragment.appendChild(li) ;
                            }
                            else
                            {
                                console.error('Impossible de créer un noeud dynamique sans les limites d\'instances', node[child]);
                                buildNode();
                            }
                        }
                        else
                        {
                            console.error('Impossible de créer un noeud dynamique sans adresse', node[child]);
                            buildNode();
                        }
                    }
                    else
                    {
                        buildNode();
                    }
                    break;

                case 'input':
                    if (typeof(node[child]['relativeAddress']) !== 'undefined')
                    {
                        var address = relativeAddress + '/' + node[child]['relativeAddress'];
                        node[child]['address'] = parentAddress + '/' + node[child]['relativeAddress'];
                    }
                    else if (typeof (node[child]['address']) !== 'undefined')
                    {
                        var address = node[child]['address'];
                    }
                    else
                    {
                        console.error('No address defined for', node[child]);
                        break;
                    }

                    var tabAddress = address.split('/');
                    var ns = this.ns;

                    //On va chercher l'objet à l'adresse indiquée dans le namespace
                    for (var i = 0; i <= tabAddress.length - 1; i++) {
                        if (typeof (ns[tabAddress[i]]) === 'object')
                        {
                            ns = ns[tabAddress[i]];
                        }
                        else
                        {
                            //On affiche une erreur dans la console
                            console.error('Paramètre ' + tabAddress[i] + ' introuvable', "Addresse : " + address);
                            //et on crée un objet si on ne le trouve pas
                            //attr = {valueDefault : 'paramètre inconnu'} ;
                        }
                    }

                    //On crée un nouvel objet puis on copie les données dedans
                    //pour ne pas copier la référence de ns sinon les modifications
                    //sont appliquées à l'objet de base
                    var attr = new Object(ns);

                    if (typeof (attr['type']) !== 'undefined')
                    {
                        //On écrase les paramètres du namespace avec ceux du template
                        for (var key in node[child])
                        {
                            if (node[child].hasOwnProperty(key))
                                attr[key] = node[child][key];
                        }

                        if (node[child]['dynamicInstances'] === true)
                        {
                            if (node[child]['instanceBounds'])
                            {
                                var instanceBounds = node[child]['instanceBounds'].split(' ');
                                var instancesMin = instanceBounds[0];
                                var instancesMax = instanceBounds[1];
                                
                                var originalLabel = attr.label;
                                var originalAddress = attr.address;

                                var li = document.createElement('li');

                                var label = document.createElement('label');
                                label.innerHTML = originalLabel;
                                label.classList.add('input');
                                li.appendChild(label);

                                var ul = document.createElement('ul');
                                ul.classList.add('dynamicField');
                                li.appendChild(ul);

                                var i = 0 ;
                                while(i < instancesMin || typeof(Preset.getValue(originalAddress + "." + i)) !== 'undefined')
                                {
                                    attr['label'] = "[" + i + "] => ";
                                    attr['address'] = originalAddress + "." + i;
                                    var presetValue = Preset.getValue(attr['address']) ;
                                    if(typeof(presetValue) !== 'undefined')
                                    {
                                        attr['value'] = presetValue ;
                                    }
                                    ul.appendChild(this.builder.buildLine(attr));
                                    i++ ;
                                }
                                fragment.appendChild(li);
                            }
                            else
                            {
                                console.error('Impossible de créer un noeud dynamique sans les limites d\'instances', node[child]);
                                fragment.appendChild(this.builder.buildLine(attr));
                            }
                        }
                        else
                        {
                            var presetValue = Preset.getValue(attr['address']) ;
                            if(typeof(presetValue) !== 'undefined')
                            {
                                attr['value'] = presetValue ;
                            }
                            fragment.appendChild(this.builder.buildLine(attr));
                        }
                    }

                    break;

                    //Si on est dans un tableau d'objets
                default :
                    if (typeof (node[child]) === 'object')
                        fragment.appendChild(this.parse(node[child], currentDepth));
                    break;
            }
        }

        return fragment;
    }
}