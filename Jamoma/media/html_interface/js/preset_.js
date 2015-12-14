var Preset = function(){} ;

Preset.getValue = function(address) {
    return Preset.accessJson(address, 'get');
} ;

Preset.setValue = function(address, value)
{
//    Preset.accessJson(address, 'set', value);
    var message = {
        'message' : 'set',
        'address' : address,
        'value' : value
    } ;
    ws.send(JSON.stringify(message)) ;
} ;

Preset.deleteField = function(address) {
    Preset.accessJson(address, 'delete') ;
} ;

Preset.copyField = function(address) {
    var source = Preset.getValue(address) ;
    var addressArray = address.split('.');
    var position = addressArray[addressArray.length - 1];
    addressArray.pop() ;
    var newAddress = addressArray.join('.') + '.' + (+position + 1);
    Preset.insertField(newAddress, source);
} ;

Preset.insertField = function(address, data)
{
    Preset.accessJson(address, 'insert', data) ;
} ;

Preset.moveField = function(sourceAddress, destAddress) {
    var source = Preset.getValue(sourceAddress) ;
    Preset.deleteField(sourceAddress) ;
    Preset.insertField(destAddress, source) ;
    console.log(Animation.preset) ;
} ;

Preset.accessJson = function(address, action, value) {
    var currentNode = Animation.preset;
    var tabAddress = address.split('/');

    //On va chercher l'objet à l'adresse indiquée dans le namespace
    for (var i = 0; i < tabAddress.length; i++) {
        //Si on est sur la dernière partie de l'adresse (cible)
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