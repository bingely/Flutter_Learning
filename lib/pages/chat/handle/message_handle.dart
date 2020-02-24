import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_qyyim/common/route.dart';
import 'package:flutter_qyyim/config/t.dart';
import 'package:flutter_qyyim/tool/handler_utils.dart';
import 'package:image_picker/image_picker.dart';

import '../shoot_page.dart';


Future<dynamic> getDimMessages(String id,
    {int type, Callback callback, int num = 50}) async {
  try {
    //var result = await im.getMessages(id, num, type ?? 1);
   // return result;
  } on PlatformException {
    debugPrint('获取失败');
  }
}

Future<void> sendImageMsg(String userName, int type,
    {Callback callback, ImageSource source}) async {
  File image = await ImagePicker.pickImage(source: source);
  if (image == null) return;
 // File compressImg = await singleCompressFile(image);

  try {
   // await im.sendImageMessages(userName, compressImg.path, type: type);
    callback(image.path);
  } on PlatformException {
    debugPrint("发送图片消息失败");
  }
}

Future<dynamic> sendSoundMessages(String id, String soundPath, int duration,
    int type, Callback callback) async {
  try {
   // var result = await im.sendSoundMessages(id, soundPath, type, duration);
   // callback(result);
  } on PlatformException {
    debugPrint('发送语音  失败');
  }
}


Future<void> sendVedioMsg() async {
  try {
    List<CameraDescription> cameras;

    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();

    routePush(new ShootPage(cameras));
  } on CameraException catch (e) {
    logError(e.code, e.description);
  }
}