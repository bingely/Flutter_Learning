import 'package:flutter/material.dart';
import 'package:flutter_qyyim/tool/platform_utils.dart';
import 'package:web_socket_channel/io.dart';
import 'ws_manager.dart';
import 'package:web_socket_channel/status.dart' as status;


class WsPage extends StatefulWidget {
  @override
  _WsPageState createState() => new _WsPageState();
}

class _WsPageState extends State<WsPage> {
  WsManager _wsManager;
  @override
  void initState() {
    _wsManager = WsManager.getInstance();
    _wsManager.connect();

    super.initState();
  }

  @override
  void dispose() {
    _wsManager.close();
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
         /* StreamBuilder(
            stream: channel?.stream,
            builder: (context, snapshot) {
              print("object-------");
              return Text(snapshot.hasData ? '${snapshot.data}' : '');
            },
          ),*/
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

              /*RequestMap.requestNotPayOrder(context)
                  .timeout(Duration(seconds: Utils.getConnectTime()), onTimeout: (sink) {
                ShowLoadLoadingDialog.hideLoadingDialog();
              }).listen((data) async {
                ShowLoadLoadingDialog.hideLoadingDialog();
                if (data?.data != null) {
                  if (data.data.appNoPwd) {
                    if (data.data.notPayNum == 0) {
                      String result =
                      await scanQrCodePlatform.invokeMethod('startCaptureActivity');
                      handleCaptureResult(result);
                    } else {
                      showDialogType = 1;
                      showDialog<Null>(
                          context: context, //BuildContext对象
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return getCustomDialog();
                          });
                    }
                  } else {
                    ToastUtils.toastUtils(context, msg: S.of(context).mian_page_no_pwd);
                  }
                }
              }, onError: (err) {
                ShowLoadLoadingDialog.hideLoadingDialog();
              });*/
            },
          ),
          RaisedButton(
            child: Text('send'),
            onPressed: () {
              _wsManager.getSocketChannel().sink.add("sendCMD!"); // 将数据发送到服务器
            },
          )
        ],
      ),
    );
  }
}
