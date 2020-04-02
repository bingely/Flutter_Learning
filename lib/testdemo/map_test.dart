import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/pages/chat/event/MsgEvent.dart';
import 'package:flutter_qyyim/testdemo/trip/model/travel_model.dart';
import 'package:flutter_qyyim/tool/device_utils.dart';
import 'package:flutter_qyyim/tool/log_utils.dart';
import 'package:flutter_qyyim/tool/misc.dart';
import 'package:flutter_qyyim/tool/toast_util.dart';
import 'package:flutter_qyyim/ui/commom_bar.dart';
import 'package:flutter_qyyim/ui/commom_button.dart';

import 'cross_data/event_bus.dart';

class MapTestPage extends StatefulWidget {
  @override
  _MapTestPageState createState() => new _MapTestPageState();
}

class _MapTestPageState extends State<MapTestPage> {
  AmapController _controller;

  String showAddressText = "周围的数据";

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
      body: Column(
        children: <Widget>[
          Stack(children: <Widget>[
            Container(
              child: AmapView(
                mapType: MapType.Standard,
                showZoomControl: false,
                maskDelay: Duration(milliseconds: 500),
                onMapCreated: (controller) async {
                  _controller = controller;
                  if (await requestPermission()) {
                    await controller.setZoomLevel(16);
                    await controller
                        .showMyLocation(MyLocationOption(show: true));


                    /*final marker = await _controller?.addMarker(
                      MarkerOption(
                        latLng: LatLng(22.53233,113.952584),
                        title: '北京',
                        snippet: '描述',
                        iconUri: Uri.parse('images/test_icon.png'),
                        imageConfig: createLocalImageConfiguration(context),
                        width: 48,
                        height: 48,
                        object: '自定义数据',
                      ),
                    );
                    _markers.add(marker);*/
                  } else {
                    ToastUtils.show("open your map permission", context);
                  }
                },
              ),
              height: 455,
            ),
            Positioned(
              top: 45,
              left: 16,
              child: Text(
                '取消',
                style: TextStyle(color: Colors.white,fontSize: 18),
              ),
            ),
            Positioned(
              right: 16,
              top: 45,
              child: ComMomButton(
                text: '发送',
                height: 35,
                width: 65,
                onTap: () async {
                  final latLng = await _controller?.getLocation();
                  ToastUtils.show('当前经纬度Extension: ${latLng.toString()}', context);


                  _controller.screenShot((data) async {

                    eventBus.fire(MsgEvent(latLng: latLng,type: MsgType.MAP,mapPic: data));
                    Navigator.pop(context);

                  });






                },
              ),
            )
          ]),
          Column(
            children: <Widget>[
              ComMomButton(
                  text: "查询",
                  onTap: () {
                    getCurrentLocation();
                  }),
              Text('$showAddressText'),
            ],
          ),
        ],
      ),
    );
  }

  onTap() async {
    /*final poiList = await AmapSearch.searchKeyword(
      "肯德基",
      city: "深圳",
    );

    poiList?.forEach((Pois) {
      LogUtil.e(Pois.title);
    });*/
  }

  List<String> _poiTitleList = [];

  getCurrentLocation() async {
    final latLng = await _controller?.getLocation();
    ToastUtils.show('当前经纬度Extension: ${latLng.toString()}', context);



    /*final poiList = await AmapSearch.searchAround(
      LatLng(
        double.tryParse(latLng?.latitude.toString()) ?? 29.08,
        double.tryParse(latLng.longitude.toString()) ?? 119.65,
      ),
    );

    Stream.fromIterable(poiList)
        .asyncMap((it) async =>
            'title: ' +
            (await it.title) +
            ', address: ' +
            (await it.address) +
            ', businessArea: ' +
            (await it.businessArea) +
            ', ' +
            (await it.latLng).toString())
        .toList()
        .then((it) => setState(() {
              _poiTitleList = it;
              showAddressText = _poiTitleList.toString();
            }));*/
  }
}
