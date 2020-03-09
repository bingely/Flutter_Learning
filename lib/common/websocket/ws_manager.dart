import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class WsManager {
  /// 连接的远程地址
  String url = 'ws://echo.websocket.org';

  static WsManager wsManager;

  static IOWebSocketChannel socketChannel;

  _init() {
    try {
      if (socketChannel == null) {
        socketChannel = new IOWebSocketChannel.connect(url);
        // header dureation TODO

        // 监听动作
        socketChannel.stream.listen(
          (message) {
            debugPrint('ws channel message$message');
          },
          onDone: () {
            debugPrint('ws channel closed');
          },
          onError: (error) {
            debugPrint('ws error $error');
          },
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

  // 重连逻辑 TODO


}
