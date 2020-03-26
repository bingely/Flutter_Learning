import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:flutter_plugin_record/flutter_plugin_record.dart';
import 'package:flutter_qyyim/tool/device_utils.dart';
import 'package:flutter_qyyim/pages/chat/event/MsgEvent.dart';
import 'package:flutter_qyyim/testdemo/cross_data/custom_event.dart';
import 'package:flutter_qyyim/testdemo/cross_data/event_bus.dart';
import 'package:flutter_qyyim/tool/date_utils.dart';
import 'package:flutter_qyyim/tool/log_utils.dart';
import 'package:flutter_qyyim/tool/toast_util.dart';
import 'package:flutter_qyyim/ui/dialog/voice_dialog.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
typedef VoiceFile = void Function(String path);

class ChatVoice extends StatefulWidget {
  final VoiceFile voiceFile;

  ChatVoice({this.voiceFile});

  @override
  _ChatVoiceWidgetState createState() => _ChatVoiceWidgetState();
}

class _ChatVoiceWidgetState extends State<ChatVoice> {
  double startY = 0.0;
  double offset = 0.0;
  int index;

  bool isUp = false;
  String textShow = "按住说话";
  String toastShow = "手指上滑,取消发送";
  String voiceIco = "images/voice_volume_1.png";


  ///默认隐藏状态
  bool voiceState = true;
  OverlayEntry overlayEntry;

  String voicepath;
  String recordTime;
  //FlutterPluginRecord recordPlugin = new FlutterPluginRecord();

  /*使用的是FlutterAudioRecorder*/
  FlutterAudioRecorder _recorder;
  Recording _current;
  RecordingStatus _currentStatus = RecordingStatus.Unset;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //voiceIcon(_current);
    return new GestureDetector(
      onVerticalDragStart: (details) {
        startY = details.globalPosition.dy;
        showVoiceView();
      },
      onVerticalDragDown: (details) {
        startY = details.globalPosition.dy;
        showVoiceView();
      },
      onVerticalDragCancel: () => hideVoiceView(),
      onVerticalDragEnd: (details) => hideVoiceView(),
      onVerticalDragUpdate: (details) {
        offset = details.globalPosition.dy;
        moveVoiceView();
      },
      child: new Container(
        height: 50.0,
        alignment: Alignment.center,
        width: DeviceUtils.winWidth(context),
        color: Colors.white,
        child: Text(textShow),
      ),
    );
  }

  ///显示录音悬浮布局
  buildOverLayView(BuildContext context) {
    if (overlayEntry == null) {
      overlayEntry = new OverlayEntry(builder: (content) {
        return Positioned(
          top: MediaQuery.of(context).size.height * 0.5 - 80,
          left: MediaQuery.of(context).size.width * 0.5 - 80,
          child: Material(
            type: MaterialType.transparency,
            child: Center(
              child: Opacity(
                opacity: 0.8,
                child: Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    color: Color(0xff77797A),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: new Image.asset(
                          voiceIco,
                          width: 100,
                          height: 100,
                          package: 'flutter_plugin_record',
                        ),
                      ),
                      Container(
//                      padding: EdgeInsets.only(right: 20, left: 20, top: 0),
                        child: Text(
                          toastShow,
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      });
      Overlay.of(context).insert(overlayEntry);
    }
  }


  showVoiceView() {
    int index;
    setState(() {
      textShow = "松开结束";
      voiceState = false;
    });
    buildOverLayView(context);
    startRecorder();

  }

  hideVoiceView() {
    setState(() {
      textShow = "按住说话";
      voiceState = true;
    });
    stopRecorder();
    if (overlayEntry != null) {
      overlayEntry.remove();
      overlayEntry = null;
    }
  }

  moveVoiceView() {
    setState(() {
      isUp = startY - offset > 100 ? true : false;
      if (isUp) {
        textShow = "松开手指,取消发送";
        toastShow = textShow;
      } else {
        textShow = "松开结束";
        toastShow = "手指上滑,取消发送";
      }
    });
  }




  ///初始化语音录制的方法
  void _init() async {
    //recordPlugin.init();
  }

  ///开始语音录制的方法
  void startRecorder() async {
    //recordPlugin.start();
    _initf();
  }

  ///停止语音录制的方法
  void stopRecorder() {
    //recordPlugin.stop();
    _stop();
  }

  @override
  void dispose() {
    /// 当界面退出的时候是释放录音资源
    //recordPlugin.dispose();
    super.dispose();
  }

  _initf() async {
    try {
      if (await FlutterAudioRecorder.hasPermissions) {
        String customPath = '/flutter_audio_recorder_';
        io.Directory appDocDirectory;
//        io.Directory appDocDirectory = await getApplicationDocumentsDirectory();
        if (io.Platform.isIOS) {
          appDocDirectory = await getApplicationDocumentsDirectory();
        } else {
          appDocDirectory = await getExternalStorageDirectory();
        }

        // can add extension like ".mp4" ".wav" ".m4a" ".aac"
        customPath = appDocDirectory.path +
            customPath +
            DateTime.now().millisecondsSinceEpoch.toString();

        // .wav <---> AudioFormat.WAV
        // .mp4 .m4a .aac <---> AudioFormat.AAC
        // AudioFormat is optional, if given value, will overwrite path extension when there is conflicts.
        _recorder =
            FlutterAudioRecorder(customPath, audioFormat: AudioFormat.WAV);

        await _recorder.initialized;
        // after initialization
        var current = await _recorder.current(channel: 0);
        print(current);
        // should be "Initialized", if all working fine
        setState(() {
          _current = current;
          _currentStatus = current.status;
          print(_currentStatus);
          _start();

        });


        //voiceIcon(current);





      } else {
        Scaffold.of(context).showSnackBar(
            new SnackBar(content: new Text("You must accept permissions")));
      }
    } catch (e) {
      print(e);
    }
  }

  _start() async {
    try {
      await _recorder.start();
      var recording = await _recorder.current(channel: 0);
      setState(() {
        _current = recording;
      });

      const tick = const Duration(milliseconds: 50);
      new Timer.periodic(tick, (Timer t) async {
        if (_currentStatus == RecordingStatus.Stopped) {
          t.cancel();
        }

        var current = await _recorder.current(channel: 0);
        // print(current.status);
        setState(() {
          _current = current;
          _currentStatus = current.status;
          print(_currentStatus);

        });

       // voiceIcon(current);
      });
    } catch (e) {
      print(e);
    }
  }

  void voiceIcon(Recording current) {
    //_current?.metering?.peakPower
    var voiceData = _current?.metering?.peakPower;
    if (voiceData != null) {
      if (voiceData > 0 && voiceData < 0.1) {
        voiceIco = "images/voice_volume_2.png";
      } else if (voiceData > 0.2 && voiceData < 0.3) {
        voiceIco = "images/voice_volume_3.png";
      } else if (voiceData > 0.3 && voiceData < 0.4) {
        voiceIco = "images/voice_volume_4.png";
      } else if (voiceData > 0.4 && voiceData < 0.5) {
        voiceIco = "images/voice_volume_5.png";
      } else if (voiceData > 0.5 && voiceData < 0.6) {
        voiceIco = "images/voice_volume_6.png";
      } else if (voiceData > 0.6 && voiceData < 0.7) {
        voiceIco = "images/voice_volume_7.png";
      } else if (voiceData > 0.7 && voiceData < 1) {
        voiceIco = "images/voice_volume_7.png";
      } else {
        voiceIco = "images/voice_volume_1.png";
      }
      if (overlayEntry != null) {
       // overlayEntry.markNeedsBuild();
      }

      _current = current;
      _currentStatus = _current.status;
      LogUtil.e(voiceIco);
    }

  }

  _stop() async {
    var result = await _recorder.stop();
    print("Stop recording: ${result.path}");
    print("Stop recording: ${result.duration}时间为${result.duration.inSeconds}");


    recordTime = result.duration.inSeconds.toString();
    voicepath = result.path;
    if (isUp) {
      LogUtil.e("取消发送");
    } else {
      LogUtil.e("进行发送");
      // Notice.send(WeChatActions.voiceImg(), true);
      if (result.duration.inSeconds < 1) {
        ToastUtils.show("录制时间太短了", context);
        return;
      }
      eventBus.fire(MsgEvent(content: voicepath,recordTime: recordTime,type: MsgType.VOICE));

    }
  }
}