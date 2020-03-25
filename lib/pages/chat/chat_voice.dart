import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_qyyim/tool/device_utils.dart';
import 'package:flutter_qyyim/pages/chat/event/MsgEvent.dart';
import 'package:flutter_qyyim/testdemo/cross_data/custom_event.dart';
import 'package:flutter_qyyim/testdemo/cross_data/event_bus.dart';
import 'package:flutter_qyyim/tool/date_utils.dart';
import 'package:flutter_qyyim/tool/log_utils.dart';
import 'package:flutter_qyyim/tool/toast_util.dart';
import 'package:flutter_qyyim/ui/dialog/voice_dialog.dart';
import 'package:flutter_qyyim/tool/show_toast.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:path_provider/path_provider.dart';
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

  StreamSubscription _recorderSubscription;

  ///默认隐藏状态
  bool voiceState = true;
  OverlayEntry overlayEntry;
  FlutterSound flutterSound;


  String voicepath;
  String recordTime;

  @override
  void initState() {
    super.initState();
    flutterSound = new FlutterSound();
    flutterSound.setSubscriptionDuration(0.01);
    flutterSound.setDbPeakLevelUpdate(0.8);
    flutterSound.setDbLevelEnabled(true);
    //initializeDateFormatting();
  }

  t_CODEC _codec = t_CODEC.CODEC_AAC;
  void start() async {
    LogUtil.d('开始录音---》');
    try {
      var currentStamp = DateUtils.getCurrentStamp();
      Directory tempDir = await getTemporaryDirectory();
      String path = await flutterSound
          .startRecorder(uri:'${tempDir.path}/${currentStamp}sound.aac',codec: _codec); // android.mp4
      LogUtil.d('startRecorder录制结果路径-----$path');
      voicepath = path;
      widget.voiceFile(path);
      _recorderSubscription =
          flutterSound.onRecorderStateChanged.listen((e) {
            DateTime date = new DateTime.fromMillisecondsSinceEpoch(
                e.currentPosition.toInt(),
                isUtc: true);
            recordTime = DateUtils.intlFormateTime('mm:ss:SS', date).substring(3, 5);
            //LogUtil.d('开始录音RecordTime---》${DateUtils.intlFormateTime('mm:ss:SS', date)}');
            this.setState(() {
              //this._recorderTxt = txt.substring(0, 8);
            });
          });
    } catch (err) {
      RecorderRunningException e = err;
      LogUtil.d('开始录音异常---》${e.message}');
      showToast(context, 'startRecorder error: ${e.message}');


    }

  }

  void stop() async {
    try {
      String result = await flutterSound.stopRecorder();
      LogUtil.d('stopRecorder: $result');

      if (_recorderSubscription != null) {
        _recorderSubscription.cancel();
        _recorderSubscription = null;
      }

    } catch (err) {
      RecorderStoppedException e = err;
      showToast(context, 'stopRecorder error: ${e.message}');
      LogUtil.d('结束录音异常---》${e.message}');
    }
  }


  showVoiceView() {
    int index;
    setState(() {
      textShow = "松开结束";
      voiceState = false;
      DateTime now = new DateTime.now();
      int date = now.millisecondsSinceEpoch;
      DateTime current = DateTime.fromMillisecondsSinceEpoch(date);

      String recordingTime =
      DateUtils.formatDateV(current, format: "ss:SS");
      index = int.parse(recordingTime.toString().substring(3, 5));
    });

    onStartRecorderPressed();

    if (overlayEntry == null) {
      overlayEntry = showVoiceDialog(context, index: index);
    }
  }

  hideVoiceView() {
    setState(() {
      textShow = "按住说话";
      voiceState = true;
    });
    onStartRecorderPressed();
    if (overlayEntry != null) {
      overlayEntry.remove();
      overlayEntry = null;
    }

    if (isUp) {
      LogUtil.e("取消发送");
    } else {
      LogUtil.e("进行发送");
      // Notice.send(WeChatActions.voiceImg(), true);
      if (int.parse(recordTime)<1) {
        ToastUtils.show("录制时间太短了", context);
        return;
      }
      eventBus.fire(MsgEvent(content: voicepath,recordTime: recordTime,type: MsgType.VOICE));

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
  Widget build(BuildContext context) {
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


  onStartRecorderPressed() {
    if (flutterSound.audioState == t_AUDIO_STATE.IS_RECORDING)
      return stop();

    return flutterSound.audioState == t_AUDIO_STATE.IS_STOPPED
        ? start()
        : null;
  }
}