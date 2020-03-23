
import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/pages/chat/send_messageview.dart';
import 'package:flutter_qyyim/view_model/chat_view_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'indicator_page_view.dart';
import 'model/chat_data.dart';

/// 聊天中间的部分
/// 按照时间的格式排序
class ChatDetailsBody extends StatelessWidget {
  final ScrollController sC;
  final ChatViewModel chatViewModel;

  ChatDetailsBody({this.sC,this.chatViewModel});

  @override
  Widget build(BuildContext context) {

    return new Flexible(
      child: new ScrollConfiguration(
        behavior: MyBehavior(),
        child: SmartRefresher(
          header: WaterDropHeader(),
          footer: ClassicFooter(),
          controller: chatViewModel.refreshController,
          onRefresh: chatViewModel.loadMorePageReverse,
          onLoading: chatViewModel.loadMore,
          enablePullUp: false,
          child: new ListView.builder(
            controller: sC,
            padding: EdgeInsets.all(8.0),
            reverse: false,
            itemBuilder: (context, int index) {
              chatViewModel.list.sort((a,b)=>(a.id).compareTo(b.id));
              ChatData model = chatViewModel.list[index];
              return new SendMessageView(model);
            },
            itemCount: chatViewModel.list?.length,
          ),
        ),
      ),
    );
  }
}
