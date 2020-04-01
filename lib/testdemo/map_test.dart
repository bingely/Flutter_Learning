import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:amap_search_fluttify/amap_search_fluttify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/tool/log_utils.dart';
import 'package:flutter_qyyim/tool/misc.dart';
import 'package:flutter_qyyim/tool/toast_util.dart';
import 'package:flutter_qyyim/ui/commom_button.dart';

class MapTestPage extends StatefulWidget {
  @override
  _MapTestPageState createState() => new _MapTestPageState();
}

class _MapTestPageState extends State<MapTestPage> {
  AmapController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('maptestpage'),
      ),
      body: AmapView(
        mapType: MapType.Standard,
        showZoomControl: false,
        maskDelay: Duration(milliseconds: 500),
        onMapCreated: (controller) async {
          _controller = controller;
          if (await requestPermission()) {
            await controller.showMyLocation(MyLocationOption(show: true));


            onTap();
          } else {
            ToastUtils.show("open your map permission", context);

          }
        },
      ),
    );
  }

  onTap() async {
    final poiList = await AmapSearch.searchKeyword(
      "肯德基",
      city: "深圳",
    );

    poiList?.forEach((Pois) {
      LogUtil.e(Pois.title);
    });
  }
}
