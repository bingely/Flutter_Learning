import 'package:flutter/material.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:flutter_qyyim/common/provider/provider_widget.dart';
import 'package:flutter_qyyim/tool/device_utils.dart';
import 'package:flutter_qyyim/tool/log_utils.dart';
import 'package:flutter_qyyim/ui/dialog/voice_dialog.dart';
import 'package:flutter_qyyim/view_model/voice_view_model.dart';
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
  String voiceIco = "assets/images/chat/voice_volume_4.webp";

  ///默认隐藏状态
  bool voiceState = true;
  OverlayEntry overlayEntry;

  /*使用的是FlutterAudioRecorder*/
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //voiceIcon(_current);
    return ProviderWidget<VoiceViewModel>(
      model: VoiceViewModel(),
      builder: (context, voiceModel, child){
        return Listener(
          onPointerDown: (details) {
            showVoiceView(voiceModel);
          },
          onPointerUp: (details) {
            //会触发
            hideVoiceView(voiceModel);
          },
          child: new GestureDetector(
            onVerticalDragStart: (details) {
              startY = details.globalPosition.dy;
              //showVoiceView(voiceModel);
            },
            onVerticalDragDown: (details) {
              startY = details.globalPosition.dy;
              //showVoiceView(voiceModel);
            },
            /* onVerticalDragCancel: () => hideVoiceView(voiceModel),
            onVerticalDragEnd: (details) => hideVoiceView(voiceModel),*/
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
          ),
        );
      },
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


  showVoiceView(VoiceViewModel voiceModel) {
    int index;
    setState(() {
      textShow = "松开结束";
      voiceState = false;
    });
    buildOverLayView(context);
    voiceModel.startRecorder(context);
    isUp = false;
  }

  hideVoiceView(VoiceViewModel voiceModel) {
    setState(() {
      textShow = "按住说话";
      voiceState = true;
    });
    voiceModel.stopRecorder(isUp,context);
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


  @override
  void dispose() {
    /// 当界面退出的时候是释放录音资源
    //recordPlugin.dispose();
    super.dispose();
  }

  void voiceIcon(Recording current) {
    //_current?.metering?.peakPower
    var _current ;
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
     /* _current = current;
      _currentStatus = _current.status;*/
      LogUtil.e(voiceIco);
    }
  }
}