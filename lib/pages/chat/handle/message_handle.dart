import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_qyyim/common/route/route.dart';
import 'package:flutter_qyyim/config/t.dart';
import 'package:flutter_qyyim/pages/chat/camarademo/camera_screen.dart';
import 'package:flutter_qyyim/pages/chat/video/video_page.dart';
import 'package:image_pickers/image_pickers.dart';
import 'package:path_provider/path_provider.dart';


Future<dynamic> getDimMessages(String id,
    {int type, Callback callback, int num = 50}) async {
  try {
    //var result = await im.getMessages(id, num, type ?? 1);
    // return result;
  } on PlatformException {
    debugPrint('获取失败');
  }
}
/*相册*/
Future<void> sendImageMsg(String userName, int type,
    {Callback callback}) async {
  try {
    /*var resultList = await MultiImagePicker.pickImages(
      // 选择图片的最大数量
      maxImages: 9,
      // 是否支持拍照
      enableCamera: true,
      materialOptions: MaterialOptions(
        // 显示所有照片，值为 false 时显示相册
          startInAllView: true,
          allViewTitle: '所有照片',
          actionBarColor: '#2196F3',
          textOnNothingSelected: '没有选择照片'
      ),
    );

    resultList.forEach((asset){
      LogUtil.e(asset);
    });*/

    String imgs = "";
    var _listImagePaths = await ImagePickers.pickerPaths(
      galleryMode: GalleryMode.image,
      selectCount: 9,
      showCamera: false,
    );
    _listImagePaths.forEach((media) {
      imgs = imgs + media.path+",";
    });
    callback(imgs);
  } on Exception catch (e) {
    e.toString();
  }
}

/*拍照*/
Future<void> openCamera(
    {Callback callback}) async {
  try {
    ImagePickers.openCamera(cameraMimeType: CameraMimeType.video).then((media){
      callback(media.path);
    });
  } on PlatformException {
    debugPrint("发送图片消息失败");
  }
}

Future<void> sendVideoMsg(String userName, int type,
    {Callback callback}) async {
  try {
    ImagePickers.openCamera(cameraMimeType: CameraMimeType.video).then((media){
      callback(media.path);
    });
  } on PlatformException {
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

/// 预览图片
previewImage(String url) {
  ImagePickers.previewImage(url);
}


