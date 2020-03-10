import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class WsManager {
  /// 连接的远程地址
  String url = 'ws://echo.websocket.org';

  static WsManager wsManager;

  IOWebSocketChannel _socketChannel;

  /// ping interval time
  static final int PING_INTERVAL = 30 * 1000;

  var connecting = false; //websocket连接状态

  WsManager._();

  // 单例化
  static WsManager getInstance() {
    if (wsManager == null) {
      wsManager = WsManager._();
    }
    return wsManager;
  }

  // ws connect
  connect() {
    try {
      IOWebSocketChannel ioWebSocketChannel = new IOWebSocketChannel.connect(url,
          pingInterval: Duration(milliseconds: PING_INTERVAL));
      // header dureation TODO
      _socketChannel = ioWebSocketChannel;
      // 监听动作
      _socketChannel.stream.listen(
        (data) => listenMessage(data),
        onDone: onDone,
        onError: onError,
      );
    } catch (e) {
      debugPrint('Connection exception $e');
    }
  }

  // 发送数据

  // 关闭动作
  close() {
    _socketChannel?.sink?.close();
  }

  // 重连逻辑
  void onDone() {
    debugPrint('ws channel closed');
    print('ws channel--->websocket断开了');
    connect();
    print('ws channel--->websocket重连');
  }

  onError(error) {
    print('ws channel-->error------------>${error}');
  }

  listenMessage(data) {
    connecting = true;
    debugPrint('ws channel---> message$data');
    // 解析数据 TODO
  }

  IOWebSocketChannel get socketChannel => _socketChannel;

}
