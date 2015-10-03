//expressモジュールをインポート
var express = require('express');
var exec = require('child_process').exec;
var app = express();
var bodyParser = require('body-parser');

app.use(express.static('../frontend'));
app.use(bodyParser.urlencoded({ extended: false }));


app.post('/text', function(req, res) {
    var text = req.body.text;
    
    exec('ruby ../serialSend.rb' + ' ' + text , function(err, stdout, stderr) {
        /* some process */
        console.log(stdout);
        res.send('end');
    });
 

});


//以下、ルーティング情報があればここに追記していく

app.listen(3000);
console.log('Server running at http://localhost:3000/');
