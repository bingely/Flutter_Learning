import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:flutter/material.dart' hide NestedScrollView;
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter_qyyim/common/provider/provider_widget.dart';
import 'package:flutter_qyyim/pages/chat/event/MsgEvent.dart';
import 'package:flutter_qyyim/pages/chat/map/map_search_widget.dart';
import 'package:flutter_qyyim/pages/chat/map/place_view.dart';

import 'package:flutter_qyyim/tool/device_utils.dart';
import 'package:flutter_qyyim/tool/misc.dart';
import 'package:flutter_qyyim/tool/toast_util.dart';
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
  List<Marker> _markers = [];

  PlaceViewModle placeViewModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// 套上ProviderWidget包装不过渡刷新
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    var pinnedHeaderHeight =
        //statusBar height
        statusBarHeight * 6 +
            //pinned SliverAppBar height in header
            kToolbarHeight;
    return new Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (context, bool) => _getHeadView(),
      body: _getBodyView(),
      pinnedHeaderSliverHeightBuilder: () {
        return pinnedHeaderHeight;
      },
    ));
  }

  List<Widget> _getHeadView() {
    return [
      SliverAppBar(
          pinned: true,
          expandedHeight: DeviceUtils.winHeight(context) * 0.6,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.send,color: Colors.green,),onPressed: () async {
              final latLng = await _controller?.getLocation();
              _controller.screenShot((data) async {
                var place;
                if (placeViewModel.places.isNotEmpty) {
                  place = placeViewModel.places[0];
                }
                eventBus.fire(MsgEvent(
                    latLng: latLng,
                    type: MsgType.MAP,
                    mapPic: data,
                    place: place));
                Navigator.pop(context);
              });
            },)
          ],
          flexibleSpace: FlexibleSpaceBar(
              //centerTitle: true,
              collapseMode: CollapseMode.pin,
              background: Stack(children: <Widget>[
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
                        setState(() {});
                      } else {
                        ToastUtils.show("open your map permission", context);
                      }
                    },
                  ),
                ),

              ]))),

    ];
  }

  Widget _getBodyView() {
    return (_controller != null)
        ? Column(
      children: <Widget>[
        MapSearchWidget(),
        ProviderWidget<PlaceViewModle>(
          model: PlaceViewModle(),
          onModelReady: (modle) async {
            placeViewModel = modle;
            final latLng = await _controller?.getCenterCoordinate();
            if (latLng != null) {
              modle?.getCurrentLocation(latLng);
            }
          },
          builder: (context, modle, widget) {
            return Expanded(
              child: new ListView.builder(
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
    )
        : Container();
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
  }
}
