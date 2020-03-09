import 'package:flutter/material.dart';
import 'package:flutter_qyyim/tool/platform_utils.dart';
import 'package:web_socket_channel/io.dart';

import 'package:web_socket_channel/status.dart' as status;


class WsPage extends StatefulWidget {
  @override
  _WsPageState createState() => new _WsPageState();
}

class _WsPageState extends State<WsPage> {
  IOWebSocketChannel channel;

  @override
  void initState() {
    channel = IOWebSocketChannel.connect('ws://echo.websocket.org',
        pingInterval: Duration(minutes: 3));
    super.initState();
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('websocket_demo'),
      ),
      body: Column(
        children: <Widget>[
          StreamBuilder(
            stream: channel?.stream,
            builder: (context, snapshot) {
              print("object-------");
              return Text(snapshot.hasData ? '${snapshot.data}' : '');
            },
          ),
          RaisedButton(
            child: Text('connect'),
            onPressed: () {
              //channel.sink.add("connected!"); // 将数据发送到服务器
              /*channel.stream.listen((message) {
                //channel.sink.add("received!" + message);
                //channel.sink.close(status.goingAway); // 关闭WebSocket连接
                print("received!$message");
                setState(() {});
              },onError: (error){
                print("error$error");
              },onDone: (){

              });*/
            },
          ),
          RaisedButton(
            child: Text('send'),
            onPressed: () {
              channel.sink.add("connected!"); // 将数据发送到服务器
            },
          )
        ],
      ),
    );
  }
}
