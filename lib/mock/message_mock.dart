//组装数据
import 'dart:core';
import 'dart:core';

import 'package:flutter_qyyim/model/message.dart';
import 'package:flutter_qyyim/tool/date_util.dart';

Future<List<SessionMsg>> getMessageData() async {
  /*List<String> avatars = new List();
  avatars.add('https://randomuser.me/api/portraits/men/11.jpg');
  avatars.add('https://randomuser.me/api/portraits/men/10.jpg');
  avatars.add('https://randomuser.me/api/portraits/men/12.jpg');
  avatars.add('https://randomuser.me/api/portraits/men/11.jpg');
  avatars.add('https://randomuser.me/api/portraits/men/10.jpg');
  avatars.add('https://randomuser.me/api/portraits/men/12.jpg');
  avatars.add('https://randomuser.me/api/portraits/men/11.jpg');
  avatars.add('https://randomuser.me/api/portraits/men/10.jpg');
  avatars.add('https://randomuser.me/api/portraits/men/12.jpg');
  avatars.add('https://randomuser.me/api/portraits/men/11.jpg');
  avatars.add('https://randomuser.me/api/portraits/men/10.jpg');
  avatars.add('https://randomuser.me/api/portraits/men/12.jpg');*/

  String avatars = "https://randomuser.me/api/portraits/men/11.jpg,https://randomuser.me/api/portraits/men/10.jpg,https://randomuser.me/api/portraits/men/12.jpg";


  /*List<String> avatar2 = new List();
  avatar2.add('https://randomuser.me/api/portraits/men/10.jpg');*/
  String avatar2 = 'https://randomuser.me/api/portraits/men/10.jpg';

  /*List<String> avatar3 = new List();
  avatar3.add('https://randomuser.me/api/portraits/men/12.jpg');*/

  String avatar3 = 'https://randomuser.me/api/portraits/men/12.jpg';


  List<SessionMsg> messageData = [
    SessionMsg(
        userId: '11112',
        avatars: avatars,
        title:'汤姆丁',
        subTitle:'……',
        time:DateUtil.getNowDateMs(),
        type:MessageType.GROUP.index),
    SessionMsg(
        userId: '11111',
        avatars: avatar2,
        title:'bingley',
        subTitle:'突然想到的',
        time:DateTime(2019, 6, 20, 17, 30,20).millisecondsSinceEpoch,
        type:MessageType.CHAT.index),
    SessionMsg(
        userId: '11113',
        avatars: avatar3,
        title:'lisa',
        subTitle:'我在思考问题。。',
        time:DateTime(2020, 3, 20, 17, 30,20).millisecondsSinceEpoch,
        type:MessageType.CHAT.index)
  ];

  return messageData;
}
