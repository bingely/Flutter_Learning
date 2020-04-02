import 'package:amap_search_fluttify/amap_search_fluttify.dart';
import 'package:flutter_qyyim/common/provider/view_state_model.dart';
import 'package:flutter_qyyim/pages/chat/map/place.dart';

class PlaceViewModle extends ViewStateModel {
  onTap() async {
    /*final poiList = await AmapSearch.searchKeyword(
      "肯德基",
      city: "深圳",
    );

    poiList?.forEach((Pois) {
      LogUtil.e(Pois.title);
    });*/
  }

  List<String> poiTitleList = [];
  List<Place> places;


  /// 获取当前位置的周围数据
  getCurrentLocation(LatLng latLng) async {
    final poiList = await AmapSearch.searchAround(
      LatLng(
        double.tryParse(latLng?.latitude.toString()) ?? 29.08,
        double.tryParse(latLng.longitude.toString()) ?? 119.65,
      ),
    );

    await Stream.fromIterable(poiList)
        .asyncMap((it) async {
          Place place = new Place();
          place.cityName = await it.cityName;
          place.tile = await it.address;
        })
        .toList()
        .then((value) {
          places = value;
         // setIdle();
        });
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
        .then((it) {
      poiTitleList = it;
      setIdle();
    });
  }
}
