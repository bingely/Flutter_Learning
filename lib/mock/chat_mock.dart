import 'package:flutter_qyyim/pages/chat/model/chat_data.dart';

Future<List<ChatData>> getChatData() async {
  List<ChatData> messageData = [
    ChatData(
      msg: {"text": 'hello', "type": "Text"},
    ),
  ];

  return messageData;
}
