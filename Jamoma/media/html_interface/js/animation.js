var Animation = function() {};

Animation.savePreset = function() {
    var message = {
        message: 'savePreset',
        appName: 'leonard',
        file: Animation.preset
    };
    ws.send(JSON.stringify(message));
};