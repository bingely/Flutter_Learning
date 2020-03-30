import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/pages/chat/send_messageview.dart';
import 'package:flutter_qyyim/ui/expanded_viewport.dart';
import 'package:flutter_qyyim/view_model/chat_view_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'indicator_page_view.dart';
import 'model/chat_data.dart';

/// 聊天中间的部分
/// 按照时间的格式排序
class ChatDetailsBody extends StatelessWidget {
  final ScrollController sC;
  final ChatViewModel chatViewModel;

  ChatDetailsBody({this.sC, this.chatViewModel});

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: SmartRefresher(
        enablePullDown: false,
        onLoading: chatViewModel.loadMore,
        footer: CustomFooter(
          loadStyle: LoadStyle.ShowAlways,
          builder: (context, mode) {
            if (mode == LoadStatus.loading) {
              return Container(
                height: 60.0,
                child: Container(
                  height: 20.0,
                  width: 20.0,
                  child: CupertinoActivityIndicator(),
                ),
              );
            } else
              return Container();
          },
        ),
        controller: chatViewModel.refreshController,
        enablePullUp: true,
        child: Scrollable(
          controller: sC,
          physics: BouncingScrollPhysics(),
          axisDirection: AxisDirection.up,
          viewportBuilder: (context, offset) {
            return ExpandedViewport(
              offset: offset,
              axisDirection: AxisDirection.up,
              slivers: <Widget>[
                SliverExpanded(),
                SliverList(
                  delegate: SliverChildBuilderDelegate((c, index) {
                    // chatViewModel.list.sort((a, b) => (a.id).compareTo(b.id));
                    ChatData model = chatViewModel.list[index];
                    //list最后一条消息（时间上是最老的），是没有下一条了
                    ChatData _nextModel = (index == chatViewModel.list.length - 1) ? null : chatViewModel.list[index + 1];


                    return new SendMessageView(model,_nextModel);
                  }, childCount: chatViewModel.list?.length),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
