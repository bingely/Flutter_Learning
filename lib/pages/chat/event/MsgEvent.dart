

import 'dart:typed_data';

import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:flutter_qyyim/pages/chat/map/place.dart';

class MsgEvent {
  String content;
  MsgType type;
  String recordTime; // 录音/视频时长

  LatLng latLng;  // 经纬度
  Place place;  // 选择的地点


  Uint8List mapPic;

  MsgEvent({this.content, this.type, this.recordTime,this.latLng,this.mapPic,this.place});

}

enum MsgType{
  TXT,IMG,VIDEO,VOICE,MAP
}