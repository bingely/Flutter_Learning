

import 'dart:typed_data';

import 'package:amap_map_fluttify/amap_map_fluttify.dart';

class MsgEvent {
  String content;
  MsgType type;
  String recordTime; // 录音/视频时长

  LatLng latLng;  // 经纬度

  Uint8List mapPic;

  MsgEvent({this.content, this.type, this.recordTime,this.latLng,this.mapPic});

}

enum MsgType{
  TXT,IMG,VIDEO,VOICE,MAP
}