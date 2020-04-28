import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_qyyim/pages/chat/camarademo/camaramain.dart';
import 'package:flutter_qyyim/pages/chat/camarademo/gallery.dart';
import 'package:flutter_qyyim/pages/chat/chat_page.dart';
import 'package:flutter_qyyim/pages/chat/chatsearch/chat_search_page.dart';
import 'package:flutter_qyyim/pages/search/app_search_page.dart';
import 'package:flutter_qyyim/pages/chat/detail/chat_info_page.dart';
import 'package:flutter_qyyim/pages/chat/detail/contact_detail_page.dart';
import 'package:flutter_qyyim/pages/chat/detail/friend_choose_page.dart';
import 'package:flutter_qyyim/pages/chat/map/map_locationed.dart';
import 'package:flutter_qyyim/pages/chat/video/video_page.dart';
import 'package:flutter_qyyim/model/message.dart';
import 'package:flutter_qyyim/pages/splash_page.dart';
import 'package:flutter_qyyim/pages/message/message_page.dart';
import 'package:flutter_qyyim/pages/tab_navigator_page.dart';
import 'package:flutter_qyyim/pages/search/search.dart';
import 'package:flutter_qyyim/testdemo/animation/bezier/bezier_page.dart';
import 'package:flutter_qyyim/testdemo/basic_component_chapter3/text_field_page.dart';
import 'package:flutter_qyyim/testdemo/contacts/contacts_page.dart';
import 'package:flutter_qyyim/testdemo/event_handle_chapter8/both_direction_test_page.dart';
import 'package:flutter_qyyim/testdemo/event_handle_chapter8/gestur_confic_test_page.dart';
import 'package:flutter_qyyim/testdemo/event_handle_chapter8/gesture_detector_page.dart';
import 'package:flutter_qyyim/testdemo/file/file_picker_demo.dart';
import 'package:flutter_qyyim/testdemo/file/main.dart';
import 'package:flutter_qyyim/testdemo/file_data_page.dart';
import 'package:flutter_qyyim/pages/chat/map/map_location.dart';
import 'package:flutter_qyyim/testdemo/key_page.dart';
import 'package:flutter_qyyim/testdemo/scrcole_chapter6/customscrollvew/custom_scrollview.dart';
import 'package:flutter_qyyim/testdemo/scrcole_chapter6/listview/list_demo.dart';
import 'package:flutter_qyyim/testdemo/scrcole_chapter6/listview/listview_head.dart';
import 'package:flutter_qyyim/testdemo/scrcole_chapter6/customscrollvew/nestscroll.dart';
import 'package:flutter_qyyim/testdemo/trip/tab_navigator_page2.dart';
import 'package:flutter_qyyim/testdemo/wann/pages/project/article_list_item.dart';
import 'package:flutter_qyyim/testdemo/wann/pages/project/project_page.dart';
import 'package:flutter_qyyim/testdemo/wann/pages/user/login_page.dart';
import 'package:flutter_qyyim/testdemo/wann/tab_navigator_page3.dart';
import 'package:flutter_qyyim/ui/hom.dart';
import 'package:flutter_qyyim/ui/ios_page.dart';
import 'package:flutter_qyyim/ui/page_route_anim.dart';

/// how to use? 还可以传递 自定义的对象（arguments）
//  Navigator.of(context).pushNamed(RouteName.articleDetail,
//                        arguments: Article()
//                          ..id = banner.id
//                          ..title = banner.title
//                          ..link = banner.url
//                          ..collect = false);

/// 接收
//   case RouteName.structureList:
//        var list = settings.arguments as List;
//        Tree tree = list[0] as Tree;
//        int index = list[1];
//        return CupertinoPageRoute(
//            builder: (_) => ArticleCategoryTabPage(tree, index));
//            */

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
  static const String wanna = 'wanna';
  static const String trip = 'trip';
  static const String MAP = 'map';

  static const String MAP_LOCATIONED = "maplocated";
}

/// CupertinoPageRoute 是一种具有带有滑动关闭的苹果页面效果
/// NoAnimRouteBuilder 无动画效果
class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return NoAnimRouteBuilder(ChatPage());
      case RouteName.app:
        return NoAnimRouteBuilder(TabNavigatorPage());
      case RouteName.chat:
        var message = settings.arguments as SessionMsg;
        return CupertinoPageRoute(
            builder: (context) => ChatPage(message: message));
      case RouteName.msglist:
        return NoAnimRouteBuilder(MessagePage());
      case RouteName.MAP:
        return NoAnimRouteBuilder(MapLocationPage());
      case RouteName.search:
        return CupertinoPageRoute(builder: (context) => AppSearchPage());
      case RouteName.video_page:
        return NoAnimRouteBuilder(VideoPage());
      case RouteName.gallay:
        return NoAnimRouteBuilder(Gallery());
      case RouteName.trip:
        return CupertinoPageRoute(builder: (context) => TabNavigatorPage2());
      case RouteName.wanna:
        return CupertinoPageRoute(builder: (context) => TabNavigatorPageWana());
      case RouteName.MAP_LOCATIONED:
        var mapinfo = settings.arguments as Map<String, dynamic>;
        return CupertinoPageRoute(builder: (context) => MapLocationedPage(mapinfo:mapinfo));
      default:
        return CupertinoPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
