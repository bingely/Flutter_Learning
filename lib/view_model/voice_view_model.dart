import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:flutter_qyyim/common/provider/view_state_model.dart';
import 'package:flutter_qyyim/pages/chat/event/MsgEvent.dart';
import 'package:flutter_qyyim/testdemo/cross_data/event_bus.dart';
import 'package:flutter_qyyim/tool/log_utils.dart';
import 'package:flutter_qyyim/tool/toast_util.dart';
import 'package:flutter_qyyim/ui/toast.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
class VoiceViewModel extends ViewStateModel{


  /*使用的是FlutterAudioRecorder*/
  FlutterAudioRecorder _recorder;
  Recording _current;
  RecordingStatus _currentStatus = RecordingStatus.Unset;
  ///开始语音录制的方法
  startRecorder(BuildContext context) async {
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
        /*setState(() {
          _current = current;
          _currentStatus = current.status;
          print(_currentStatus);
          _start();

        });*/
        _start();
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

      _current = recording;
      setIdle();

      const tick = const Duration(milliseconds: 50);
      new Timer.periodic(tick, (Timer t) async {
        if (_currentStatus == RecordingStatus.Stopped) {
          t.cancel();
        }

        var current = await _recorder.current(channel: 0);
        // print(current.status);
        LogUtil.e('currentStatus$_currentStatus'+'----$current');
        _current = current;
        _currentStatus = current.status;
        print(_currentStatus);
        setIdle();
        // voiceIcon(current);
      });
    } catch (e) {
      print(e);
    }
  }
  ///停止语音录制的方法
  stopRecorder(bool isUp,BuildContext context) async {
    var result = await _recorder.stop();
    print("Stop recording: ${result.path}");
    var inSeconds = result.duration.inSeconds;
    print("Stop recording: ${result.duration}时间为${inSeconds}");


    String recordTime = inSeconds.toString();
    String voicepath = result.path;
    if (isUp) {
      LogUtil.e("取消发送");
    } else {
      LogUtil.e("进行发送");
      // Notice.send(WeChatActions.voiceImg(), true);
      if (inSeconds < 1) {
        ToastUtils.show("录制时间太短了", context,type: ERROR);
        return;
      }
      if (inSeconds > 20) {
        ToastUtils.show("录制时间太长,最大录制时间20s", context,type: ERROR);
        return;
      }
      eventBus.fire(MsgEvent(content: voicepath,recordTime: recordTime,type: MsgType.VOICE));

    }
  }
}