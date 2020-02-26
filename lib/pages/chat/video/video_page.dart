import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/pages/chat/camarademo/video_timer.dart';
import 'package:flutter_qyyim/pages/chat/video/video_demo.dart';
import 'package:flutter_qyyim/ui/show_toast.dart';
import 'package:path_provider/path_provider.dart';

class VideoPage extends StatefulWidget {
  VideoPage({Key key}) : super(key: key);

  @override
  VideoPageState createState() => new VideoPageState();
}

class VideoPageState extends State<VideoPage> {
  CameraController _controller;
  List<CameraDescription> _cameras;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isRecordingMode = false;
  bool _isRecording = false;
  final _timerKey = GlobalKey<VideoTimerState>();

  String videoPath;

  @override
  void initState() {
    _initCamera();
    super.initState();
  }

  Future<void> _initCamera() async {
    _cameras = await availableCameras();
    _controller = CameraController(_cameras[1], ResolutionPreset.medium);
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller != null) {
      if (!_controller.value.isInitialized) {
        return Container();
      }
    } else {
      return const Center(
        child: SizedBox(
          width: 32,
          height: 32,
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (!_controller.value.isInitialized) {
      return Container();
    }

    return new Scaffold(
      body: Stack(
        children: <Widget>[
          // 相机画面
          Container(
            child: Center(child: _cameraPreviewWidget()),
            color: Colors.black,
          ),
          // 拍照或录制视频最后预览图
          Positioned(
            right: 10,
            top: MediaQuery.of(context).size.height / 2, // 状态栏高度的一半
            child: _testWidget(),
          ),
          // 底部视图
          _cameraBottomWidget(),
        ],
      ),
    );
  }

  Widget _cameraPreviewWidget() {
    return new AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: new CameraPreview(_controller),
    );
  }

  Widget _cameraBottomWidget() {
    return Positioned(
      bottom: 30,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 40,
          ),
          Column(
            children: <Widget>[
              Text(
                '轻触拍照，长按摄像',
                style: TextStyle(color: Colors.red),
              ),
              new Listener(
                child: new Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  height: 60.0,
                  width: 60.0,
                ),
                onPointerDown: (v) {
                  setState(() {
                    //开始计时
                    onVideoRecordButtonPressed();
                  });
                },
              )
            ],
          ),
        ],
      ),
    );
  }

  void onVideoRecordButtonPressed() {}

  Future<String> startVideoRecording() async {
    if (!_controller.value.isInitialized) {
      showToast(context, "先选择一个相机");
      return null;
    }
    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/movies/flutter_im';
    await Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/${timestamp()}.mp4';

    if (_controller.value.isRecordingVideo) {
      // A recording is already started, do nothing.
      return null;
    }

    try {
      videoPath = filePath;
      await _controller.startVideoRecording(filePath);
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
    return filePath;
  }

  void _showCameraException(CameraException e) {
    logError(e.code, e.description);
    showToast(context, 'Error: ${e.code}\n${e.description}');
  }
}

Widget _testWidget() {
  return Text(
    "使用相机",
    style: TextStyle(color: Colors.red, fontSize: 24.0),
  );
}

String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();
