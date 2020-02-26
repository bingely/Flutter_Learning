import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_qyyim/common/route.dart';
import 'package:flutter_qyyim/config/t.dart';
import 'package:flutter_qyyim/pages/chat/camarademo/camera_screen.dart';
import 'package:flutter_qyyim/pages/chat/video/video_page.dart';
import 'package:flutter_qyyim/tool/handler_utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

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


Future<void> sendVideoMsg(String userName, int type,
    {Callback callback}) async {
  File videoFile = await ImagePicker.pickVideo(source: ImageSource.camera);
  if (videoFile == null) return;
  // File compressImg = await singleCompressFile(image);
  try {
    // await im.sendImageMessages(userName, compressImg.path, type: type);
    callback(videoFile.path);
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


    final _cameraKey = GlobalKey<CameraScreenState>();

    routePush(new VideoPage(key: _cameraKey));

   // _takeVideo();
   // _takePhoto();
  } on CameraException catch (e) {
    //logError(e.code, e.description);
  }
}


/*拍照*/
Future<void> _takePhoto() async {
  var image = await ImagePicker.pickImage(source: ImageSource.camera);
  print('拍照返回：' + image.toString());
}

/*相册*/
Future<void> _openGallery() async {
  var image = await ImagePicker.pickImage(source: ImageSource.gallery);
  print('相册返回：' + image.toString());
}

/*选取视频*/
Future<void> _getVideo() async {
  var image = await ImagePicker.pickVideo(source: ImageSource.gallery);
  print('选取视频：' + image.toString());
}
/*拍摄视频*/
Future<void> _takeVideo() async {
  var image = await ImagePicker.pickVideo(source: ImageSource.camera);
  print('拍摄视频：' + image.toString());
}
/*拍摄视频*/
Future<File> _takeVideoFile() async {
  var image = await ImagePicker.pickVideo(source: ImageSource.camera);
  print('拍摄视频：' + image.toString());
  return image;
}

Future<void> takePath() async{
  var tempDir = await getTemporaryDirectory();
  String tempPath = tempDir.path;

  var appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;

  var appExternalDir = await getExternalStorageDirectory();


  print('临时目录: ' + tempPath);
  print('文档目录: ' + appDocPath);
  print('Android平台可用: ' + appExternalDir.path); ///storage/emulated/0/Android/data/qyy.im.flutter_qyyim/files

}