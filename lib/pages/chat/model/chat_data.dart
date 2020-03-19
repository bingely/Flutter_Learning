import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/db/solution1/db_base_bean.dart';

class ChatData extends DbBaseBean{
  final String msg;
  final String id;
 // final int time;
  final String nickName;
 // final String avatar;



  ChatData({
    @required this.msg,
  //  this.avatar,
   // this.time,
    this.nickName,
    this.id,
  });

  @override
  DbBaseBean fromJson(Map<String, dynamic> map) {
    new ChatData(
      msg: map['msg'] as String,
      id: map['id'] as String,
    //  time: map['time'] as int,
      nickName: map['nickName'] as String,
    //  avatar: map['avatar'] as String,
    );
  }

  @override
  String getTableName() {
    return "ChatData2";
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'msg': this.msg,
      'id': this.id,
     // 'time': this.time,
      'nickName': this.nickName,
     // 'avatar': this.avatar,
    };
  }


}

