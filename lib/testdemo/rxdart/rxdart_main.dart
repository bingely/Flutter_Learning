import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  /// Obserable

  //1 从一个Stream中创建：
  var controller = new StreamController<String>();
  var observable1 = Observable(controller.stream);
  controller.close();

  // 2通过Future创建：fromFuture
  var observable2 = Observable.fromFuture(Future.value(("hello")));

  Observable.fromFuture(asynFunc());

  // 3 通过Iterable创建：fromIterable
  List array = [1, 2, 3, 4, 5, 6, 7];
  var observable3 = Observable.fromIterable(array);

  // 从单个值中创建
  var observable4 = Observable.just(11);
  observable4.listen(print);

  /// Subjects
  // 1  PublishSubject
  // 2 BehaviourSubject  每一个新加的监听，接收到的第一个数据都是上一个数据（再往前的数据不会监听到，只会缓存一个数据）
  // 3 ReplaySubject
  var subject1 = new PublishSubject<int>();
  subject1.stream.listen((data) {
    print("Subject--listen1 " + data.toString());
  });
  subject1.add(1); //数据放在监听之前，不会发出数据
  subject1.stream.listen((data) {
    print("Subject--listen2 " + data.toString());
  });
  subject1.add(2);
  //输出结果:1,2,2
  subject1.close();



  /// 常用的数据变换

  // 1 map
  Observable.fromIterable(array).map<String>((data) {
    return (data + 1).toString();
  }).doOnListen(() {
    print("被监听");
  }).listen((data) {
    print(data);
  });

  // 2 periodic重复性操作     (此处的函数为啥可以return ？？）
  StreamSubscription subs;
  subs = Observable.periodic(Duration(seconds: 10), (index) {
    return "primitive $index";
  }).map((value) => "ss $value").listen((data) {
    print("data is $data");
    if (data.contains("8")) {
      subs.cancel();
    }
  });


  // 3 interval实现上面的逻辑
  Observable(Stream.fromIterable([1, 2, 3, 4]))
      .interval(Duration(seconds: 2))
      .listen((data) => print('data is $data'));

  // 4 延时操作
  Observable.timer("hello", Duration(seconds: 2)).listen((data) {
    print("data is $data");
  });

  /* 新版本
  rx
  rx_streams
  rx_subjects
  rx_transformers*/
}

Future asynFunc() async {
  return Future.delayed(Duration(minutes: 3), () {
    print("delay***");
  });
}
