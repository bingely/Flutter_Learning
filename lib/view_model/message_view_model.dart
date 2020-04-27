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
class MessageViewModel extends ViewStateRefreshListModel<SessionMsg> {
  @override
  Future<List<SessionMsg>> loadData({int pageNum}) async {
    // 改成从数据库中查询
    List<SessionMsg> isTopChat = await DbUtils.getInstance()
        .queryItems(SessionMsg(), key: "isTopChat", value: "1");

    List<SessionMsg> sessions = await DbUtils.getInstance()
        .queryItemsLimitOrder(SessionMsg(), orderBy: "time Desc");
    // remove 无效
    // isTopChat[0] == sessions[3] 为啥不是等效的，元素内容是一样的

    // 置顶数组排序
    if (isTopChat.length > 0) {
      isTopChat.forEach((topSessionMsg){
        sessions.removeWhere((sessionMsg) => sessionMsg.id == topSessionMsg.id);
        sessions.insert(0, topSessionMsg);
      });
    }
    return sessions;
  }

}
