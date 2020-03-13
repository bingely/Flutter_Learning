import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_qyyim/pages/chat/camarademo/gallery.dart';
import 'package:flutter_qyyim/pages/chat/chat_page.dart';
import 'package:flutter_qyyim/pages/chat/video/video_page.dart';
import 'package:flutter_qyyim/pages/load_page.dart';
import 'package:flutter_qyyim/pages/message/message_page.dart';
import 'package:flutter_qyyim/pages/tab_navigator_page.dart';
import 'package:flutter_qyyim/pages/search/search.dart';
import 'package:flutter_qyyim/pages/trip/view/travel_home_page.dart';
import 'package:flutter_qyyim/testdemo/wann/pages/project/article_list_item.dart';
import 'package:flutter_qyyim/testdemo/wann/pages/project/project_page.dart';
import 'package:flutter_qyyim/ui/page_route_anim.dart';

/// 路由名字
class RouteName {
  static const String splash = 'splash';
  static const String tab = '/';
  static const String homeSecondFloor = 'homeSecondFloor';
  static const String login = 'login';
  static const String gallay = 'gallay';
  static const String video_page = 'video_page';
  static const String search = 'search';
  static const String msglist = 'msglist';
  static const String setting = 'setting';
  static const String chat = 'chat';
  static const String app = 'app';
}

/// CupertinoPageRoute 是一种具有带有滑动关闭的苹果页面效果
/// NoAnimRouteBuilder 无动画效果
class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return NoAnimRouteBuilder(TravelHomePage());
      case RouteName.app:
        return NoAnimRouteBuilder(TabNavigatorPage());
      case RouteName.chat:
        return CupertinoPageRoute(
          builder: (context) => ChatPage()
        );
        //return NoAnimRouteBuilder(ChatPage());
      case RouteName.msglist:
        return NoAnimRouteBuilder(MessagePage());
      case RouteName.search:
        return NoAnimRouteBuilder(SearchWidget());
      case RouteName.video_page:
        return NoAnimRouteBuilder(VideoPage());
      case RouteName.gallay:
        return NoAnimRouteBuilder(Gallery());
    }
  }
}

/// Pop路由
class PopRoute extends PopupRoute {
  final Duration _duration = Duration(milliseconds: 300);
  Widget child;

  PopRoute({@required this.child});

  @override
  Color get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Duration get transitionDuration => _duration;
}
