import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/tool/net_util.dart';
import 'package:web_socket_channel/io.dart';

class WsManager {
  /// 连接的远程地址
  String url = 'ws://echo.websocket.org';

  static WsManager wsManager;

  IOWebSocketChannel _socketChannel;


  /// ping interval time
  static final int PING_INTERVAL = 30 * 1000;
  /// websocket连接状态
  var connecting = false;

  ObserverList<onReceiveMessage> observerList = ObserverList<onReceiveMessage>();

  WsManager._();

  // 单例化
  static WsManager getInstance() {
    if (wsManager == null) {
      wsManager = WsManager._();
    }
    return wsManager;
  }

  // ws connect
  connect() async {
    try {
      IOWebSocketChannel ioWebSocketChannel = IOWebSocketChannel.connect(
          url,
          pingInterval: Duration(milliseconds: PING_INTERVAL));
      // header dureation TODO
      setSocketChannel(ioWebSocketChannel);
      if (ioWebSocketChannel != null) {
        // 是成功state
        _socketChannel.sink.add("connected!"); // 将数据发送到服务器
      }
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

  //发送消息
  Future<bool> sendMessage(Map<String, dynamic> data) async {
    _socketChannel.sink.add(json.encode(data));
  }


  // 关闭动作
  close() {
    _socketChannel?.sink?.close();
    _socketChannel = null;
  }

  // 重连逻辑
  void onDone() {
    debugPrint('ws channel closed');
    print('ws channel--->websocket断开了');

    connect();
    print('ws channel--->websocket重连中……');
  }

  onError(error) {
    print('ws channel-->error------------>${error}');
  }

  listenMessage(data) {
    connecting = true;
    debugPrint('ws channel---> message$data');
    // 解析数据 TODO

    observerList.forEach((onReceiveMessage listener) {
      listener(json.decode(data));
    });
  }

  IOWebSocketChannel getSocketChannel() => _socketChannel;

  setSocketChannel(IOWebSocketChannel value) {
    _socketChannel = value;
  }


  /// 超时逻辑处理
  var timeout = const Duration(seconds: 3);
  var ms =  const Duration(milliseconds: 1);

  startTimeOut([int milliseconds]) {
    return new Timer(Duration(milliseconds: milliseconds), handleTimeout);
  }

  void handleTimeout() {
    //callback TODO
    print('超时handler');
  }



  //外部添加监听
  addListener(onReceiveMessage listener) {
    if (observerList.contains(listener)) {
      return;
    }
    observerList.add(listener);
  }

  removeListener(onReceiveMessage listener) {
    observerList.remove(listener);
  }
}
typedef onReceiveMessage(Map<String, dynamic> json); //接收到服务器的消息
