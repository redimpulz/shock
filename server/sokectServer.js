var WebSocketServer = require('ws').Server
    , http = require('http')
    , express = require('express')
    , app = express();

    var bodyParser = require('body-parser');
    var spawn = require('child_process').spawn;
    var ruby = spawn('ruby', ['../waitingData.rb']);
 
app.use(express.static('../frontend'));
app.use(bodyParser.urlencoded({ extended: false }));
var server = http.createServer(app);
var wss = new WebSocketServer({server:server});



app.post('/text', function(req, res) {
    var text = req.body.text;
    close.log(text)
    exec('ruby ../serialSend.rb' + ' ' + text , function(err, stdout, stderr) {
        /* some process */
        console.log(stdout);
    });
    res.redirect("/");

});
 
//Websocket接続を保存しておく
var connections = [];
 
//接続時
wss.on('connection', function (ws) {
    //配列にWebSocket接続を保存
    connections.push(ws);
    //切断時
    ws.on('close', function () {
        connections = connections.filter(function (conn, i) {
            return (conn === ws) ? false : true;
        });
    });
    //メッセージ送信時
    ws.on('message', function (message) {
        console.log('message:', message);
        ruby.stdin.write(message+"\n");
        broadcast(JSON.stringify(message));
    });
});
 
//ブロードキャストを行う
function broadcast(message) {
    connections.forEach(function (con, i) {
        con.send(message);
    });
};

server.listen(8080);