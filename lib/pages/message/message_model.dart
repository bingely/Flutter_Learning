

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter_qyyim/common/provider/view_state_list_model.dart';
import 'package:flutter_qyyim/common/provider/view_state_refresh_list_model.dart';
import 'package:flutter_qyyim/mock/message_mock.dart';
import 'package:flutter_qyyim/tool/toast_util.dart';
import 'package:flutter/services.dart';

import 'message.dart';


class MessageModel extends ViewStateRefreshListModel<Message>{
  @override
  Future<List<Message>> loadData({int pageNum}) {
    return getMessageData();
  }



}