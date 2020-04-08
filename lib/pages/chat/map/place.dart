import 'package:amap_search_fluttify/amap_search_fluttify.dart';

class Place {

//  return 'Poi{title: ${await title}, latLng: ${await latLng}, cityName: ${await cityName}, cityCode: ${await cityCode}, provinceName: ${await provinceName}, provinceCode: ${await provinceCode}, tel: ${await tel}, poiId: ${await poiId}, businessArea: ${await businessArea}, distance: ${await distance}, adName: ${await adName}, adCode: ${await adCode}';
  String title;
  String address;
  String cityName;
  int distance;

  bool isCheck = false;

  LatLng latLng;
}