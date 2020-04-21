import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:flutter/material.dart' hide NestedScrollView;
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter_qyyim/common/provider/provider_widget.dart';
import 'package:flutter_qyyim/pages/chat/event/AnimEvent.dart';
import 'package:flutter_qyyim/pages/chat/event/MsgEvent.dart';
import 'package:flutter_qyyim/pages/chat/map/map_search_widget.dart';
import 'package:flutter_qyyim/pages/chat/map/place_view.dart';
import 'package:flutter_qyyim/pages/chat/map/pointer.widget.dart';

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

  GlobalKey<NestedScrollViewState> _key = GlobalKey<NestedScrollViewState>();

  TextEditingController textEditingController = TextEditingController();

  /// 当前底部的记录位置
  var mCurrentlistIndex = 0;

  /// 搜索关键词
  String mapPlaceVlaue = "";

  /// 是否第一次定位
  bool firstLocated = true;

  /// 用于区分是列表点击还是，地图移动
  bool isPlaceCheck = false;

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
    var pinnedHeaderHeight = statusBarHeight * 6 + kToolbarHeight;
    return new Scaffold(
        body: NestedScrollView(
      key: _key,
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
            ComMomButton(
              text: '发送',
              style: TextStyle(color: Colors.white),
              width: 65.0,
              margin: EdgeInsets.all(10.0),
              radius: 4.0,
              onTap: () async {
                final latLng = await _controller?.getLocation();
                _controller.screenShot((data) async {
                  var place;
                  if (placeViewModel.places.isNotEmpty) {
                    place = placeViewModel.places[mCurrentlistIndex];
                  }
                  eventBus.fire(MsgEvent(
                      latLng: latLng,
                      type: MsgType.MAP,
                      mapPic: data,
                      place: place));
                  Navigator.pop(context);
                });
              },
            )
          ],
          flexibleSpace: FlexibleSpaceBar(
              //centerTitle: true,
              collapseMode: CollapseMode.pin,
              background: Stack(children: <Widget>[
                Container(
                  child: AmapView(
                    mapType: MapType.Standard,
                    showZoomControl: false,
                    onMapMoveEnd: _handleMapMoveEnd,
                    maskDelay: Duration(milliseconds: 800),
                    onMapClicked: (mapMove) async {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    onMapCreated: (controller) async {
                      if (await requestPermission()) {
                        await controller
                            .showMyLocation(MyLocationOption(show: true));
                        await controller.setZoomLevel(15, animated: false);
                        await controller.showLocateControl(false);
                        await _handleMapMoveEnd(null);
                        setState(() {
                          _controller = controller;
                        });
                      } else {
                        ToastUtils.show("open your map permission", context);
                      }
                    },
                  ),
                ),
                Pointer(pointer: null),
                Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: GestureDetector(
                    onTap: () {
                      _controller?.showMyLocation(MyLocationOption(show: true));
                    },
                    child: Image.asset(
                      'assets/images/wechat_locator.png',
                    ),
                  ),
                ),
              ]))),
    ];
  }

  Future<void> _handleMapMoveEnd(_) async {
    //await onMapMoveEnd(context);
    if (!isPlaceCheck) {
      final latLng = await _controller?.getCenterCoordinate();
      if (latLng != null && mapPlaceVlaue.isEmpty) {
        placeViewModel?.getCurrentLocation(latLng);
      }
      mCurrentlistIndex = 0;
    }
    isPlaceCheck = false;

    eventBus.fire(AnimEvent());
  }

  bool isShow = false;

  Widget _getBodyView() {
    return (_controller != null)
        ? Column(
            children: <Widget>[
              SizedBox(
                height: 16,
              ),
              MapSearchWidget(
                controller: textEditingController,
                onChanged: (value) {
                  mapPlaceVlaue = value;
                  if (value.isNotEmpty) {
                    placeViewModel?.searchKeyWord(value);
                  } else {
                    // 复原底部地址勾选的位置
                    mCurrentlistIndex = 0;
                  }
                },
                onTapClick: () {
                  _key.currentState.currentInnerPosition.animateTo(0.0,
                      duration: Duration(milliseconds: 100),
                      curve: Curves.easeIn);

                  //_key.currentState.currentInnerPosition.animateTo(DeviceUtils.winHeight(context) * 0.6, duration: Duration(milliseconds: 100), curve: Curves.easeIn);
                  setState(() {
                    isShow = true;
                  });
                },
                isShow: isShow,
                onCancel: () {
                  setState(() {
                    isShow = false;
                    textEditingController.clear();
                    mapPlaceVlaue = "";
                  });
                },
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
                builder: (context, modle, widget) {
                  return Expanded(
                    child: new ListView.builder(
                      padding: EdgeInsets.all(8.0),
                      reverse: false,
                      itemBuilder: (context, int index) {
                        var place = modle.places[index];
                        return new PlaceView(
                          place,
                          index: index,
                          mindex: mCurrentlistIndex,
                          onpress: () {
                            isPlaceCheck = true;
                            mCurrentlistIndex = index;
                            // 重新确定中心坐标
                            _controller.setCenterCoordinate(
                                place.latLng.latitude, place.latLng.longitude);
                            place.isCheck = true;
                            setState(() {});
                          },
                        );
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
    // 第一次定位为当前位置
    var center;
    if (firstLocated) {
      center = await _controller?.getLocation();
      firstLocated = false;
    } else {
      center = await _controller?.getCenterCoordinate();
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
}
