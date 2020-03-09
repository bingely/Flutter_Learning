import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class WsManager {
  /// 连接的远程地址
  String url = 'ws://echo.websocket.org';

   static WsManager wsManager;

  static IOWebSocketChannel socketChannel;


  int reconnectCount = 0; // 重连次数
  final int MAX_RECONNECT_COUNT = 5; // 重连次数，看需求，自定义

  /// ping interval time
  static final int PING_INTERVAL = 30 * 1000;

  var connecting = false; //websocket连接状态

  init() {
    try {
      if (socketChannel == null) {
        socketChannel = new IOWebSocketChannel.connect(url);
        // header dureation TODO

        // 监听动作
        socketChannel.stream.listen(
          (data) => listenMessage(data),
          onDone: onDone,
          onError: onError,
        );
      }
    } catch (e) {
      debugPrint('Connection exception $e');
    }
  }

  // 单例化
  static WsManager getInstance() {
    if (wsManager == null) {
      wsManager = WsManager();
    }
    return wsManager;
  }

  // 发送数据

  // 关闭动作
  close() {
    if (socketChannel != null) {
      socketChannel.sink.close();
    }
  }

  // 重连逻辑
  void onDone() {
    debugPrint('ws channel closed');
    print('ws channel--->websocket断开了');
    init();
    print('ws channel--->websocket重连');
  }

  onError(error){
    print('ws channel-->error------------>${error}');
  }

  listenMessage(data) {
    connecting = true;
    debugPrint('ws channel---> message$data');
    // 解析数据 TODO
  }

}
