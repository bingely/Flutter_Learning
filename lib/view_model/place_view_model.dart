import 'package:amap_search_fluttify/amap_search_fluttify.dart';
import 'package:flutter_qyyim/common/provider/view_state_model.dart';
import 'package:flutter_qyyim/pages/chat/map/place.dart';
import 'package:flutter_qyyim/tool/log_utils.dart';

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
  List<Place> places =[];


  /// 获取当前位置的周围数据
  getCurrentLocation(LatLng latLng) async {
    final poiList = await AmapSearch.searchAround(
      LatLng(
        double.tryParse(latLng?.latitude.toString()) ?? 29.08,
        double.tryParse(latLng.longitude.toString()) ?? 119.65,
      ),
    );

    places.clear();
    poiList.forEach((poi) async {
      Place place = new Place();
      place.title = await poi.title;
     // place.distance = (await poi.distance).toString();
      place.cityName = await poi.cityName;
      place.address = await poi.address;
      LogUtil.e('${poi.toFutureString()}');
      places.add(place);
    });

    setIdle();

    /*await Stream.fromIterable(poiList)
        .asyncMap((it) async {
          Place place = new Place();
          place.title = await it.title;
          //place.distance = (await it.distance).toString();
          place.cityName = await it.cityName;
          place.address = await it.address;
        })
        .toList()
        .then((value) {
          //places = value;
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
      //setIdle();
    });*/
  }
}
