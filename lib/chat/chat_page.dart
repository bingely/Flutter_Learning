import 'package:flutter/material.dart';
import 'package:flutter_qyyim/config/const.dart';
import 'package:flutter_qyyim/ui/commom_bar.dart';
import 'package:flutter_qyyim/ui/main_input.dart';

// 聊天page
class ChatPage extends StatefulWidget{

  final String title;
  final int type;
  final String id;

  const ChatPage({Key key, this.title, this.type, this.id}) : super(key: key);

  @override
  ChatePageState createState() {
    return ChatePageState();
  }
}

class ChatePageState extends State<ChatPage>{
  @override
  Widget build(BuildContext context) {
    var rWidget = [
      new InkWell(
        child: new Image.asset('assets/images/right_more.png'),
      )
    ];




    return Scaffold(
      appBar: new ComMomBar(title: "标题", rightDMActions: rWidget),
      body: new MainInputBody(
        //onTap: () => setState(() => _isMore = false),
        decoration: BoxDecoration(color: chatBg),
        child: Center(
          child: Text("detail"),
        ),
      ),
    );
  }
}