import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:amap_search_fluttify/amap_search_fluttify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/provider/provider_widget.dart';
import 'package:flutter_qyyim/pages/chat/event/MsgEvent.dart';
import 'package:flutter_qyyim/pages/chat/map/place.dart';
import 'package:flutter_qyyim/pages/chat/map/place_view.dart';
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
class MapLocationPage extends StatefulWidget {
  @override
  _MapLocationPageState createState() => new _MapLocationPageState();
}

class _MapLocationPageState extends State<MapLocationPage> {

  AmapController _controller;

  String showAddressText = "周围的数据";
  ScrollController sC;
  List<Marker> _markers = [];

  var index = 0;

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
      body: Column(
        children: <Widget>[
          Stack(children: <Widget>[
            Container(
              child: AmapView(
                mapType: MapType.Standard,
                showZoomControl: false,
                onMapMoveEnd: (mapMove) async {
                  await onMapMoveEnd(context);
                  final latLng = await _controller?.getCenterCoordinate();
                  if (latLng != null) {
                    placeViewModel?.getCurrentLocation(latLng);
                  }
                },
                maskDelay: Duration(milliseconds: 500),
                onMapCreated: (controller) async {
                  _controller = controller;
                  if (await requestPermission()) {
                    await controller
                        .showMyLocation(MyLocationOption(show: true));
                    await controller.setZoomLevel(16);
                    setState(() {
                    });
                  } else {
                    ToastUtils.show("open your map permission", context);
                  }

                },
              ),
              height: 455,
            ),
            Positioned(
              top: 35,
              left: 8,
              child: FlatButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text(
                  '取消',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
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
                  _controller.screenShot((data) async {
                    var place;
                    if (placeViewModel.places.isNotEmpty) {
                       place = placeViewModel.places[0];
                    }
                    eventBus.fire(MsgEvent(
                        latLng: latLng, type: MsgType.MAP, mapPic: data,place: place));
                    Navigator.pop(context);
                  });
                },
              ),
            )
          ]),
          (_controller != null)
              ? Flexible(
            child: Column(
              children: <Widget>[
                //Text('$showAddressText'),
                Text('$index'),
                SearchBar(
                  searchBarType: SearchBarType.homeLight,
                  defaultText: '搜索地址',
                  leftButtonClick: () {},
                ),
                ProviderWidget<PlaceViewModle>(
                  model: PlaceViewModle(),
                  onModelReady: (modle) async {
                    placeViewModel = modle;
                    final latLng = await _controller?.getCenterCoordinate();
                    if (latLng != null) {
                      modle?.getCurrentLocation(latLng);
                    }
                  },
                  builder: (context, modle, widget){
                    return Flexible(
                      child: new ListView.builder(
                        controller: sC,
                        shrinkWrap: true,
                        padding: EdgeInsets.all(8.0),
                        reverse: false,
                        itemBuilder: (context, int index) {
                          return new PlaceView(modle.places[index]);
                        },
                        itemCount: modle.places?.length,
                      ),
                    );
                  },
                ),
              ],
            ),
          )
              : Container(),
        ],
      ),
    );
  }

  Future onMapMoveEnd(BuildContext context) async {
    final center = await _controller?.getCenterCoordinate();
    if (_markers.isNotEmpty) {
      await _markers[0].remove();
      _markers.removeAt(0);
    }
    final marker = await _controller?.addMarker(
      MarkerOption(
        latLng: center,
        title: '北京',
        snippet: '描述',
        iconUri: _assetsIcon1,
        imageConfig: createLocalImageConfiguration(context),
        width: 58,
        height: 58,
        object: '自定义数据',
      ),
    );
    _markers.add(marker);


    index++;
  }
}
