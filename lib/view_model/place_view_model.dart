import 'package:amap_search_fluttify/amap_search_fluttify.dart';
import 'package:flutter_qyyim/common/provider/view_state_model.dart';
import 'package:flutter_qyyim/pages/chat/map/place.dart';
import 'package:flutter_qyyim/tool/log_utils.dart';

class PlaceViewModle extends ViewStateModel {


  List<String> poiTitleList = [];
  List<Place> places =[];



  searchKeyWord(String key) async {
    final poiList = await AmapSearch.fetchInputTips(
      key,
      city: "深圳",
    );

    await showfetchInputTips(poiList);
  }


  /// 获取当前位置的周围数据
  getCurrentLocation(LatLng latLng) async {
    final poiList = await AmapSearch.searchAround(
        latLng,radius: 2000
    );

    await showPlaceListData(poiList);


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

  Future showPlaceListData(List<Poi> poiList) async {
    places.clear();
    poiList.forEach((poi) async {
      Place place = new Place();
      place.title = await poi.title;
      place.distance = await poi.distance;
      place.cityName = await poi.cityName;
      place.address = await poi.address;
      place.latLng= await poi.latLng;

      places.add(place);
      //String poiString = await poi.toFutureString();
     // LogUtil.e('$poiString');
      if (poiList.last == poi) {
        LogUtil.e('查询到数据${places.length}');
        setIdle();
      }
    });
  }

  Future showfetchInputTips(List<InputTip> poiList) async {
    places.clear();
    poiList.forEach((poi) async {
      Place place = new Place();
      place.title = await poi.name;
      place.cityName = await poi.district;
      place.address = await poi.address;
      place.latLng= await poi.location;

      places.add(place);
      //String poiString = await poi.toFutureString();
      // LogUtil.e('$poiString');
      if (poiList.last == poi) {
        LogUtil.e('查询到数据${places.length}');
        setIdle();
      }
    });
  }
}
