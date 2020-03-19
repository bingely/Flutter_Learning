import 'package:flutter_qyyim/common/db/solution1/db_utils.dart';
import 'package:flutter_qyyim/pages/chat/model/chat_data.dart';

Future<List<ChatData>> getChatData() async {
  String json1 = '{"text": "hello", "type": "Text"}';
  String json2 = '{"text": "hello11", "type": "Text"}';
  String json3 = '{"text": "hello22", "type": "Text"}';


  List<ChatData> messageData = [
    ChatData(
      msg: json1,
    ),
    ChatData(
      msg: json2,
    ),
    ChatData(
      msg: json3,
    ),
  ];

  return messageData;
}
