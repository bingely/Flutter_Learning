

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter_qyyim/common/db/solution1/db_utils.dart';
import 'package:flutter_qyyim/common/provider/view_state_list_model.dart';
import 'package:flutter_qyyim/common/provider/view_state_refresh_list_model.dart';
import 'package:flutter_qyyim/mock/message_mock.dart';
import 'package:flutter_qyyim/tool/log_utils.dart';
import 'package:flutter_qyyim/tool/toast_util.dart';
import 'package:flutter/services.dart';

import '../model/message.dart';

/// 消息列表viewmodel
class MessageViewModel extends ViewStateRefreshListModel<SessionMsg>{
  @override
  Future<List<SessionMsg>> loadData({int pageNum}) {
    // 改成从数据库中查询
    //return getMessageData();
    return DbUtils.getInstance().queryItemsLimitOrder(SessionMsg(),orderBy: "time Desc");
  }

}