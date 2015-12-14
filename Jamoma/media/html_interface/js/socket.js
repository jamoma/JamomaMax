var socket = function() {
    var settings,

    connect = function(_settings) {
        settings = _settings;
        var connection = new WebSocket(settings.host);

        console.log('connection', connection) ;
        connection.onopen = function () {
            console.log('open') ;
        };

        connection.onmessage = function (message) {
            console.log(message) ;
        };

        this.send = function (message) {
            connection.send(message) ;
        }
    }

    return {
        connect: connect
    };
}();

$(document).ready(function () {
    var settings = {
        host: 'ws://local.dev:9000'
    };

    ws = socket.connect(settings);
    ws.send('test');
});
