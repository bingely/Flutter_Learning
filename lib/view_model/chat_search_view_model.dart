import 'package:flutter_qyyim/common/db/solution1/db_utils.dart';
import 'package:flutter_qyyim/common/provider/view_state_model.dart';
import 'package:flutter_qyyim/pages/chat/model/chat_data.dart';

class ChatSearchViewModel extends ViewStateModel{


  Future<List<ChatData>> init(){

    // 针对不同类型进行搜索
    /*return DbUtils.getInstance().queryItemsLimit(ChatData(),
        limit: pageSize,
        offset: (currentPageNum - 1) * pageSize,
        orderBy: "id Desc",
        key: "chatId",
        value: chatId);*/
  }
}
