import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/config/app.dart';
import 'package:flutter_qyyim/tool/check.dart';
import 'package:flutter_qyyim/common/route/route.dart';
import 'package:flutter_qyyim/ui/ui.dart';
import 'package:flutter_qyyim/pages/chat/handle/message_handle.dart';
import 'package:flutter_qyyim/pages/chat/model/chat_data.dart';
import 'package:flutter_qyyim/common/provider/global_model.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import 'msg_avatar.dart';

class VideoMsg extends StatefulWidget {
  final msg;
  final ChatData model;

  const VideoMsg(this.msg, this.model);

  @override
  _VidoMsgState createState() => new _VidoMsgState();
}

class _VidoMsgState extends State<VideoMsg> {
  VideoPlayerController _controller;
  Future _initializeVideoPlayerFuture;

  String VIDEO_URL = 'https://www.runoob.com/try/demo_source/mov_bbb.mp4';

  @override
  void initState() {
    super.initState();

    Map<String, dynamic> msg = json.decode(widget.model?.msg);

    var url = msg['videosrc'];

    _controller = VideoPlayerController.file(File(url));
    _controller.setLooping(true);
    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> msg = json.decode(widget.model?.msg);

    if (!strNoEmpty(msg['videosrc'])) return Text('发送中');
    var url = msg['videosrc'];
    // _controller = VideoPlayerController.file(File(url));
    // _initializeVideoPlayerFuture = _controller.initialize();

    var _height;
    var resultH = 200.0;

    print("testfile---" + url);

    var isFile = File(url).existsSync();
    final globalModel = Provider.of<GlobalModel>(context);
    var body = [
      new MsgAvatar(model: widget.model, globalModel: globalModel),
      new Space(width: AppConstants.mainSpace),
      new Expanded(
        child: new GestureDetector(
          child: new Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: new ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  print(snapshot.connectionState);
                  if (snapshot.hasError) print(snapshot.error);
                  if (snapshot.connectionState == ConnectionState.done) {
                    return _controller.value.isPlaying
                        ? AspectRatio(
                            // aspectRatio: 16 / 9,
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          )
                        : AspectRatio(
                            // aspectRatio: 16 / 9,
                            aspectRatio: _controller.value.aspectRatio,
                            child: Stack(
                              children: <Widget>[
                                VideoPlayer(_controller),
                                //_controller.value.isPlaying?null:
                                Positioned(
                                  top: 100,
                                  left: 70,
                                    child: Icon(Icons.videocam,color: Colors.white,size: 40,),
                                )
                              ],
                            ),
                          );
                  } else {

                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ),
          onTap: () {
            setState(() {
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
                // If the video is paused, play it.
                _controller.play();
              }
            });
          },
        ),
      ),
      new Spacer(),
    ];
    if (widget.model.id == globalModel.account) {
      body = body.reversed.toList();
    } else {
      body = body;
    }
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: new Row(children: body),
    );
  }
}
