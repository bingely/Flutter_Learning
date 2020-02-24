import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';

class CameraApp extends StatefulWidget {

  List<CameraDescription> cameras;
  CameraApp({this.cameras});

  @override
  _CameraAppState createState() => _CameraAppState(cameras);
}

class _CameraAppState extends State<CameraApp> {
  CameraController controller;
  List<CameraDescription> cameras;
  _CameraAppState(List<CameraDescription> cameras){
    this.cameras = cameras;
  }


  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return AspectRatio(
        aspectRatio:
        controller.value.aspectRatio,
        child: CameraPreview(controller));
  }
}