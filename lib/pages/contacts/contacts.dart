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
import 'dart:convert';

import 'package:flutter_qyyim/tool/shared_util.dart';

import 'i_contact_info_entity.dart';

class Contact extends DbBaseBean {
  Contact({
    @required this.id,
    @required this.avatar,
    @required this.name,
    @required this.nameIndex,
  });

  final String id; // 唯一标识
  final String avatar;
  final String name;
  final String nameIndex; // 名字首字母所在的index

  @override
  DbBaseBean fromJson(Map<String, dynamic> map) {
    return new Contact(
      id: map['id'] as String,
      avatar: map['avatar'] as String,
      name: map['name'] as String,
      nameIndex: map['nameIndex'] as String,
    );
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
    };
  }
}

class ContactsPageData {
  // 如何读取资源文件的json

  listFriend() async {
    List<Contact> contacts = new List<Contact>();

    contacts.addAll(mock_contacts);

    contacts.forEach((contact)=>{
      DbUtils.getInstance().insertItem(contact )
    });
    return contacts;
  }
}
