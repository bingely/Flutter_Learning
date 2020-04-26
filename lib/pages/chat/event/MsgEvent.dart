import 'dart:typed_data';

import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:flutter_qyyim/pages/chat/map/place.dart';

class MsgEvent {
  String content;
  MsgType type;
  String recordTime; // 录音/视频时长

  LatLng latLng; // 经纬度
  Place place; // 选择的地点

  Uint8List mapPic;

  //发送消息类型   单聊还是群聊
  int sendType;

  /// 文件相关的
  String fileSize;

  MsgEvent(
      {this.content,
      this.type,
      this.recordTime,
      this.latLng,
      this.mapPic,
      this.place,
      this.fileSize,
      this.sendType});
}

enum MsgType { TXT, IMG, VIDEO, VOICE, MAP, FILE }
