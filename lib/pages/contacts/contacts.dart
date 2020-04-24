import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/db/solution1/db_base_bean.dart';
import 'package:flutter_qyyim/common/db/solution1/db_utils.dart';
import 'package:flutter_qyyim/config/app.dart';
import 'package:flutter_qyyim/mock/contacts_mock.dart';
import 'package:flutter_qyyim/tool/check.dart';
import 'package:flutter_qyyim/common/pinyin/pinyin_helper.dart';
import 'package:flutter_qyyim/config/keys.dart';
import 'package:flutter_qyyim/config/t.dart';
import 'package:flutter_qyyim/pages/contacts/person_info_entity.dart';
import 'package:flutter_qyyim/tool/json_util.dart';
import 'package:flutter_qyyim/tool/log_utils.dart';
import 'dart:convert';

import 'package:flutter_qyyim/tool/shared_util.dart';

import 'i_contact_info_entity.dart';

class ContactState {
  static int isSelect = 1;
  static int isUnselect = 0;
}

class Contact extends DbBaseBean {
  Contact(
      {@required this.id,
      @required this.avatar,
      @required this.name,
      @required this.nameIndex,
      this.isSelect,
      this.canEnableSelect = 0});

  final String id; // 唯一标识
  final String avatar;
  final String name;
  final String nameIndex; // 名字首字母所在的index

  int isSelect; // 是否是选中  默认0 未选中

  int canEnableSelect ; //

  @override
  DbBaseBean fromJson(Map<String, dynamic> map) {
    return new Contact(
        id: map['id'] as String,
        avatar: map['avatar'] as String,
        name: map['name'] as String,
        nameIndex: map['nameIndex'] as String,
        isSelect: map['isSelect'] as int);
  }

  @override
  String getTableName() {
    return "Contact";
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'avatar': this.avatar,
      'name': this.name,
      'nameIndex': this.nameIndex,
      'isSelect': this.isSelect
    };
  }
}

class ContactsPageData {
  // 如何读取资源文件的json

  listFriend() async {
    List<Contact> contacts = new List<Contact>();

    /// 奇怪为啥这种方式添加会记住选中的状态 TODO
    //contacts.addAll(mock_contacts);

    /// 改成通过读取json
/*    var encode = json.encode(mock_contacts);
    LogUtil.e("listFriend====$encode");*/
    String loadString = await JsonUtils.loadString('contact.json');
    List contactJson = json.decode(loadString);
    contactJson.forEach((json) {
      contacts.add(Contact().fromJson(json));
    });

    contacts.forEach((contact) => {DbUtils.getInstance().insertItem(contact)});
    return contacts;
  }
}
