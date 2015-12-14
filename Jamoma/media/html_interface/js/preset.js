var Preset = function() {
};

Preset.getValue = function(address) {
    return Preset.accessJson(address, 'get');
};

Preset.setValue = function(address, value)
{
    var message = {
        sender : 'telecommande',
        operation: 'set'
    };
    message[address] = value ;
    ws.send(JSON.stringify(message));
};

Preset.deleteField = function(address) {
    var message = {
        sender: 'telecommande',
        operation : 'delete'
    };
    message[address] = null ;
    ws.send(JSON.stringify(message));
};

Preset.copyField = function(address) {
    var message = {
        sender : 'telecommande',
        operation : 'copy'
    };
    message[address] = null ;
    ws.send(JSON.stringify(message));
};

Preset.moveField = function(sourceAddress, destAddress) {
    var message = {
        sender : 'telecommande',
        operation : 'move'
    };
    message[sourceAddress] = destAddress ;
    ws.send(JSON.stringify(message));
};

Preset.accessJson = function(address, action, value) {
    var currentNode = Animation.preset;
    var tabAddress = address.split('/');

    //On va chercher l'objet à l'adresse indiquée dans le namespace
    for (var i = 0; i < tabAddress.length; i++) {
        //Si on est bien sur la cible
        if (i === tabAddress.length - 1)
        {
            //process action
            if (typeof currentNode[tabAddress[i]] !== 'undefined')
            {
                switch (action)
                {
                    case 'get' :
                        return currentNode[tabAddress[i]];
                        break;
                    case 'set' :
                        currentNode[tabAddress[i]] = value;
                        break;
                    case 'delete' :
                        delete currentNode[tabAddress[i]];
                        break;
                    case 'insert' :
                        currentNode[tabAddress[i]] = value;
                        break;
                }
            }
            //Instances dynamiques
            else if (tabAddress[i].indexOf('.') > 0)
            {
                var nodeArray = tabAddress[i].split('.');
                var nodeName = nodeArray[0];
                var nodeIndex = nodeArray[1];

                if (Array.isArray(currentNode[nodeName]))
                {
                    if (typeof currentNode[nodeName][nodeIndex] !== 'undefined')
                    {
                        switch (action)
                        {
                            case 'get' :
                                return currentNode[nodeName][nodeIndex];
                                break;
                            case 'set' :
                                currentNode[nodeName][nodeIndex] = value;
                                break;
                            case 'delete' :
                                currentNode[nodeName].splice(nodeIndex, 1);
                                break;
                            case 'insert' :
                                currentNode[nodeName].splice(nodeIndex, 0, value);
                                break;
                        }
                    }
                    else
                    {
                        switch (action)
                        {
                            case 'set' :
                                currentNode[nodeName][nodeIndex] = value;
                                break;
                            case 'insert' :
                                currentNode[nodeName].splice(nodeIndex, 0, value);
                                break;
                            default :
                                console.error('Parameter ' + tabAddress[i] + ' is not defined.',
                                        'Address : ' + address);
                                break;
                        }
                    }
                }
                else
                {
                    console.error('Parameter ' + tabAddress[i] + ' is not saved as dynamic.',
                            'Address : ' + address);
                }
            }
            else
            {
                switch (action)
                {
                    case 'set' :
                        currentNode[tabAddress[i]] = value;
                        break;
                    case 'insert' :
                        currentNode[tabAddress[i]] = value;
                        break;
                    default :
                        console.error('Parameter ' + tabAddress[i] + ' is not defined.',
                                'Address : ' + address);
                        break;
                }

            }
        }
        else
        {
            //Continue traversing
            if (typeof currentNode[tabAddress[i]] === 'object')
            {
                currentNode = currentNode[tabAddress[i]];
            }
            //Instances dynamiques
            else if (tabAddress[i].indexOf('.') > 0)
            {
                var nodeArray = tabAddress[i].split('.');
                var nodeName = nodeArray[0];
                var nodeIndex = nodeArray[1];

                if (Array.isArray(currentNode[nodeName]))
                {
                    if (typeof currentNode[nodeName][nodeIndex] === 'object')
                    {
                        currentNode = currentNode[nodeName][nodeIndex];
                    }
                    else
                    {
                        console.error('Node ' + tabAddress[i] + ' is not defined.',
                                'Address : ' + address);
                    }
                }
                else
                {
                    console.error('Node ' + tabAddress[i] + ' is not saved as dynamic.',
                            'Address : ' + address);
                }
            }
            else
            {
                console.error('Node ' + tabAddress[i] + ' is not defined.',
                        'Address : ' + address);
            }
        }
    }
};

Preset.getNode = function(path) {
    path.replace('.', '/');
    var obj = Animation.preset;
    var parts = path.split('/');
    while (parts.length - 1 && (obj = obj[parts.shift()]))
        ;
    return obj;
};