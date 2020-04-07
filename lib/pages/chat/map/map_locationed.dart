import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:amap_search_fluttify/amap_search_fluttify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/provider/provider_widget.dart';
import 'package:flutter_qyyim/pages/chat/event/MsgEvent.dart';
import 'package:flutter_qyyim/pages/chat/map/map_search_widget.dart';
import 'package:flutter_qyyim/pages/chat/map/place.dart';
import 'package:flutter_qyyim/pages/chat/map/place_view.dart';
import 'package:flutter_qyyim/pages/search/search.dart';
import 'package:flutter_qyyim/testdemo/trip/model/travel_model.dart';
import 'package:flutter_qyyim/testdemo/trip/widget/search_bar.dart';
import 'package:flutter_qyyim/tool/device_utils.dart';
import 'package:flutter_qyyim/tool/log_utils.dart';
import 'package:flutter_qyyim/tool/misc.dart';
import 'package:flutter_qyyim/tool/toast_util.dart';
import 'package:flutter_qyyim/ui/commom_bar.dart';
import 'package:flutter_qyyim/ui/commom_button.dart';
import 'package:flutter_qyyim/view_model/place_view_model.dart';

import '../../../testdemo/cross_data/event_bus.dart';

final _assetsIcon1 = Uri.parse('assets/images/wechat_locate.png');

/// 定位地图
class MapLocationedPage extends StatefulWidget {
  @override
  _MapLocationedPageState createState() => new _MapLocationedPageState();
}

class _MapLocationedPageState extends State<MapLocationedPage> {
  AmapController _controller;

  String showAddressText = "周围的数据";
  ScrollController sC;
  List<Marker> _markers = [];

  PlaceViewModle placeViewModel;

  @override
  void initState() {
    super.initState();
    sC = new ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// 套上ProviderWidget包装不过渡刷新
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: ComMomBar(title: '位置信息'),
      body: Column(
        children: <Widget>[
          Container(
            child: AmapView(
              mapType: MapType.Standard,
              showZoomControl: false,
              maskDelay: Duration(milliseconds: 500),
              onMapCreated: (controller) async {
                _controller = controller;
                if (await requestPermission()) {
                  await controller.showMyLocation(MyLocationOption(show: true));
                  await controller.setZoomLevel(16);
                  setState(() {});
                } else {
                  ToastUtils.show("open your map permission", context);
                }
              },
            ),
            height: DeviceUtils.winHeight(context) * 0.6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'hhhh',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        '距离米   |   fff',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
