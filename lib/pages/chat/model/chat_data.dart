import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/db/solution1/db_base_bean.dart';

class ChatData extends DbBaseBean {
  String id;
  String msg;
  String nickName;


  ChatData({this.id, this.msg, this.nickName});

  // 将类对象转换成 JSON 字典，方便插入数据库
  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'msg': this.msg,
      'nickName': this.nickName,
      // 'teacher': this.teacher,
    };
  }


  @override
  ChatData fromJson(Map<String, dynamic> parsedJson) {
    return ChatData(
      msg: parsedJson['msg'],
      id: parsedJson['id'],
      nickName: parsedJson['nickName'],
      // 增加映射规则
      // teacher: Teacher.fromJson(parsedJson ['teacher'])
    );
  }

  @override
  String getTableName() {
    return "MessageData";
  }

}
