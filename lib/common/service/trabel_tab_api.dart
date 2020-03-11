import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/models/travel_tab_model.dart';

import 'dio.dart';

///旅拍类别接口
String tab = 'http://www.devio.org/io/flutter_app/json/travel_page.json';

Future<TravelTabModel> fetchTravelTab() async {
  Response response = await dio.get(tab);
  print("${response.data}===>${response.statusCode}");

  if (response.statusCode == 200) {
    TravelTabModel travelTabModel = TravelTabModel.fromJson(response.data);
    print(travelTabModel.params);
    return travelTabModel;
  }
}



///旅拍页接口 ??
const _TRAVEL_URL =
    'https://m.ctrip.com/restapi/soa2/16189/json/searchTripShootListForHomePageV2?_fxpcqlniredt=09031014111431397988&__gw_appid=99999999&__gw_ver=1.0&__gw_from=10650013707&__gw_platform=H5';

fetchTravePage() async {
  Response response = await dio.post(_TRAVEL_URL);
  response = await dio.post("/test", data: {"id": 12, "name": "wendu"});


}

var Params = {
  "districtId": -1,
  "groupChannelCode": "RX-OMF",
  "type": null,
  "lat": -180,
  "lon": -180,
  "locatedDistrictId": 0,
  "pagePara": {
    "pageIndex": 1,
    "pageSize": 10,
    "sortType": 9,
    "sortDirection": 0
  },
  "imageCutType": 1,
  "head": {'cid': "09031014111431397988"},
  "contentType": "json"
};

/*class TravelDao {
  static Future<TravelItemModel> fetch(
      String url,Map params, String groupChannelCode, int pageIndex, int pageSize) async {
    Map paramsMap = params['pagePara'];
    paramsMap['pageIndex'] = pageIndex;
    paramsMap['pageSize'] = pageSize;
    params['groupChannelCode'] = groupChannelCode;
    final response = await http.post(url, body: jsonEncode(params));
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      return TravelItemModel.fromJson(result);
    } else {
      throw Exception('Failed to load travel');
    }
  }
}*/
