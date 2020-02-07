import 'package:flutter/material.dart';

class ChangeNotifier implements Listenable{
  @override
  void addListener(listener) {
    // TODO: implement addListener
  }

  @override
  void removeListener(listener) {
    // TODO: implement removeListener
  }

  void notifyListeners() {
    //通知所有监听器，触发监听器回调
  }

}