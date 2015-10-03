//expressモジュールをインポート
var express = require('express');
var exec = require('child_process').exec;
var app = express();
var bodyParser = require('body-parser');

app.use(express.static('../frontend'));
app.use(bodyParser.urlencoded({ extended: false }));

//ルーティング設定
// app.get('/', function(req, res) {
//     res.send('Hello World');
// });

// app.get('/chr/:chr', function(req, res) {
//     exec('ruby ../serialSend.rb' + ' ' +　re , function(err, stdout, stderr) {
//         /* some process */
//         console.log(stdout);
//     });
//     res.send(req.params.chr);
// });

app.post('/text', function(req, res) {
    var text = req.body.text;
    
    exec('ruby ../serialSend.rb' + ' ' + text , function(err, stdout, stderr) {
        /* some process */
        console.log(stdout);
        res.send('end');
    });
    res.send('end');

});
app.get('/test', function(req, res) {
    var text = req.body.text;
    
    exec('ruby ../serialSend.rb' + ' ' + 'a' , function(err, stdout, stderr) {
        /* some process */
        console.log(stdout);
        console.log(stderr);
    });
    res.send('end');

});
//以下、ルーティング情報があればここに追記していく

app.listen(3000);
console.log('Server running at http://localhost:3000/');
