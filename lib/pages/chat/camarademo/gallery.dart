import 'dart:io';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/pages/chat/camarademo/video_preview.dart';
import 'package:flutter_qyyim/pages/chat/event/MsgEvent.dart';
import 'package:flutter_qyyim/testdemo/cross_data/event_bus.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  String currentFilePath;
  var extension;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder(
        future: _getAllImages(),
        builder: (context, AsyncSnapshot<List<FileSystemEntity>> snapshot) {
          if (!snapshot.hasData || snapshot.data.isEmpty) {
            return Container();
          }
          print('${snapshot.data.length} ${snapshot.data}');
          if (snapshot.data.length == 0) {
            return Center(
              child: Text('No images found.'),
            );
          }

          return PageView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              currentFilePath = snapshot.data[index].path;
              extension = path.extension(snapshot.data[index].path);
              if (extension == '.jpeg') {
                return Container(
                  height: 300,
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Image.file(
                    File(snapshot.data[index].path),
                  ),
                );
              } else {
                return VideoPreview(
                  videoPath: snapshot.data[index].path,
                );
              }
            },
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 56.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    eventBus.fire(MsgEvent(
                        content: currentFilePath,
                        type: extension == '.jpeg' ? MsgType.IMG : MsgType
                            .VIDEO));
                    Navigator.pop(context,"needfinshpage");
                  }
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: _deleteFile,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _shareFile() async {
    var extension = path.extension(currentFilePath);
    await Share.file(
      'image',
      (extension == '.jpeg') ? 'image.jpeg' : '	video.mp4',
      File(currentFilePath).readAsBytesSync(),
      (extension == '.jpeg') ? 'image/jpeg' : '	video/mp4',
    );
  }

  _deleteFile() {
    final dir = Directory(currentFilePath);
    dir.deleteSync(recursive: true);
    print('deleted');
    setState(() {});
  }

  Future<List<FileSystemEntity>> _getAllImages() async {
    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/media';
    final myDir = Directory(dirPath);
    List<FileSystemEntity> _images;
    _images = myDir.listSync(recursive: true, followLinks: false);
    _images.sort((a, b) {
      return b.path.compareTo(a.path);
    });
    return _images;
  }
}
