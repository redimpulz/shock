# shock

※macでしか動作を確認していません

#使い方

##クイズアプリ
serverディレクトリ内で

```
node app.js
```

そのあとlocalhostの3000番ポートにアクセスしてください
ちなみにserialSend.rbのなかで

``` 
def initialize()
		@lenDiv = 0.265625
		@stopCmd = [0x55]
		@power = 623
		@frac = 50
		@z = 150
		@baudRate = 38400
		@sp = SerialPort.new("/dev/tty.usbserial-142A", @baudRate, 8, 1, SerialPort::NONE)
	end
```

@spでシリアルポートを決め打ちしているので、適宜変えてください。すいません

それから、app.jsの中で使っているパッケージも適宜インストールしてくださいすいません。

###ペンタブで送るやつ
websocketで通信するためのサーバファイルが別になっています。
ちなみにsocketServer.jsです
app.jsとsocketServer.jsを二つ起動します
localhost:3000/websk.htmlにアクセスする

正直、よく落ちるのでその都度立ち上げてください
rubyのファイルに問題があるのでrubyが落ちた時に再起動すればいいのですが
よくわからないのでやってませんすいません
nodeの方でrubyのエラーメッセージを拾って再起動するか
rubyの例外処理をきちんとするかすれば解決すると思いますすいません

ペンタブで筆圧検知をするにはワコムのペンタブでfirefoxに専用のプラグインをインスタールする必要があります。
別になくても筆圧検知しなくなるだけで問題ありません


