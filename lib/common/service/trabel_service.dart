import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/testdemo/trip/model/home_model.dart';
import 'package:flutter_qyyim/testdemo/trip/model/travel_model.dart';
import 'package:flutter_qyyim/testdemo/trip/model/travel_tab_model.dart';

import 'dio.dart';

///旅拍类别接口
String tab = 'http://www.devio.org/io/flutter_app/json/travel_page.json';

///旅拍页接口 ??
const _TRAVEL_URL =
    'https://m.ctrip.com/restapi/soa2/16189/json/searchTripShootListForHomePageV2?_fxpcqlniredt=09031014111431397988&__gw_appid=99999999&__gw_ver=1.0&__gw_from=10650013707&__gw_platform=H5';
const HOME_URL = 'http://www.devio.org/io/flutter_app/json/home_page.json';

class TravelResponsitory {


  static Future<HomeModel> fetchHome() async {
    final response = await dio.get(HOME_URL);
    print("${response.data}===>${response.statusCode}");
    if (response.statusCode == 200) {
      return HomeModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load home_page.json');
    }


  }

  ///旅拍类别
  static Future<TravelTabModel> fetchTravelTab() async {
    Response response = await dio.get(tab);
    print("${response.data}===>${response.statusCode}");

    if (response.statusCode == 200) {
      TravelTabModel travelTabModel = TravelTabModel.fromJson(response.data);
      print(travelTabModel.params);
      return travelTabModel;
    } else {
      throw Exception("Failed to load travel_page.json");
    }
  }
  ///旅拍类别下的
  static Future<TravelItemModel> fetchTravelItems(String url, Map params,
      String groupChannelCode, int pageIndex, int pageSize) async {
    /*Map paramsMap = params['pagePara'];
  paramsMap['pageIndex'] = pageIndex;
  paramsMap['pageSize'] = pageSize;
  params['groupChannelCode'] = groupChannelCode;*/
    String url =
        'http://m.ctrip.com/restapi/soa2/16189/json/searchTripShootListForHomePageV2?_fxpcqlniredt=09031067310459746558&__gw_appid=99999999&__gw_ver=1.0&__gw_from=10650013707&__gw_platform=H5';

    final response = await dio.post(url, queryParameters: Params);
    print("fetchTravelItems${response.data}===>${response.statusCode}");

    return TravelItemModel.fromJson(datA);
    if (response.statusCode == 200) {
      return TravelItemModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load travel');
    }
  }
}

var Params = {
  "districtId": -1,
  "groupChannelCode": "tourphoto_global1",
  "type": 1,
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
  "head": {
    "cid": "09031067310459746558",
    "ctok": "",
    "cver": "1.0",
    "lang": "01",
    "sid": "8888",
    "syscode": "09",
    "auth": null,
    "extension": [
      {"name": "tecode", "value": "h5"},
      {"name": "protocal", "value": "https"}
    ]
  },
  "contentType": "json"
};

var datA = {
  "ResponseStatus": {
    "Timestamp": "/Date(1584081057874+0800)/",
    "Ack": "Success",
    "Errors": [
    ],
    "Extension": [
      {
        "Id": "CLOGGING_TRACE_ID",
        "Value": "5615062684093416652"
      },
      {
        "Id": "RootMessageId",
        "Value": "921812-0a3c6f3a-440022-1656041"
      }
    ]
  },
  "totalCount": 500,
  "resultList": [
    {
      "type": 1,
      "article": {
        "articleId": 6555412,
        "articleType": "tag",
        "strategyItemId": 146,
        "productType": 5,
        "sourceType": 126,
        "articleTitle": "旅行酷体验 | 在两千年前的遗迹里泡一泡温泉。  位于土耳其棉花堡的希拉波利斯，这里是埃及艳后念念不",
        "author": {
          "authorId": 4908,
          "nickName": "笑妍日记",
          "describe": "",
          "clientAuth": "6FAEAFB6D5D813F3F1A0A2BA8D09DBEE",
          "jumpUrl": "https://m.ctrip.com/webapp/you/user?clientAuth=6FAEAFB6D5D813F3F1A0A2BA8D09DBEE",
          "coverImage": {
            "dynamicUrl": "https://dimg04.c-ctrip.com/images/Z8090500000012pcu1655_C_180_180.jpg",
            "originalUrl": "https://dimg04.c-ctrip.com/images/Z8090500000012pcu1655_C_180_180.jpg"
          },
          "qualification": "https://pages.c-ctrip.com/you/note/balloon_author.png",
          "identityType": 13,
          "identityTypeName": "签约旅行家",
          "followCount": 14437
        },
        "images": [
          {
            "imageId": 462172115,
            "dynamicUrl": "https://youimg1.c-ctrip.com/target/1A0j1900000163ingFEE7_R_800_10000_Q50.jpg?proc=source/tripshoot",
            "originalUrl": "https://youimg1.c-ctrip.com/target/1A0j1900000163ingFEE7.jpg",
            "width": 1920,
            "height": 1280,
            "mediaType": 0,
            "lat": 0,
            "lon": 0,
            "isWaterMarked": true
          }
        ],
        "hasVideo": false,
        "readCount": 10254,
        "likeCount": 881,
        "commentCount": 182,
        "shareCount": 0,
        "urls": [
          {
            "version": "article",
            "appUrl": "ctrip://wireless/h5?page=index.html#detail/6555412.html&path=destination/article&navBarStyle=white",
            "h5Url": "https://m.ctrip.com/webapp/you/article/detail/6555412.html",
            "wxUrl": "/pages/article/detail?articleId=6555412"
          },
          {
            "version": "tripShoot",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NjU1NTQxMg==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=6555412",
            "wxUrl": "/pages/detail/detail?articleId=6555412"
          },
          {
            "version": "tripShoot2",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NjU1NTQxMg==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=6555412",
            "wxUrl": "/pages/you/lvpai/detail/detail?articleId=6555412"
          }
        ],
        "tags": [
          {
            "tagId": 102046,
            "tagName": "摄影",
            "tagLevel": 2,
            "parentTagId": 102000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 102039,
            "tagName": "温泉",
            "tagLevel": 2,
            "parentTagId": 102000,
            "source": 0,
            "sortIndex": 0
          }
        ],
        "topics": [
          {
            "topicId": 12,
            "topicName": "旅行酷体验",
            "level": 1
          }
        ],
        "operationTopics": [
          {
            "topicId": 27446,
            "topicName": "一言不合就泡汤",
            "level": 1,
            "image": {
              "imageId": 473023659,
              "dynamicUrl": "https://youimg1.c-ctrip.com/target/100u1a0000018uuq97FED_R_640_10000_Q90.jpg",
              "originalUrl": "https://youimg1.c-ctrip.com/target/100u1a0000018uuq97FED.jpg",
              "width": 1280,
              "height": 854,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            }
          }
        ],
        "pois": [
          {
            "poiType": 3,
            "poiId": 18126841,
            "poiName": "棉花堡温泉池",
            "businessId": 1508501,
            "districtId": 1445281,
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=18126841&poiType=3&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=18126841&poiType=3&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 0,
            "isInChina": false,
            "countryName": "土耳其"
          },
          {
            "poiType": 4,
            "poiId": 1445281,
            "poiName": "棉花堡",
            "districtId": 1445281,
            "districtName": "棉花堡",
            "districtENName": "Pamukkale",
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=1445281&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=1445281&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 1,
            "isInChina": false
          }
        ],
        "publishTime": "2019-10-12 10:12:33",
        "publishTimeDisplay": "2019-10-12",
        "shootTime": "2019-10-09 05:01:48",
        "shootTimeDisplay": "2019-10-09",
        "level": 3,
        "distanceText": "",
        "isLike": false,
        "imageCounts": 9,
        "isCollected": false,
        "collectCount": 41,
        "articleStatus": 2,
        "poiName": "棉花堡",
        "shareInfo": {
          "imageUrl": "https://youimg1.c-ctrip.com/target/1A0j1900000163ingFEE7_C_454_358_Q90.jpg?proc=source/tripshoot",
          "shareTitle": "笑妍日记在棉花堡温泉池发了一篇超赞的旅拍，快来围观！",
          "shareContent": "旅行酷体验|在两千年前的遗迹里",
          "platForm": "all",
          "token": "cda9748373ac4d149c3a1994219c342a"
        },
        "currentDate": "2020.03.13",
        "sourceId": 0
      }
    },
    {
      "type": 1,
      "article": {
        "articleId": 4929869,
        "articleType": "reside",
        "strategyItemId": 176,
        "productType": 5,
        "sourceType": 126,
        "articleTitle": "奥地利瓦豪河谷（Wachau）指的是梅尔克（Melk）到克雷姆斯（Krems）这一段30千米的多瑙河",
        "author": {
          "authorId": 37637,
          "nickName": "牛奔走天下",
          "describe": "",
          "clientAuth": "A3FF717B35F2356549BC3EF54FC6216B",
          "jumpUrl": "https://m.ctrip.com/webapp/you/user?clientAuth=A3FF717B35F2356549BC3EF54FC6216B",
          "coverImage": {
            "dynamicUrl": "https://dimg04.c-ctrip.com/images/Z80m09000000429yz843D_C_180_180.jpg",
            "originalUrl": "https://dimg04.c-ctrip.com/images/Z80m09000000429yz843D_C_180_180.jpg"
          },
          "identityType": 13,
          "identityTypeName": "签约旅行家",
          "followCount": 18535
        },
        "images": [
          {
            "imageId": 311649622,
            "dynamicUrl": "https://youimg1.c-ctrip.com/target/1A0213000000ue7zx0B0C_R_800_10000_Q50.jpg?proc=source/tripshoot",
            "originalUrl": "https://youimg1.c-ctrip.com/target/1A0213000000ue7zx0B0C.jpg",
            "width": 1920,
            "height": 1280,
            "mediaType": 0,
            "lat": 0,
            "lon": 0,
            "isWaterMarked": true
          }
        ],
        "hasVideo": false,
        "readCount": 2021,
        "likeCount": 177,
        "commentCount": 15,
        "shareCount": 0,
        "urls": [
          {
            "version": "article",
            "appUrl": "ctrip://wireless/h5?page=index.html#detail/4929869.html&path=destination/article&navBarStyle=white",
            "h5Url": "https://m.ctrip.com/webapp/you/article/detail/4929869.html",
            "wxUrl": "/pages/article/detail?articleId=4929869"
          },
          {
            "version": "tripShoot",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NDkyOTg2OQ==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=4929869",
            "wxUrl": "/pages/detail/detail?articleId=4929869"
          },
          {
            "version": "tripShoot2",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NDkyOTg2OQ==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=4929869",
            "wxUrl": "/pages/you/lvpai/detail/detail?articleId=4929869"
          }
        ],
        "tags": [
          {
            "tagId": 109072,
            "tagName": "世界文化遗产",
            "tagLevel": 2,
            "parentTagId": 109000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 114004,
            "tagName": "特产",
            "tagLevel": 2,
            "parentTagId": 114000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 109011,
            "tagName": "小镇乡村",
            "tagLevel": 2,
            "parentTagId": 109000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 102032,
            "tagName": "当地特色",
            "tagLevel": 2,
            "parentTagId": 102000,
            "source": 0,
            "sortIndex": 0
          }
        ],
        "topics": [
          {
            "topicId": 3096,
            "topicName": "一学就会拍照技术流",
            "level": 1
          },
          {
            "topicId": 6544,
            "topicName": "踏青赏花正当时",
            "level": 1
          },
          {
            "topicId": 3097,
            "topicName": "景点拍照指南",
            "level": 1
          },
          {
            "topicId": 3100,
            "topicName": "春天去哪玩",
            "level": 1
          }
        ],
        "operationTopics": [
        ],
        "pois": [
          {
            "poiType": 3,
            "poiId": 92781,
            "poiName": "梅尔克小镇",
            "businessId": 122988,
            "districtId": 46847,
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=92781&poiType=3&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=92781&poiType=3&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 0,
            "isInChina": false,
            "countryName": "奥地利"
          },
          {
            "poiType": 4,
            "poiId": 46847,
            "poiName": "梅尔克",
            "districtId": 46847,
            "districtName": "梅尔克",
            "districtENName": "Melk",
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=46847&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=46847&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 1,
            "isInChina": false
          }
        ],
        "publishTime": "2019-04-15 11:52:46",
        "publishTimeDisplay": "2019-04-15",
        "shootTime": "2019-04-15 11:49:05",
        "shootTimeDisplay": "2019-04-15",
        "level": 3,
        "distanceText": "",
        "isLike": false,
        "imageCounts": 9,
        "isCollected": false,
        "collectCount": 13,
        "articleStatus": 2,
        "poiName": "梅尔克",
        "shareInfo": {
          "imageUrl": "https://youimg1.c-ctrip.com/target/1A0213000000ue7zx0B0C_C_454_358_Q90.jpg?proc=source/tripshoot",
          "shareTitle": "牛奔走天下在梅尔克小镇发了一篇超赞的旅拍，快来围观！",
          "shareContent": "奥地利瓦豪河谷（Wachau）",
          "platForm": "all",
          "token": "48a10b381dba40bc9d9037d4e2e180d3"
        },
        "currentDate": "2020.03.13",
        "sourceId": 0
      }
    },
    {
      "type": 1,
      "article": {
        "articleId": 7681164,
        "articleType": "newArticle",
        "strategyItemId": 148,
        "productType": 5,
        "sourceType": 126,
        "articleTitle": "杭州 | 宋城千古情，一生必看的演出。  走进宋城仿佛就进入了一个新的世界，整个宋城里面的建筑都是仿",
        "author": {
          "authorId": 864500,
          "nickName": "未知同学",
          "clientAuth": "045EF6000CF1DBAB15D409E239B2D965",
          "jumpUrl": "https://m.ctrip.com/webapp/you/user?clientAuth=045EF6000CF1DBAB15D409E239B2D965",
          "coverImage": {
            "dynamicUrl": "https://dimg04.c-ctrip.com/images/Z80r1e000001erdhp9A6C_C_180_180.jpg",
            "originalUrl": "https://dimg04.c-ctrip.com/images/Z80r1e000001erdhp9A6C_C_180_180.jpg"
          },
          "followCount": 148
        },
        "images": [
          {
            "imageId": 487215097,
            "dynamicUrl": "https://youimg1.c-ctrip.com/target/1A0f1e000001f869e5C79_R_800_10000_Q50.jpg?proc=source/tripshoot",
            "originalUrl": "https://youimg1.c-ctrip.com/target/1A0f1e000001f869e5C79.jpg",
            "width": 924,
            "height": 739,
            "mediaType": 0,
            "lat": 0,
            "lon": 0,
            "isWaterMarked": true
          }
        ],
        "hasVideo": false,
        "readCount": 1571,
        "likeCount": 77,
        "commentCount": 2,
        "shareCount": 0,
        "urls": [
          {
            "version": "article",
            "appUrl": "ctrip://wireless/h5?page=index.html#detail/7681164.html&path=destination/article&navBarStyle=white",
            "h5Url": "https://m.ctrip.com/webapp/you/article/detail/7681164.html",
            "wxUrl": "/pages/article/detail?articleId=7681164"
          },
          {
            "version": "tripShoot",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NzY4MTE2NA==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=7681164",
            "wxUrl": "/pages/detail/detail?articleId=7681164"
          },
          {
            "version": "tripShoot2",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NzY4MTE2NA==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=7681164",
            "wxUrl": "/pages/you/lvpai/detail/detail?articleId=7681164"
          }
        ],
        "tags": [
        ],
        "topics": [
          {
            "topicId": 12775,
            "topicName": "超好玩的主题乐园",
            "level": 2
          },
          {
            "topicId": 12552,
            "topicName": "一日穿越回宋朝",
            "level": 2
          },
          {
            "topicId": 12798,
            "topicName": "看一场特色表演",
            "level": 2
          },
          {
            "topicId": 32702,
            "topicName": "去年三月你在哪儿",
            "level": 1,
            "image": {
              "imageId": 486268113,
              "dynamicUrl": "https://youimg1.c-ctrip.com/target/100w0q000000gra5p4BAE_R_640_10000_Q90.jpg",
              "originalUrl": "https://youimg1.c-ctrip.com/target/100w0q000000gra5p4BAE.jpg",
              "width": 1280,
              "height": 854,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            },
            "iconImage": {
              "imageId": 485074271,
              "dynamicUrl": "https://youimg1.c-ctrip.com/target/100m0z000000nzaz305A6_R_640_10000_Q90.png",
              "originalUrl": "https://youimg1.c-ctrip.com/target/100m0z000000nzaz305A6.png",
              "width": 39,
              "height": 45,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            }
          },
          {
            "topicId": 31722,
            "topicName": "疫情结束后最想去哪儿",
            "level": 1,
            "image": {
              "imageId": 484647830,
              "dynamicUrl": "https://youimg1.c-ctrip.com/target/100t1d000001e9p3b8763_R_640_10000_Q90.jpg",
              "originalUrl": "https://youimg1.c-ctrip.com/target/100t1d000001e9p3b8763.jpg",
              "width": 1920,
              "height": 1280,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            }
          }
        ],
        "operationTopics": [
        ],
        "pois": [
          {
            "poiType": 3,
            "poiId": 10558619,
            "poiName": "杭州宋城景区",
            "businessId": 4081,
            "districtId": 14,
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=10558619&poiType=3&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=10558619&poiType=3&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 0,
            "isInChina": true,
            "countryName": "中国"
          },
          {
            "poiType": 4,
            "poiId": 14,
            "poiName": "杭州",
            "districtId": 14,
            "districtName": "杭州",
            "districtENName": "Hangzhou",
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=14&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=14&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 1,
            "isInChina": true
          }
        ],
        "publishTime": "2020-03-13 12:25:11",
        "publishTimeDisplay": "2小时前",
        "shootTime": "2020-03-08 19:09:45",
        "shootTimeDisplay": "2020-03-08",
        "level": 2,
        "distanceText": "",
        "isLike": false,
        "imageCounts": 9,
        "isCollected": false,
        "collectCount": 12,
        "articleStatus": 2,
        "poiName": "杭州",
        "shareInfo": {
          "imageUrl": "https://youimg1.c-ctrip.com/target/1A0f1e000001f869e5C79_C_454_358_Q90.jpg?proc=source/tripshoot",
          "shareTitle": "未知同学在杭州宋城景区发了一篇超赞的旅拍，快来围观！",
          "shareContent": "杭州|宋城千古情，一生必看的演",
          "platForm": "all",
          "token": "001c20632a7046b8b2395e88b6cd6921"
        },
        "currentDate": "2020.03.13",
        "sourceId": 0
      }
    },
    {
      "type": 1,
      "article": {
        "articleId": 5740019,
        "articleType": "reside",
        "strategyItemId": 147,
        "productType": 5,
        "sourceType": 126,
        "articleTitle": "佩特拉古城，又称玫瑰古城，特殊的地貌使这里呈现出绝美的颜色，公元前200年纳巴泰人在此建造了他们的都",
        "author": {
          "authorId": 397396,
          "nickName": "伍天意",
          "clientAuth": "D03B6921DEF17F4181F305541A3B5EFD",
          "jumpUrl": "https://m.ctrip.com/webapp/you/user?clientAuth=D03B6921DEF17F4181F305541A3B5EFD",
          "coverImage": {
            "dynamicUrl": "https://dimg04.c-ctrip.com/images/Z80n1b000001boh6yA5A6_C_180_180.jpg",
            "originalUrl": "https://dimg04.c-ctrip.com/images/Z80n1b000001boh6yA5A6_C_180_180.jpg"
          },
          "followCount": 694
        },
        "images": [
          {
            "imageId": 338769792,
            "dynamicUrl": "https://youimg1.c-ctrip.com/target/1A0316000000z1oq327DB_R_800_10000_Q50.jpg?proc=source/tripshoot",
            "originalUrl": "https://youimg1.c-ctrip.com/target/1A0316000000z1oq327DB.jpg",
            "width": 1920,
            "height": 1280,
            "mediaType": 0,
            "lat": 26.578563,
            "lon": 106.7195,
            "isWaterMarked": true
          }
        ],
        "hasVideo": false,
        "readCount": 3343,
        "likeCount": 220,
        "commentCount": 43,
        "shareCount": 0,
        "urls": [
          {
            "version": "article",
            "appUrl": "ctrip://wireless/h5?page=index.html#detail/5740019.html&path=destination/article&navBarStyle=white",
            "h5Url": "https://m.ctrip.com/webapp/you/article/detail/5740019.html",
            "wxUrl": "/pages/article/detail?articleId=5740019"
          },
          {
            "version": "tripShoot",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NTc0MDAxOQ==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=5740019",
            "wxUrl": "/pages/detail/detail?articleId=5740019"
          },
          {
            "version": "tripShoot2",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NTc0MDAxOQ==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=5740019",
            "wxUrl": "/pages/you/lvpai/detail/detail?articleId=5740019"
          }
        ],
        "tags": [
          {
            "tagId": 101037,
            "tagName": "地质美景",
            "tagLevel": 2,
            "parentTagId": 101000,
            "source": 0,
            "sortIndex": 0
          }
        ],
        "topics": [
          {
            "topicId": 30,
            "topicName": "网红打卡地",
            "level": 1
          },
          {
            "topicId": 12779,
            "topicName": "世界遗产巡礼",
            "level": 2
          },
          {
            "topicId": 12774,
            "topicName": "大自然的奇观",
            "level": 2
          }
        ],
        "operationTopics": [
        ],
        "pois": [
          {
            "poiType": 3,
            "poiId": 10547798,
            "poiName": "佩特拉古城",
            "businessId": 141569,
            "districtId": 143896,
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=10547798&poiType=3&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=10547798&poiType=3&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 0,
            "isInChina": false,
            "countryName": "约旦"
          },
          {
            "poiType": 4,
            "poiId": 143896,
            "poiName": "佩特拉",
            "districtId": 143896,
            "districtName": "佩特拉",
            "districtENName": "Petra",
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=143896&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=143896&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 1,
            "isInChina": false
          }
        ],
        "publishTime": "2020-02-23 17:43:04",
        "publishTimeDisplay": "18天前",
        "shootTime": "2019-06-14 10:41:54",
        "shootTimeDisplay": "2019-06-14",
        "level": 2,
        "distanceText": "",
        "isLike": false,
        "imageCounts": 9,
        "isCollected": false,
        "collectCount": 6,
        "articleStatus": 2,
        "poiName": "佩特拉",
        "shareInfo": {
          "imageUrl": "https://youimg1.c-ctrip.com/target/1A0316000000z1oq327DB_C_454_358_Q90.jpg?proc=source/tripshoot",
          "shareTitle": "伍天意在佩特拉古城发了一篇超赞的旅拍，快来围观！",
          "shareContent": "佩特拉古城，又称玫瑰古城，特殊",
          "platForm": "all",
          "token": "16a8f875e00041cda5df403ca66c3127"
        },
        "currentDate": "2020.03.13",
        "sourceId": 0
      }
    },
    {
      "type": 1,
      "article": {
        "articleId": 4144780,
        "articleType": "reside",
        "strategyItemId": 176,
        "productType": 5,
        "sourceType": 126,
        "articleTitle": "浪漫的事～ 追随梁朝伟刘嘉玲去不丹结婚吧！",
        "author": {
          "authorId": 5123,
          "nickName": "Cookie大曲奇",
          "describe": "",
          "clientAuth": "079888EF4057929D4B29FE0748BD834B",
          "jumpUrl": "https://m.ctrip.com/webapp/you/user?clientAuth=079888EF4057929D4B29FE0748BD834B",
          "coverImage": {
            "dynamicUrl": "https://dimg04.c-ctrip.com/images/Z80710000000qlwclD879_C_180_180.jpg",
            "originalUrl": "https://dimg04.c-ctrip.com/images/Z80710000000qlwclD879_C_180_180.jpg"
          },
          "followCount": 4528
        },
        "images": [
          {
            "imageId": 300173261,
            "dynamicUrl": "https://youimg1.c-ctrip.com/target/100r0z000000mn3va4503_R_800_10000_Q50.jpg?proc=source/tripshoot",
            "originalUrl": "https://youimg1.c-ctrip.com/target/100r0z000000mn3va4503.jpg",
            "width": 680,
            "height": 454,
            "mediaType": 0,
            "lat": 0,
            "lon": 0,
            "isWaterMarked": false
          }
        ],
        "hasVideo": false,
        "readCount": 3851,
        "likeCount": 95,
        "commentCount": 11,
        "shareCount": 0,
        "urls": [
          {
            "version": "article",
            "appUrl": "ctrip://wireless/h5?page=index.html#detail/4144780.html&path=destination/article&navBarStyle=white",
            "h5Url": "https://m.ctrip.com/webapp/you/article/detail/4144780.html",
            "wxUrl": "/pages/article/detail?articleId=4144780"
          },
          {
            "version": "tripShoot",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NDE0NDc4MA==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=4144780",
            "wxUrl": "/pages/detail/detail?articleId=4144780"
          },
          {
            "version": "tripShoot2",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NDE0NDc4MA==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=4144780",
            "wxUrl": "/pages/you/lvpai/detail/detail?articleId=4144780"
          }
        ],
        "tags": [
          {
            "tagId": 109111,
            "tagName": "寺庙",
            "tagLevel": 2,
            "parentTagId": 109000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 102061,
            "tagName": "婚礼",
            "tagLevel": 2,
            "parentTagId": 102000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 102025,
            "tagName": "浪漫",
            "tagLevel": 2,
            "parentTagId": 102000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 301008,
            "tagName": "夫妻",
            "tagLevel": 2,
            "parentTagId": 301000,
            "source": 0,
            "sortIndex": 0
          }
        ],
        "topics": [
          {
            "topicId": 16,
            "topicName": "浪漫的事",
            "level": 1
          }
        ],
        "operationTopics": [
          {
            "topicId": 26713,
            "topicName": "打卡绝美婚礼地",
            "level": 1,
            "image": {
              "imageId": 469850565,
              "dynamicUrl": "https://youimg1.c-ctrip.com/target/100v1a000001990ow3F3C_R_640_10000_Q90.jpg",
              "originalUrl": "https://youimg1.c-ctrip.com/target/100v1a000001990ow3F3C.jpg",
              "width": 1125,
              "height": 750,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            }
          }
        ],
        "pois": [
          {
            "poiType": 3,
            "poiId": 13460691,
            "poiName": "祈楚寺",
            "businessId": 1413288,
            "districtId": 21433,
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=13460691&poiType=3&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=13460691&poiType=3&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 0,
            "isMain": 0,
            "isInChina": false,
            "countryName": "不丹"
          },
          {
            "poiType": 4,
            "poiId": 100239,
            "poiName": "不丹",
            "districtId": 100239,
            "districtName": "不丹",
            "districtENName": "Bhutan",
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=100239&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=100239&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 0,
            "isInChina": false
          }
        ],
        "publishTime": "2018-12-08 22:47:44",
        "publishTimeDisplay": "2018-12-08",
        "shootTime": "2018-12-08 22:47:44",
        "shootTimeDisplay": "2018-12-08",
        "level": 3,
        "distanceText": "",
        "isLike": false,
        "imageCounts": 9,
        "isCollected": false,
        "collectCount": 11,
        "articleStatus": 2,
        "poiName": "不丹",
        "shareInfo": {
          "imageUrl": "https://youimg1.c-ctrip.com/target/100r0z000000mn3va4503_C_454_358_Q90.jpg?proc=source/tripshoot",
          "shareTitle": "Cookie大曲奇在祈楚寺发了一篇超赞的旅拍，快来围观！",
          "shareContent": "提到不丹，首先想到的就是梁朝伟",
          "platForm": "all",
          "token": "e97e945235324e49a6f0c3026440087f"
        },
        "currentDate": "2020.03.13",
        "sourceId": 0
      }
    },
    {
      "type": 3,
      "advert": {
        "id": 18805,
        "moduleId": 776002,
        "appUrl": "https://contents.ctrip.com/activitysetupapp/mkt/index/travelrevival?popup=close&disable_webview_cache_key=1&pushcode=lpxxl ",
        "h5Url": "https://contents.ctrip.com/activitysetupapp/mkt/index/travelrevival?popup=close&disable_webview_cache_key=1&pushcode=lpxxl ",
        "wxUrl": "",
        "imageUrl": "https://dimg02.c-ctrip.com/images/10021e000001f3wtv4518.png",
        "width": 512,
        "height": 768
      }
    },
    {
      "type": 1,
      "article": {
        "articleId": 7689472,
        "articleType": "newArticle",
        "strategyItemId": 148,
        "productType": 5,
        "sourceType": 126,
        "articleTitle": "库塔伊西的这家餐厅，情调复古，味道可口 作为格鲁吉亚的第二大工业城市，库塔伊西市区有不少风格各异的餐",
        "author": {
          "authorId": 4696,
          "nickName": "haruxu",
          "describe": "",
          "clientAuth": "271C3A8E761D081913FB07A7C98E7D18",
          "jumpUrl": "https://m.ctrip.com/webapp/you/user?clientAuth=271C3A8E761D081913FB07A7C98E7D18",
          "coverImage": {
            "dynamicUrl": "https://dimg04.c-ctrip.com/images/headphoto/044/960/901/37197d1fce0a4601ba2468a1aa6c6f42_C_180_180.jpg",
            "originalUrl": "https://dimg04.c-ctrip.com/images/headphoto/044/960/901/37197d1fce0a4601ba2468a1aa6c6f42_C_180_180.jpg"
          },
          "qualification": "https://pages.c-ctrip.com/you/note/balloon_author.png",
          "identityType": 13,
          "identityTypeName": "签约旅行家",
          "userTags": [
            {
              "tagType": 1,
              "tagName": "亲子旅行达人",
              "tagDesc": "",
              "appUrl": "https://m.ctrip.com/webapp/you/tsnap/talentAreaIndex.html?isHideNavBar=yes&popup=close&activityid=199&allianceid=&sid=&ouid=",
              "h5Url": "https://m.ctrip.com/webapp/you/tsnap/talentAreaIndex.html?isHideNavBar=yes&popup=close&activityid=199&allianceid=&sid=&ouid=",
              "wxUrl": "https://m.ctrip.com/webapp/you/tsnap/talentAreaIndex.html?isHideNavBar=yes&popup=close&activityid=199&allianceid=&sid=&ouid="
            }
          ],
          "followCount": 8078,
          "remarkTag": {
            "tagId": 1,
            "tagName": "亲子旅行达人"
          }
        },
        "images": [
          {
            "imageId": 486976821,
            "dynamicUrl": "https://youimg1.c-ctrip.com/target/1A071e000001fkw1oC66C_R_800_10000_Q50.jpg?proc=source/tripshoot",
            "originalUrl": "https://youimg1.c-ctrip.com/target/1A071e000001fkw1oC66C.jpg",
            "width": 1442,
            "height": 1920,
            "mediaType": 0,
            "lat": 0,
            "lon": 0,
            "isWaterMarked": true
          }
        ],
        "hasVideo": false,
        "readCount": 1546,
        "likeCount": 104,
        "commentCount": 6,
        "shareCount": 0,
        "urls": [
          {
            "version": "article",
            "appUrl": "ctrip://wireless/h5?page=index.html#detail/7689472.html&path=destination/article&navBarStyle=white",
            "h5Url": "https://m.ctrip.com/webapp/you/article/detail/7689472.html",
            "wxUrl": "/pages/article/detail?articleId=7689472"
          },
          {
            "version": "tripShoot",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NzY4OTQ3Mg==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=7689472",
            "wxUrl": "/pages/detail/detail?articleId=7689472"
          },
          {
            "version": "tripShoot2",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NzY4OTQ3Mg==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=7689472",
            "wxUrl": "/pages/you/lvpai/detail/detail?articleId=7689472"
          }
        ],
        "tags": [
        ],
        "topics": [
          {
            "topicId": 1538,
            "topicName": "格鲁吉亚",
            "level": 2
          },
          {
            "topicId": 12823,
            "topicName": "当地才能吃到的美食",
            "level": 2,
            "image": {
              "imageId": 328736916,
              "dynamicUrl": "https://youimg1.c-ctrip.com/target/100l15000000xt1tu24C4_R_640_10000_Q90.jpg",
              "originalUrl": "https://youimg1.c-ctrip.com/target/100l15000000xt1tu24C4.jpg",
              "width": 640,
              "height": 426,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            }
          },
          {
            "topicId": 32311,
            "topicName": "宅家翻相册",
            "level": 1,
            "image": {
              "imageId": 485429071,
              "dynamicUrl": "https://youimg1.c-ctrip.com/target/100t0z000000mhkm2C860_R_640_10000_Q90.jpg",
              "originalUrl": "https://youimg1.c-ctrip.com/target/100t0z000000mhkm2C860.jpg",
              "width": 1280,
              "height": 854,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            },
            "iconImage": {
              "imageId": 485074271,
              "dynamicUrl": "https://youimg1.c-ctrip.com/target/100m0z000000nzaz305A6_R_640_10000_Q90.png",
              "originalUrl": "https://youimg1.c-ctrip.com/target/100m0z000000nzaz305A6.png",
              "width": 39,
              "height": 45,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            }
          },
          {
            "topicId": 12821,
            "topicName": "这个酒吧有点酷",
            "level": 2
          }
        ],
        "operationTopics": [
        ],
        "pois": [
          {
            "poiType": 2,
            "poiId": 35002867,
            "poiName": "Paolo",
            "businessId": 17483651,
            "districtId": 20814,
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=35002867&poiType=2&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=35002867&poiType=2&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 0,
            "isInChina": false,
            "countryName": "格鲁吉亚"
          },
          {
            "poiType": 4,
            "poiId": 20814,
            "poiName": "库塔伊西",
            "districtId": 20814,
            "districtName": "库塔伊西",
            "districtENName": "Kutaisi",
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=20814&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=20814&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 1,
            "isInChina": false
          }
        ],
        "publishTime": "2020-03-10 17:06:00",
        "publishTimeDisplay": "2天前",
        "shootTime": "2020-03-10 17:01:10",
        "shootTimeDisplay": "2020-03-10",
        "level": 3,
        "distanceText": "",
        "isLike": false,
        "imageCounts": 9,
        "isCollected": false,
        "collectCount": 5,
        "articleStatus": 2,
        "poiName": "库塔伊西",
        "shareInfo": {
          "imageUrl": "https://youimg1.c-ctrip.com/target/1A071e000001fkw1oC66C_C_454_358_Q90.jpg?proc=source/tripshoot",
          "shareTitle": "haruxu在Paolo发了一篇超赞的旅拍，快来围观！",
          "shareContent": "库塔伊西的这家餐厅，情调复古，",
          "platForm": "all",
          "token": "3e6fc6bc42f7475c84d3f7165337da4d"
        },
        "currentDate": "2020.03.13",
        "sourceId": 0
      }
    },
    {
      "type": 1,
      "article": {
        "articleId": 7687658,
        "articleType": "reside",
        "strategyItemId": 147,
        "productType": 5,
        "sourceType": 126,
        "articleTitle": "公主港靠近码头军管区的地方，刚走过一群荷枪实弹的士兵，就遇见了这样一个，有趣的沿街小花园。 靠着街边",
        "author": {
          "authorId": 124194,
          "nickName": "Homerotu",
          "describe": "",
          "clientAuth": "B1665A2078D7DED3773AF7A8B6F21A32",
          "jumpUrl": "https://m.ctrip.com/webapp/you/user?clientAuth=B1665A2078D7DED3773AF7A8B6F21A32",
          "coverImage": {
            "dynamicUrl": "https://dimg04.c-ctrip.com/images/Z80i0v000000jjy9b405A_C_180_180.jpg",
            "originalUrl": "https://dimg04.c-ctrip.com/images/Z80i0v000000jjy9b405A_C_180_180.jpg"
          },
          "identityType": 4,
          "identityTypeName": "旅行家",
          "followCount": 1322
        },
        "images": [
          {
            "imageId": 486955706,
            "dynamicUrl": "https://youimg1.c-ctrip.com/target/1A051e000001f6abh1F1B_R_800_10000_Q50.jpg?proc=source/tripshoot",
            "originalUrl": "https://youimg1.c-ctrip.com/target/1A051e000001f6abh1F1B.jpg",
            "width": 1080,
            "height": 1440,
            "mediaType": 0,
            "lat": 31.297704,
            "lon": 120.679105,
            "isWaterMarked": true
          }
        ],
        "hasVideo": false,
        "readCount": 935,
        "likeCount": 41,
        "commentCount": 6,
        "shareCount": 0,
        "urls": [
          {
            "version": "article",
            "appUrl": "ctrip://wireless/h5?page=index.html#detail/7687658.html&path=destination/article&navBarStyle=white",
            "h5Url": "https://m.ctrip.com/webapp/you/article/detail/7687658.html",
            "wxUrl": "/pages/article/detail?articleId=7687658"
          },
          {
            "version": "tripShoot",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NzY4NzY1OA==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=7687658",
            "wxUrl": "/pages/detail/detail?articleId=7687658"
          },
          {
            "version": "tripShoot2",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NzY4NzY1OA==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=7687658",
            "wxUrl": "/pages/you/lvpai/detail/detail?articleId=7687658"
          }
        ],
        "tags": [
        ],
        "topics": [
          {
            "topicId": 4166,
            "topicName": "那些小众又美好的地方",
            "level": 2
          },
          {
            "topicId": 21446,
            "topicName": "独家收藏的美丽",
            "level": 2
          },
          {
            "topicId": 12,
            "topicName": "旅行酷体验",
            "level": 1
          },
          {
            "topicId": 32696,
            "topicName": "大美菲律宾",
            "level": 2
          },
          {
            "topicId": 32311,
            "topicName": "宅家翻相册",
            "level": 1,
            "image": {
              "imageId": 485429071,
              "dynamicUrl": "https://youimg1.c-ctrip.com/target/100t0z000000mhkm2C860_R_640_10000_Q90.jpg",
              "originalUrl": "https://youimg1.c-ctrip.com/target/100t0z000000mhkm2C860.jpg",
              "width": 1280,
              "height": 854,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            },
            "iconImage": {
              "imageId": 485074271,
              "dynamicUrl": "https://youimg1.c-ctrip.com/target/100m0z000000nzaz305A6_R_640_10000_Q90.png",
              "originalUrl": "https://youimg1.c-ctrip.com/target/100m0z000000nzaz305A6.png",
              "width": 39,
              "height": 45,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            }
          }
        ],
        "operationTopics": [
        ],
        "pois": [
          {
            "poiType": 3,
            "poiId": 23987552,
            "poiName": "公主港滨海大道",
            "businessId": 1790732,
            "districtId": 14699,
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=23987552&poiType=3&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=23987552&poiType=3&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 0,
            "isInChina": false,
            "countryName": "菲律宾"
          },
          {
            "poiType": 4,
            "poiId": 14699,
            "poiName": "普林塞萨港",
            "districtId": 14699,
            "districtName": "普林塞萨港",
            "districtENName": "PuertoPrincesa",
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=14699&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=14699&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 1,
            "isInChina": false
          }
        ],
        "publishTime": "2020-03-10 08:55:15",
        "publishTimeDisplay": "3天前",
        "shootTime": "2020-03-10 08:52:34",
        "shootTimeDisplay": "2020-03-10",
        "level": 2,
        "distanceText": "",
        "isLike": false,
        "imageCounts": 9,
        "isCollected": false,
        "collectCount": 0,
        "articleStatus": 2,
        "poiName": "普林塞萨港",
        "shareInfo": {
          "imageUrl": "https://youimg1.c-ctrip.com/target/1A051e000001f6abh1F1B_C_454_358_Q90.jpg?proc=source/tripshoot",
          "shareTitle": "Homerotu在公主港滨海大道发了一篇超赞的旅拍，快来围观！",
          "shareContent": "公主港靠近码头军管区的地方，刚",
          "platForm": "all",
          "token": "f825651596804ce4bfe03e8907db51c7"
        },
        "currentDate": "2020.03.13",
        "sourceId": 0
      }
    },
    {
      "type": 1,
      "article": {
        "articleId": 7694473,
        "articleType": "newArticle",
        "strategyItemId": 148,
        "productType": 5,
        "sourceType": 126,
        "articleTitle": "《江南首驻~乙未同里古镇》*2015.7.15~20苏州行。 同里古镇，罗星洲，太湖之滨。退思园，御",
        "author": {
          "authorId": 306773,
          "nickName": "唯思遁逸",
          "clientAuth": "E20E1244CF779C8D7DDCD81DD787CCF6",
          "jumpUrl": "https://m.ctrip.com/webapp/you/user?clientAuth=E20E1244CF779C8D7DDCD81DD787CCF6",
          "coverImage": {
            "dynamicUrl": "https://dimg04.c-ctrip.com/images/fd/headphoto/g4/M00/A3/37/CggYHFa7LhOAYQqLAAAjetDKNH4582_C_180_180.jpg",
            "originalUrl": "https://dimg04.c-ctrip.com/images/fd/headphoto/g4/M00/A3/37/CggYHFa7LhOAYQqLAAAjetDKNH4582_C_180_180.jpg"
          },
          "followCount": 51
        },
        "images": [
          {
            "imageId": 487044159,
            "dynamicUrl": "https://youimg1.c-ctrip.com/target/1A0j1e000001f4q8w605D_R_800_10000_Q50.jpg?proc=source/tripshoot",
            "originalUrl": "https://youimg1.c-ctrip.com/target/1A0j1e000001f4q8w605D.jpg",
            "width": 1600,
            "height": 1200,
            "mediaType": 0,
            "lat": 0,
            "lon": 0,
            "isWaterMarked": false
          }
        ],
        "hasVideo": false,
        "readCount": 934,
        "likeCount": 34,
        "commentCount": 4,
        "shareCount": 0,
        "urls": [
          {
            "version": "article",
            "appUrl": "ctrip://wireless/h5?page=index.html#detail/7694473.html&path=destination/article&navBarStyle=white",
            "h5Url": "https://m.ctrip.com/webapp/you/article/detail/7694473.html",
            "wxUrl": "/pages/article/detail?articleId=7694473"
          },
          {
            "version": "tripShoot",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NzY5NDQ3Mw==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=7694473",
            "wxUrl": "/pages/detail/detail?articleId=7694473"
          },
          {
            "version": "tripShoot2",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NzY5NDQ3Mw==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=7694473",
            "wxUrl": "/pages/you/lvpai/detail/detail?articleId=7694473"
          }
        ],
        "tags": [
        ],
        "topics": [
        ],
        "operationTopics": [
        ],
        "pois": [
          {
            "poiType": 3,
            "poiId": 92227,
            "poiName": "同里古镇",
            "businessId": 115503,
            "districtId": 95,
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=92227&poiType=3&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=92227&poiType=3&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 0,
            "isInChina": true,
            "countryName": "中国"
          },
          {
            "poiType": 4,
            "poiId": 95,
            "poiName": "同里",
            "districtId": 95,
            "districtName": "同里",
            "districtENName": "Tongli",
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=95&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=95&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 1,
            "isInChina": true
          }
        ],
        "publishTime": "2020-03-11 23:05:55",
        "publishTimeDisplay": "1天前",
        "shootTime": "2020-03-11 17:19:36",
        "shootTimeDisplay": "2020-03-11",
        "level": 2,
        "distanceText": "",
        "isLike": false,
        "imageCounts": 20,
        "isCollected": false,
        "collectCount": 1,
        "articleStatus": 2,
        "poiName": "同里",
        "shareInfo": {
          "imageUrl": "https://youimg1.c-ctrip.com/target/1A0j1e000001f4q8w605D_C_454_358_Q90.jpg?proc=source/tripshoot",
          "shareTitle": "唯思遁逸在同里古镇发了一篇超赞的旅拍，快来围观！",
          "shareContent": "《江南首驻~乙未同里古镇》*2",
          "platForm": "all",
          "token": "1672e180f8a24360a0bee4d13363ea03"
        },
        "currentDate": "2020.03.13",
        "sourceId": 0
      }
    },
    {
      "type": 1,
      "article": {
        "articleId": 7694237,
        "articleType": "newArticle",
        "strategyItemId": 148,
        "productType": 5,
        "sourceType": 126,
        "articleTitle": "苏州·江苏   周庄   苏州博物馆    【景点攻略】（三天两夜的苏州行） 行前准备：去到温柔江南",
        "author": {
          "authorId": 540473,
          "nickName": "小徐嘞",
          "clientAuth": "38C548B4363D8C82F1DA03070E695DD2249A946E2DD2B860992FC5517824E287",
          "jumpUrl": "https://m.ctrip.com/webapp/you/user?clientAuth=38C548B4363D8C82F1DA03070E695DD2249A946E2DD2B860992FC5517824E287",
          "coverImage": {
            "dynamicUrl": "https://dimg04.c-ctrip.com/images/Z80n1d000001ejeu76F47_C_180_180.jpg",
            "originalUrl": "https://dimg04.c-ctrip.com/images/Z80n1d000001ejeu76F47_C_180_180.jpg"
          },
          "followCount": 46
        },
        "images": [
          {
            "imageId": 487037736,
            "dynamicUrl": "https://youimg1.c-ctrip.com/target/1A0p1e000001f4a3v3022_R_800_10000_Q50.jpg?proc=source/tripshoot",
            "originalUrl": "https://youimg1.c-ctrip.com/target/1A0p1e000001f4a3v3022.jpg",
            "width": 1920,
            "height": 1440,
            "mediaType": 0,
            "lat": 0,
            "lon": 0,
            "isWaterMarked": true
          }
        ],
        "hasVideo": false,
        "readCount": 1343,
        "likeCount": 21,
        "commentCount": 2,
        "shareCount": 0,
        "urls": [
          {
            "version": "article",
            "appUrl": "ctrip://wireless/h5?page=index.html#detail/7694237.html&path=destination/article&navBarStyle=white",
            "h5Url": "https://m.ctrip.com/webapp/you/article/detail/7694237.html",
            "wxUrl": "/pages/article/detail?articleId=7694237"
          },
          {
            "version": "tripShoot",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NzY5NDIzNw==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=7694237",
            "wxUrl": "/pages/detail/detail?articleId=7694237"
          },
          {
            "version": "tripShoot2",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NzY5NDIzNw==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=7694237",
            "wxUrl": "/pages/you/lvpai/detail/detail?articleId=7694237"
          }
        ],
        "tags": [
        ],
        "topics": [
          {
            "topicId": 32796,
            "topicName": "我是旅行家",
            "level": 1
          },
          {
            "topicId": 527,
            "topicName": "程里旅拍大赛",
            "level": 1
          },
          {
            "topicId": 32311,
            "topicName": "宅家翻相册",
            "level": 1,
            "image": {
              "imageId": 485429071,
              "dynamicUrl": "https://youimg1.c-ctrip.com/target/100t0z000000mhkm2C860_R_640_10000_Q90.jpg",
              "originalUrl": "https://youimg1.c-ctrip.com/target/100t0z000000mhkm2C860.jpg",
              "width": 1280,
              "height": 854,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            },
            "iconImage": {
              "imageId": 485074271,
              "dynamicUrl": "https://youimg1.c-ctrip.com/target/100m0z000000nzaz305A6_R_640_10000_Q90.png",
              "originalUrl": "https://youimg1.c-ctrip.com/target/100m0z000000nzaz305A6.png",
              "width": 39,
              "height": 45,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            }
          },
          {
            "topicId": 32702,
            "topicName": "去年三月你在哪儿",
            "level": 1,
            "image": {
              "imageId": 486268113,
              "dynamicUrl": "https://youimg1.c-ctrip.com/target/100w0q000000gra5p4BAE_R_640_10000_Q90.jpg",
              "originalUrl": "https://youimg1.c-ctrip.com/target/100w0q000000gra5p4BAE.jpg",
              "width": 1280,
              "height": 854,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            },
            "iconImage": {
              "imageId": 485074271,
              "dynamicUrl": "https://youimg1.c-ctrip.com/target/100m0z000000nzaz305A6_R_640_10000_Q90.png",
              "originalUrl": "https://youimg1.c-ctrip.com/target/100m0z000000nzaz305A6.png",
              "width": 39,
              "height": 45,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            }
          },
          {
            "topicId": 12764,
            "topicName": "苏州园林里的小腔调",
            "level": 2
          }
        ],
        "operationTopics": [
        ],
        "pois": [
          {
            "poiType": 4,
            "poiId": 11,
            "poiName": "苏州",
            "districtId": 11,
            "districtName": "苏州",
            "districtENName": "Suzhou",
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=11&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=11&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 0,
            "isInChina": true
          }
        ],
        "publishTime": "2020-03-12 20:54:49",
        "publishTimeDisplay": "17小时前",
        "shootTime": "2019-03-28 00:00:00",
        "shootTimeDisplay": "2019-03-28",
        "level": 2,
        "distanceText": "",
        "isLike": false,
        "imageCounts": 8,
        "isCollected": false,
        "collectCount": 1,
        "articleStatus": 2,
        "poiName": "苏州",
        "shareInfo": {
          "imageUrl": "https://youimg1.c-ctrip.com/target/1A0p1e000001f4a3v3022_C_454_358_Q90.jpg?proc=source/tripshoot",
          "shareTitle": "小徐嘞在苏州发了一篇超赞的旅拍，快来围观！",
          "shareContent": "苏州·江苏周庄苏州博物馆【景点",
          "platForm": "all",
          "token": "0d1a70d55a574d90af281b5f8b001789"
        },
        "currentDate": "2020.03.13",
        "sourceId": 0
      }
    },
    {
      "type": 3,
      "advert": {
        "id": 18806,
        "moduleId": 776002,
        "appUrl": "https://m.ctrip.com/webapp/you/livestream/paipai/topic.html?Id=32702&isHideHeader=true&isHideNavBar=YES&navBarStyle=white&popup=close",
        "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/topic.html?Id=32702&isHideHeader=true&isHideNavBar=YES&navBarStyle=white&popup=close",
        "wxUrl": "",
        "imageUrl": "https://dimg02.c-ctrip.com/images/100p1e000001evr496785.jpg",
        "width": 512,
        "height": 768
      }
    },
    {
      "type": 1,
      "article": {
        "articleId": 5745611,
        "articleType": "tag",
        "strategyItemId": 177,
        "productType": 5,
        "sourceType": 126,
        "articleTitle": "适合学生党的8个毕业旅行目的地推荐 又是一年毕业季，相处几年的老同学，一场毕业旅行能让这次分别变得更",
        "author": {
          "authorId": 5113,
          "nickName": "空气贝儿",
          "describe": "",
          "clientAuth": "5E2DDB5264F07AF575C13A0D0D35A85D",
          "jumpUrl": "https://m.ctrip.com/webapp/you/user?clientAuth=5E2DDB5264F07AF575C13A0D0D35A85D",
          "coverImage": {
            "dynamicUrl": "https://dimg04.c-ctrip.com/images/Z80s0m000000dq0bsE845_C_180_180.jpg",
            "originalUrl": "https://dimg04.c-ctrip.com/images/Z80s0m000000dq0bsE845_C_180_180.jpg"
          },
          "qualification": "https://pages.c-ctrip.com/you/note/balloon_author.png",
          "identityType": 13,
          "identityTypeName": "签约旅行家",
          "followCount": 10773
        },
        "images": [
          {
            "imageId": 328803044,
            "dynamicUrl": "https://youimg1.c-ctrip.com/target/1A0915000000xwjol4D34_R_800_10000_Q50.jpg?proc=source/tripshoot",
            "originalUrl": "https://youimg1.c-ctrip.com/target/1A0915000000xwjol4D34.jpg",
            "width": 1440,
            "height": 1920,
            "mediaType": 0,
            "lat": 0,
            "lon": 0,
            "isWaterMarked": true
          }
        ],
        "hasVideo": false,
        "readCount": 12066,
        "likeCount": 1351,
        "commentCount": 221,
        "shareCount": 0,
        "urls": [
          {
            "version": "article",
            "appUrl": "ctrip://wireless/h5?page=index.html#detail/5745611.html&path=destination/article&navBarStyle=white",
            "h5Url": "https://m.ctrip.com/webapp/you/article/detail/5745611.html",
            "wxUrl": "/pages/article/detail?articleId=5745611"
          },
          {
            "version": "tripShoot",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NTc0NTYxMQ==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=5745611",
            "wxUrl": "/pages/detail/detail?articleId=5745611"
          },
          {
            "version": "tripShoot2",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NTc0NTYxMQ==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=5745611",
            "wxUrl": "/pages/you/lvpai/detail/detail?articleId=5745611"
          }
        ],
        "tags": [
          {
            "tagId": 204003,
            "tagName": "夏",
            "tagLevel": 2,
            "parentTagId": 204000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 109128,
            "tagName": "教堂",
            "tagLevel": 2,
            "parentTagId": 109000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 109005,
            "tagName": "观景台",
            "tagLevel": 2,
            "parentTagId": 109000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 201006,
            "tagName": "七月",
            "tagLevel": 2,
            "parentTagId": 201000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 101051,
            "tagName": "日出",
            "tagLevel": 2,
            "parentTagId": 101000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 101053,
            "tagName": "草原",
            "tagLevel": 2,
            "parentTagId": 101000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 101024,
            "tagName": "雅丹地貌",
            "tagLevel": 2,
            "parentTagId": 101000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 109076,
            "tagName": "地铁站",
            "tagLevel": 2,
            "parentTagId": 109000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 205006,
            "tagName": "2-3天",
            "tagLevel": 2,
            "parentTagId": 205000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 301005,
            "tagName": "学生",
            "tagLevel": 2,
            "parentTagId": 301000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 101050,
            "tagName": "湖泊",
            "tagLevel": 2,
            "parentTagId": 101000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 101011,
            "tagName": "名山",
            "tagLevel": 2,
            "parentTagId": 101000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 102044,
            "tagName": "毕业游",
            "tagLevel": 2,
            "parentTagId": 102000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 112002,
            "tagName": "熊猫",
            "tagLevel": 2,
            "parentTagId": 112000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 101040,
            "tagName": "高空景观",
            "tagLevel": 2,
            "parentTagId": 101000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 102033,
            "tagName": "人气",
            "tagLevel": 2,
            "parentTagId": 102000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 301007,
            "tagName": "和朋友",
            "tagLevel": 2,
            "parentTagId": 301000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 109085,
            "tagName": "大学",
            "tagLevel": 2,
            "parentTagId": 109000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 112034,
            "tagName": "油菜花",
            "tagLevel": 2,
            "parentTagId": 112000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 102046,
            "tagName": "摄影",
            "tagLevel": 2,
            "parentTagId": 102000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 102048,
            "tagName": "文艺",
            "tagLevel": 2,
            "parentTagId": 102000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 102050,
            "tagName": "性价比高",
            "tagLevel": 2,
            "parentTagId": 102000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 109067,
            "tagName": "桥",
            "tagLevel": 2,
            "parentTagId": 109000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 108006,
            "tagName": "花海",
            "tagLevel": 2,
            "parentTagId": 108000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 102027,
            "tagName": "周边",
            "tagLevel": 2,
            "parentTagId": 102000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 101019,
            "tagName": "奇异地貌",
            "tagLevel": 2,
            "parentTagId": 101000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 203019,
            "tagName": "暑假",
            "tagLevel": 2,
            "parentTagId": 203000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 109105,
            "tagName": "学校",
            "tagLevel": 2,
            "parentTagId": 109000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 401002,
            "tagName": "多目的地攻略",
            "tagLevel": 2,
            "parentTagId": 401000,
            "source": 0,
            "sortIndex": 0
          }
        ],
        "topics": [
          {
            "topicId": 13340,
            "topicName": "暑假出门浪",
            "level": 1
          },
          {
            "topicId": 268,
            "topicName": "毕业旅行",
            "level": 2
          }
        ],
        "operationTopics": [
        ],
        "pois": [
          {
            "poiType": 4,
            "poiId": 31,
            "poiName": "大理",
            "districtId": 31,
            "districtName": "大理",
            "districtENName": "Dali",
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=31&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=31&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 0,
            "isInChina": true
          }
        ],
        "publishTime": "2019-06-15 14:39:06",
        "publishTimeDisplay": "2019-06-15",
        "shootTime": "2019-06-15 14:25:11",
        "shootTimeDisplay": "2019-06-15",
        "level": 2,
        "distanceText": "",
        "isLike": false,
        "imageCounts": 9,
        "isCollected": false,
        "collectCount": 49,
        "articleStatus": 2,
        "poiName": "大理",
        "shareInfo": {
          "imageUrl": "https://youimg1.c-ctrip.com/target/1A0915000000xwjol4D34_C_454_358_Q90.jpg?proc=source/tripshoot",
          "shareTitle": "空气贝儿在大理发了一篇超赞的旅拍，快来围观！",
          "shareContent": "适合学生党的8个毕业旅行目的地",
          "platForm": "all",
          "token": "819408995ee6403680c70d5db2005072"
        },
        "currentDate": "2020.03.13",
        "sourceId": 0
      }
    },
    {
      "type": 1,
      "article": {
        "articleId": 6001857,
        "articleType": "reside",
        "strategyItemId": 176,
        "productType": 5,
        "sourceType": 126,
        "articleTitle": "三沙社区跟居民住所",
        "author": {
          "authorId": 6137,
          "nickName": "李武鸿",
          "clientAuth": "77AF7EE8C70B42DD84D4ECF3250B531C",
          "jumpUrl": "https://m.ctrip.com/webapp/you/user?clientAuth=77AF7EE8C70B42DD84D4ECF3250B531C",
          "coverImage": {
            "dynamicUrl": "https://dimg04.c-ctrip.com/images/Z80s050000000ey6yAD83_C_180_180.jpg",
            "originalUrl": "https://dimg04.c-ctrip.com/images/Z80s050000000ey6yAD83_C_180_180.jpg"
          },
          "followCount": 149
        },
        "images": [
          {
            "imageId": 373813589,
            "dynamicUrl": "https://youimg1.c-ctrip.com/target/1A0k160000010hpwk22DF_R_800_10000_Q50.jpg?proc=source/tripshoot",
            "originalUrl": "https://youimg1.c-ctrip.com/target/1A0k160000010hpwk22DF.jpg",
            "width": 1920,
            "height": 1496,
            "mediaType": 0,
            "lat": 0,
            "lon": 0,
            "isWaterMarked": true
          }
        ],
        "hasVideo": false,
        "readCount": 5499,
        "likeCount": 74,
        "commentCount": 17,
        "shareCount": 0,
        "urls": [
          {
            "version": "article",
            "appUrl": "ctrip://wireless/h5?page=index.html#detail/6001857.html&path=destination/article&navBarStyle=white",
            "h5Url": "https://m.ctrip.com/webapp/you/article/detail/6001857.html",
            "wxUrl": "/pages/article/detail?articleId=6001857"
          },
          {
            "version": "tripShoot",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NjAwMTg1Nw==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=6001857",
            "wxUrl": "/pages/detail/detail?articleId=6001857"
          },
          {
            "version": "tripShoot2",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NjAwMTg1Nw==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=6001857",
            "wxUrl": "/pages/you/lvpai/detail/detail?articleId=6001857"
          }
        ],
        "tags": [
        ],
        "topics": [
        ],
        "operationTopics": [
        ],
        "pois": [
          {
            "poiType": 3,
            "poiId": 80222,
            "poiName": "永兴岛",
            "businessId": 18240,
            "districtId": 530,
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=80222&poiType=3&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=80222&poiType=3&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 0,
            "isInChina": true,
            "countryName": "中国"
          },
          {
            "poiType": 4,
            "poiId": 530,
            "poiName": "西沙群岛",
            "districtId": 530,
            "districtName": "西沙群岛",
            "districtENName": "XishaIslands",
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=530&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=530&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 1,
            "isInChina": true
          }
        ],
        "publishTime": "2019-07-24 09:43:26",
        "publishTimeDisplay": "2019-07-24",
        "shootTime": "2019-07-24 09:04:30",
        "shootTimeDisplay": "2019-07-24",
        "level": 2,
        "distanceText": "",
        "isLike": false,
        "imageCounts": 9,
        "isCollected": false,
        "collectCount": 2,
        "articleStatus": 2,
        "poiName": "西沙群岛",
        "shareInfo": {
          "imageUrl": "https://youimg1.c-ctrip.com/target/1A0k160000010hpwk22DF_C_454_358_Q90.jpg?proc=source/tripshoot",
          "shareTitle": "李武鸿在永兴岛发了一篇超赞的旅拍，快来围观！",
          "shareContent": "三沙社区跟居民住所",
          "platForm": "all",
          "token": "fa73adbe3a87495fa85962f53a79b913"
        },
        "currentDate": "2020.03.13",
        "sourceId": 0
      }
    },
    {
      "type": 1,
      "article": {
        "articleId": 7693374,
        "articleType": "newArticle",
        "strategyItemId": 148,
        "productType": 5,
        "sourceType": 126,
        "articleTitle": "关西:奈良“与鹿同行”指南  在去关西旅游前，我计划了去看看奈良的小鹿。以前“人与动物是好朋友”这句",
        "author": {
          "authorId": 29225,
          "nickName": "馬卡龍小姐",
          "describe": "",
          "clientAuth": "48243AE45D66FE56C61B9246EB1561D4",
          "jumpUrl": "https://m.ctrip.com/webapp/you/user?clientAuth=48243AE45D66FE56C61B9246EB1561D4",
          "coverImage": {
            "dynamicUrl": "https://dimg04.c-ctrip.com/images/Z80c0p000000fyygbF710_C_180_180.jpg",
            "originalUrl": "https://dimg04.c-ctrip.com/images/Z80c0p000000fyygbF710_C_180_180.jpg"
          },
          "identityType": 4,
          "identityTypeName": "旅行家",
          "followCount": 1582
        },
        "images": [
          {
            "imageId": 487026433,
            "dynamicUrl": "https://youimg1.c-ctrip.com/target/1A08hk11527pm584g65D5_R_800_10000_Q50.jpg?proc=source/tripshoot",
            "originalUrl": "https://youimg1.c-ctrip.com/target/1A08hk11527pm584g65D5.jpg",
            "width": 1280,
            "height": 1920,
            "mediaType": 0,
            "lat": 22.18782,
            "lon": 113.548658,
            "isWaterMarked": false
          }
        ],
        "hasVideo": false,
        "readCount": 1015,
        "likeCount": 56,
        "commentCount": 7,
        "shareCount": 0,
        "urls": [
          {
            "version": "article",
            "appUrl": "ctrip://wireless/h5?page=index.html#detail/7693374.html&path=destination/article&navBarStyle=white",
            "h5Url": "https://m.ctrip.com/webapp/you/article/detail/7693374.html",
            "wxUrl": "/pages/article/detail?articleId=7693374"
          },
          {
            "version": "tripShoot",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NzY5MzM3NA==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=7693374",
            "wxUrl": "/pages/detail/detail?articleId=7693374"
          },
          {
            "version": "tripShoot2",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NzY5MzM3NA==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=7693374",
            "wxUrl": "/pages/you/lvpai/detail/detail?articleId=7693374"
          }
        ],
        "tags": [
        ],
        "topics": [
          {
            "topicId": 12774,
            "topicName": "大自然的奇观",
            "level": 2
          },
          {
            "topicId": 31722,
            "topicName": "疫情结束后最想去哪儿",
            "level": 1,
            "image": {
              "imageId": 484647830,
              "dynamicUrl": "https://youimg1.c-ctrip.com/target/100t1d000001e9p3b8763_R_640_10000_Q90.jpg",
              "originalUrl": "https://youimg1.c-ctrip.com/target/100t1d000001e9p3b8763.jpg",
              "width": 1920,
              "height": 1280,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            }
          },
          {
            "topicId": 32311,
            "topicName": "宅家翻相册",
            "level": 1,
            "image": {
              "imageId": 485429071,
              "dynamicUrl": "https://youimg1.c-ctrip.com/target/100t0z000000mhkm2C860_R_640_10000_Q90.jpg",
              "originalUrl": "https://youimg1.c-ctrip.com/target/100t0z000000mhkm2C860.jpg",
              "width": 1280,
              "height": 854,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            },
            "iconImage": {
              "imageId": 485074271,
              "dynamicUrl": "https://youimg1.c-ctrip.com/target/100m0z000000nzaz305A6_R_640_10000_Q90.png",
              "originalUrl": "https://youimg1.c-ctrip.com/target/100m0z000000nzaz305A6.png",
              "width": 39,
              "height": 45,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            }
          }
        ],
        "operationTopics": [
        ],
        "pois": [
          {
            "poiType": 4,
            "poiId": 1045,
            "poiName": "奈良",
            "districtId": 1045,
            "districtName": "奈良",
            "districtENName": "Nara",
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=1045&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=1045&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 0,
            "isInChina": false
          }
        ],
        "publishTime": "2020-03-11 14:02:32",
        "publishTimeDisplay": "2天前",
        "shootTime": "2020-03-11 12:45:41",
        "shootTimeDisplay": "2020-03-11",
        "level": 3,
        "distanceText": "",
        "isLike": false,
        "imageCounts": 9,
        "isCollected": false,
        "collectCount": 1,
        "articleStatus": 2,
        "poiName": "奈良",
        "shareInfo": {
          "imageUrl": "https://youimg1.c-ctrip.com/target/1A08hk11527pm584g65D5_C_454_358_Q90.jpg?proc=source/tripshoot",
          "shareTitle": "馬卡龍小姐在奈良发了一篇超赞的旅拍，快来围观！",
          "shareContent": "关西:奈良“与鹿同行”指南在去",
          "platForm": "all",
          "token": "55a261942c124099986886863a61a52f"
        },
        "currentDate": "2020.03.13",
        "sourceId": 0
      }
    },
    {
      "type": 1,
      "article": {
        "articleId": 6162400,
        "articleType": "reside",
        "strategyItemId": 176,
        "productType": 5,
        "sourceType": 126,
        "articleTitle": "带着娃娃夜游肇兴。侗寨的夜景漂亮，当夜幕降临，塔楼周围环绕的灯被点亮。 侗寨里古朴具有民族色彩的建筑",
        "author": {
          "authorId": 677427,
          "nickName": "空气中的烟火",
          "clientAuth": "1FBC7907F8BDD0268AC677D588D28881",
          "jumpUrl": "https://m.ctrip.com/webapp/you/user?clientAuth=1FBC7907F8BDD0268AC677D588D28881",
          "coverImage": {
            "dynamicUrl": "https://dimg04.c-ctrip.com/images/Z80r090000003mi5a2B3D_C_180_180.jpg",
            "originalUrl": "https://dimg04.c-ctrip.com/images/Z80r090000003mi5a2B3D_C_180_180.jpg"
          },
          "followCount": 25
        },
        "images": [
          {
            "imageId": 380594283,
            "dynamicUrl": "https://youimg1.c-ctrip.com/target/1A0v170000011rbt02F85_R_800_10000_Q50.jpg?proc=source/tripshoot",
            "originalUrl": "https://youimg1.c-ctrip.com/target/1A0v170000011rbt02F85.jpg",
            "width": 1368,
            "height": 1824,
            "mediaType": 0,
            "lat": 39.966738,
            "lon": 116.326277,
            "isWaterMarked": true
          }
        ],
        "hasVideo": false,
        "readCount": 1104,
        "likeCount": 33,
        "commentCount": 12,
        "shareCount": 0,
        "urls": [
          {
            "version": "article",
            "appUrl": "ctrip://wireless/h5?page=index.html#detail/6162400.html&path=destination/article&navBarStyle=white",
            "h5Url": "https://m.ctrip.com/webapp/you/article/detail/6162400.html",
            "wxUrl": "/pages/article/detail?articleId=6162400"
          },
          {
            "version": "tripShoot",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NjE2MjQwMA==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=6162400",
            "wxUrl": "/pages/detail/detail?articleId=6162400"
          },
          {
            "version": "tripShoot2",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NjE2MjQwMA==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=6162400",
            "wxUrl": "/pages/you/lvpai/detail/detail?articleId=6162400"
          }
        ],
        "tags": [
          {
            "tagId": 101046,
            "tagName": "夜景",
            "tagLevel": 2,
            "parentTagId": 101000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 109005,
            "tagName": "观景台",
            "tagLevel": 2,
            "parentTagId": 109000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 101040,
            "tagName": "高空景观",
            "tagLevel": 2,
            "parentTagId": 101000,
            "source": 0,
            "sortIndex": 0
          }
        ],
        "topics": [
        ],
        "operationTopics": [
        ],
        "pois": [
          {
            "poiType": 3,
            "poiId": 86372,
            "poiName": "肇兴侗寨",
            "businessId": 60722,
            "districtId": 1346,
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=86372&poiType=3&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=86372&poiType=3&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 0,
            "isInChina": true,
            "countryName": "中国"
          },
          {
            "poiType": 4,
            "poiId": 1346,
            "poiName": "黎平",
            "districtId": 1346,
            "districtName": "黎平",
            "districtENName": "Liping",
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=1346&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=1346&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 1,
            "isInChina": true
          }
        ],
        "publishTime": "2019-08-15 21:05:39",
        "publishTimeDisplay": "2019-08-15",
        "shootTime": "2019-07-28 00:00:00",
        "shootTimeDisplay": "2019-07-28",
        "level": 2,
        "distanceText": "",
        "isLike": false,
        "imageCounts": 9,
        "isCollected": false,
        "collectCount": 0,
        "articleStatus": 2,
        "poiName": "黎平",
        "shareInfo": {
          "imageUrl": "https://youimg1.c-ctrip.com/target/1A0v170000011rbt02F85_C_454_358_Q90.jpg?proc=source/tripshoot",
          "shareTitle": "空气中的烟火在肇兴侗寨发了一篇超赞的旅拍，快来围观！",
          "shareContent": "带着娃娃夜游肇兴。侗寨的夜景漂",
          "platForm": "all",
          "token": "b75ea338ccf34ce7b50c0479288ade27"
        },
        "currentDate": "2020.03.13",
        "sourceId": 0
      }
    },
    {
      "type": 3,
      "advert": {
        "id": 18820,
        "moduleId": 776002,
        "appUrl": "https://m.ctrip.com/webapp/you/livestream/paipai/topic.html?Id=32922&isHideHeader=true&isHideNavBar=YES&navBarStyle=white&popup=close",
        "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/topic.html?Id=32922&isHideHeader=true&isHideNavBar=YES&navBarStyle=white&popup=close",
        "wxUrl": "",
        "imageUrl": "https://dimg02.c-ctrip.com/images/100e1e000001f85js0D37.jpg",
        "width": 512,
        "height": 768
      }
    },
    {
      "type": 1,
      "article": {
        "articleId": 4697157,
        "articleType": "tag",
        "strategyItemId": 177,
        "productType": 5,
        "sourceType": 126,
        "articleTitle": "江浙沪旅行|江浙沪油菜花拍照推荐 又到一年春暖花开时，在江浙沪，有着无数大大小小的油菜花田~金灿灿的",
        "author": {
          "authorId": 5098,
          "nickName": "沈小娴96",
          "describe": "",
          "clientAuth": "003C106C61015968E20CEE4C64AE39AA21E8636F0CA03D1E827E9B62CA7BD764",
          "jumpUrl": "https://m.ctrip.com/webapp/you/user?clientAuth=003C106C61015968E20CEE4C64AE39AA21E8636F0CA03D1E827E9B62CA7BD764",
          "coverImage": {
            "dynamicUrl": "https://dimg04.c-ctrip.com/images/Z8060z000000nithk2546_C_180_180.jpg",
            "originalUrl": "https://dimg04.c-ctrip.com/images/Z8060z000000nithk2546_C_180_180.jpg"
          },
          "identityType": 13,
          "identityTypeName": "签约旅行家",
          "followCount": 16357
        },
        "images": [
          {
            "imageId": 309073062,
            "dynamicUrl": "https://youimg1.c-ctrip.com/target/1A0112000000sasilE883_R_800_10000_Q50.jpg?proc=source/tripshoot",
            "originalUrl": "https://youimg1.c-ctrip.com/target/1A0112000000sasilE883.jpg",
            "width": 852,
            "height": 1137,
            "mediaType": 0,
            "lat": 0,
            "lon": 0,
            "isWaterMarked": false
          }
        ],
        "hasVideo": false,
        "readCount": 16645,
        "likeCount": 1195,
        "commentCount": 220,
        "shareCount": 0,
        "urls": [
          {
            "version": "article",
            "appUrl": "ctrip://wireless/h5?page=index.html#detail/4697157.html&path=destination/article&navBarStyle=white",
            "h5Url": "https://m.ctrip.com/webapp/you/article/detail/4697157.html",
            "wxUrl": "/pages/article/detail?articleId=4697157"
          },
          {
            "version": "tripShoot",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NDY5NzE1Nw==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=4697157",
            "wxUrl": "/pages/detail/detail?articleId=4697157"
          },
          {
            "version": "tripShoot2",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NDY5NzE1Nw==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=4697157",
            "wxUrl": "/pages/you/lvpai/detail/detail?articleId=4697157"
          }
        ],
        "tags": [
          {
            "tagId": 109121,
            "tagName": "水乡",
            "tagLevel": 2,
            "parentTagId": 109000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 112034,
            "tagName": "油菜花",
            "tagLevel": 2,
            "parentTagId": 112000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 204004,
            "tagName": "春",
            "tagLevel": 2,
            "parentTagId": 204000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 101050,
            "tagName": "湖泊",
            "tagLevel": 2,
            "parentTagId": 101000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 203023,
            "tagName": "清明节",
            "tagLevel": 2,
            "parentTagId": 203000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 108006,
            "tagName": "花海",
            "tagLevel": 2,
            "parentTagId": 108000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 101040,
            "tagName": "高空景观",
            "tagLevel": 2,
            "parentTagId": 101000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 201010,
            "tagName": "三月",
            "tagLevel": 2,
            "parentTagId": 201000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 102046,
            "tagName": "摄影",
            "tagLevel": 2,
            "parentTagId": 102000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 108012,
            "tagName": "桃花",
            "tagLevel": 2,
            "parentTagId": 108000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 101031,
            "tagName": "天然氧吧",
            "tagLevel": 2,
            "parentTagId": 101000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 301007,
            "tagName": "和朋友",
            "tagLevel": 2,
            "parentTagId": 301000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 401002,
            "tagName": "多目的地攻略",
            "tagLevel": 2,
            "parentTagId": 401000,
            "source": 0,
            "sortIndex": 0
          }
        ],
        "topics": [
          {
            "topicId": 3097,
            "topicName": "景点拍照指南",
            "level": 1
          },
          {
            "topicId": 3100,
            "topicName": "春天去哪玩",
            "level": 1
          },
          {
            "topicId": 4934,
            "topicName": "花海打卡挑战",
            "level": 1,
            "iconImage": {
              "imageId": 308604586,
              "dynamicUrl": "https://youimg1.c-ctrip.com/target/100b0y000000m6mqa07F4_R_640_10000_Q90.png",
              "originalUrl": "https://youimg1.c-ctrip.com/target/100b0y000000m6mqa07F4.png",
              "width": 48,
              "height": 48,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            }
          }
        ],
        "operationTopics": [
        ],
        "pois": [
          {
            "poiType": 4,
            "poiId": 508,
            "poiName": "乌镇",
            "districtId": 508,
            "districtName": "乌镇",
            "districtENName": "Wuzhen",
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=508&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=508&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 0,
            "isInChina": true
          }
        ],
        "publishTime": "2019-03-12 23:21:15",
        "publishTimeDisplay": "2019-03-12",
        "shootTime": "2019-03-12 11:08:13",
        "shootTimeDisplay": "2019-03-12",
        "level": 3,
        "distanceText": "",
        "isLike": false,
        "imageCounts": 9,
        "isCollected": false,
        "collectCount": 45,
        "articleStatus": 2,
        "poiName": "乌镇",
        "shareInfo": {
          "imageUrl": "https://youimg1.c-ctrip.com/target/1A0112000000sasilE883_C_454_358_Q90.jpg?proc=source/tripshoot",
          "shareTitle": "沈小娴96在乌镇发了一篇超赞的旅拍，快来围观！",
          "shareContent": "江浙沪旅行|江浙沪油菜花拍照推",
          "platForm": "all",
          "token": "fed3a83a84db4289a23c78816145e399"
        },
        "currentDate": "2020.03.13",
        "sourceId": 0
      }
    },
    {
      "type": 1,
      "article": {
        "articleId": 5764909,
        "articleType": "tag",
        "strategyItemId": 146,
        "productType": 5,
        "sourceType": 126,
        "articleTitle": "上海自驾2h,有温泉私汤的中式园林酒店 达蓬山大酒店的温泉南墅，每个院落按数字划分，院落里都有客房若",
        "author": {
          "authorId": 4694,
          "nickName": "Shirley雪梨酱",
          "describe": "",
          "clientAuth": "33685E8CF6E654EE563BC28C616D5F31",
          "jumpUrl": "https://m.ctrip.com/webapp/you/user?clientAuth=33685E8CF6E654EE563BC28C616D5F31",
          "coverImage": {
            "dynamicUrl": "https://dimg04.c-ctrip.com/images/Z80t15000000xztddE052_C_180_180.jpg",
            "originalUrl": "https://dimg04.c-ctrip.com/images/Z80t15000000xztddE052_C_180_180.jpg"
          },
          "qualification": "https://pages.c-ctrip.com/you/note/balloon_author.png",
          "identityType": 13,
          "identityTypeName": "签约旅行家",
          "userTags": [
            {
              "tagType": 1,
              "tagName": "亲子旅行达人",
              "tagDesc": "",
              "appUrl": "https://m.ctrip.com/webapp/you/tsnap/talentAreaIndex.html?isHideNavBar=yes&popup=close&activityid=199&allianceid=&sid=&ouid=",
              "h5Url": "https://m.ctrip.com/webapp/you/tsnap/talentAreaIndex.html?isHideNavBar=yes&popup=close&activityid=199&allianceid=&sid=&ouid=",
              "wxUrl": "https://m.ctrip.com/webapp/you/tsnap/talentAreaIndex.html?isHideNavBar=yes&popup=close&activityid=199&allianceid=&sid=&ouid="
            },
            {
              "tagType": 2,
              "tagName": "日本资深玩家",
              "tagDesc": "",
              "appUrl": "https://m.ctrip.com/webapp/you/tsnap/talentAreaIndex.html?isHideNavBar=yes&popup=close&activityid=199&allianceid=&sid=&ouid=",
              "h5Url": "https://m.ctrip.com/webapp/you/tsnap/talentAreaIndex.html?isHideNavBar=yes&popup=close&activityid=199&allianceid=&sid=&ouid=",
              "wxUrl": "https://m.ctrip.com/webapp/you/tsnap/talentAreaIndex.html?isHideNavBar=yes&popup=close&activityid=199&allianceid=&sid=&ouid="
            }
          ],
          "followCount": 20054,
          "remarkTag": {
            "tagId": 1,
            "tagName": "亲子旅行达人"
          }
        },
        "images": [
          {
            "imageId": 329047237,
            "dynamicUrl": "https://youimg1.c-ctrip.com/target/1A0w15000000y57u68E90_R_800_10000_Q50.jpg?proc=source/tripshoot",
            "originalUrl": "https://youimg1.c-ctrip.com/target/1A0w15000000y57u68E90.jpg",
            "width": 1280,
            "height": 1920,
            "mediaType": 0,
            "lat": 0,
            "lon": 0,
            "isWaterMarked": true
          }
        ],
        "hasVideo": false,
        "readCount": 14353,
        "likeCount": 508,
        "commentCount": 59,
        "shareCount": 0,
        "urls": [
          {
            "version": "article",
            "appUrl": "ctrip://wireless/h5?page=index.html#detail/5764909.html&path=destination/article&navBarStyle=white",
            "h5Url": "https://m.ctrip.com/webapp/you/article/detail/5764909.html",
            "wxUrl": "/pages/article/detail?articleId=5764909"
          },
          {
            "version": "tripShoot",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NTc2NDkwOQ==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=5764909",
            "wxUrl": "/pages/detail/detail?articleId=5764909"
          },
          {
            "version": "tripShoot2",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NTc2NDkwOQ==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=5764909",
            "wxUrl": "/pages/you/lvpai/detail/detail?articleId=5764909"
          }
        ],
        "tags": [
          {
            "tagId": 109098,
            "tagName": "古典园林",
            "tagLevel": 2,
            "parentTagId": 109000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 204003,
            "tagName": "夏",
            "tagLevel": 2,
            "parentTagId": 204000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 102008,
            "tagName": "高端奢华",
            "tagLevel": 2,
            "parentTagId": 102000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 101034,
            "tagName": "水景",
            "tagLevel": 2,
            "parentTagId": 101000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 301003,
            "tagName": "家庭",
            "tagLevel": 2,
            "parentTagId": 301000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 102056,
            "tagName": "休闲度假",
            "tagLevel": 2,
            "parentTagId": 102000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 401007,
            "tagName": "单POI攻略",
            "tagLevel": 2,
            "parentTagId": 401000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 102039,
            "tagName": "温泉",
            "tagLevel": 2,
            "parentTagId": 102000,
            "source": 0,
            "sortIndex": 0
          }
        ],
        "topics": [
          {
            "topicId": 12,
            "topicName": "旅行酷体验",
            "level": 1
          },
          {
            "topicId": 12789,
            "topicName": "睡过才会懂的高端酒店",
            "level": 2
          }
        ],
        "operationTopics": [
          {
            "topicId": 28849,
            "topicName": "宁波森林里泡温泉",
            "level": 1,
            "image": {
              "imageId": 476450490,
              "dynamicUrl": "https://youimg1.c-ctrip.com/target/100l1b000001ao8j5E8B3_R_640_10000_Q90.jpg",
              "originalUrl": "https://youimg1.c-ctrip.com/target/100l1b000001ao8j5E8B3.jpg",
              "width": 800,
              "height": 534,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            }
          }
        ],
        "pois": [
          {
            "poiType": 50,
            "poiId": 56281516,
            "poiName": "慈溪达蓬山大酒店·温泉南墅",
            "businessId": 21121786,
            "districtId": 543,
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=56281516&poiType=50&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=56281516&poiType=50&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 0,
            "isInChina": true,
            "countryName": "中国"
          },
          {
            "poiType": 4,
            "poiId": 543,
            "poiName": "慈溪",
            "districtId": 543,
            "districtName": "慈溪",
            "districtENName": "Cixi",
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=543&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=543&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 1,
            "isInChina": true
          }
        ],
        "publishTime": "2019-06-18 18:04:33",
        "publishTimeDisplay": "2019-06-18",
        "shootTime": "2019-06-18 12:01:01",
        "shootTimeDisplay": "2019-06-18",
        "level": 3,
        "distanceText": "",
        "isLike": false,
        "imageCounts": 9,
        "isCollected": false,
        "collectCount": 37,
        "articleStatus": 2,
        "poiName": "慈溪",
        "shareInfo": {
          "imageUrl": "https://youimg1.c-ctrip.com/target/1A0w15000000y57u68E90_C_454_358_Q90.jpg?proc=source/tripshoot",
          "shareTitle": "Shirley雪梨酱在慈溪达蓬山大酒店·温泉南墅发了一篇超赞的旅拍，快来围观！",
          "shareContent": "上海自驾2h,有温泉私汤的中式",
          "platForm": "all",
          "token": "98396834c2264ce790f60ab295854531"
        },
        "currentDate": "2020.03.13",
        "sourceId": 0
      }
    },
    {
      "type": 1,
      "article": {
        "articleId": 7686897,
        "articleType": "newArticle",
        "strategyItemId": 148,
        "productType": 5,
        "sourceType": 126,
        "articleTitle": "很多人想到釜山，第一时间会想到吃的，但实际上，釜山也有很多适合拍照拍人像的地方，这个地方出片率特别高",
        "author": {
          "authorId": 867564,
          "nickName": "大脸夫斯基",
          "clientAuth": "C37613705A2CFD7D8F1AAA454B90F6303E99B4600330CEB1BF51C4EAA70BC67A",
          "jumpUrl": "https://m.ctrip.com/webapp/you/user?clientAuth=C37613705A2CFD7D8F1AAA454B90F6303E99B4600330CEB1BF51C4EAA70BC67A",
          "coverImage": {
            "dynamicUrl": "https://dimg04.c-ctrip.com/images/t1/headphoto/882/320/089/158cae5ddb6143c0b6ae18523614cf08_C_180_180.jpg",
            "originalUrl": "https://dimg04.c-ctrip.com/images/t1/headphoto/882/320/089/158cae5ddb6143c0b6ae18523614cf08_C_180_180.jpg"
          },
          "followCount": 2
        },
        "images": [
          {
            "imageId": 486936588,
            "dynamicUrl": "https://youimg1.c-ctrip.com/target/1A0rhk124iaipz91t91BF_R_800_10000_Q50.jpg?proc=source/tripshoot",
            "originalUrl": "https://youimg1.c-ctrip.com/target/1A0rhk124iaipz91t91BF.jpg",
            "width": 1332,
            "height": 1777,
            "mediaType": 0,
            "lat": 0,
            "lon": 0,
            "isWaterMarked": true
          }
        ],
        "hasVideo": false,
        "readCount": 1120,
        "likeCount": 39,
        "commentCount": 1,
        "shareCount": 0,
        "urls": [
          {
            "version": "article",
            "appUrl": "ctrip://wireless/h5?page=index.html#detail/7686897.html&path=destination/article&navBarStyle=white",
            "h5Url": "https://m.ctrip.com/webapp/you/article/detail/7686897.html",
            "wxUrl": "/pages/article/detail?articleId=7686897"
          },
          {
            "version": "tripShoot",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NzY4Njg5Nw==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=7686897",
            "wxUrl": "/pages/detail/detail?articleId=7686897"
          },
          {
            "version": "tripShoot2",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NzY4Njg5Nw==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=7686897",
            "wxUrl": "/pages/you/lvpai/detail/detail?articleId=7686897"
          }
        ],
        "tags": [
        ],
        "topics": [
          {
            "topicId": 31722,
            "topicName": "疫情结束后最想去哪儿",
            "level": 1,
            "image": {
              "imageId": 484647830,
              "dynamicUrl": "https://youimg1.c-ctrip.com/target/100t1d000001e9p3b8763_R_640_10000_Q90.jpg",
              "originalUrl": "https://youimg1.c-ctrip.com/target/100t1d000001e9p3b8763.jpg",
              "width": 1920,
              "height": 1280,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            }
          },
          {
            "topicId": 32311,
            "topicName": "宅家翻相册",
            "level": 1,
            "image": {
              "imageId": 485429071,
              "dynamicUrl": "https://youimg1.c-ctrip.com/target/100t0z000000mhkm2C860_R_640_10000_Q90.jpg",
              "originalUrl": "https://youimg1.c-ctrip.com/target/100t0z000000mhkm2C860.jpg",
              "width": 1280,
              "height": 854,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            },
            "iconImage": {
              "imageId": 485074271,
              "dynamicUrl": "https://youimg1.c-ctrip.com/target/100m0z000000nzaz305A6_R_640_10000_Q90.png",
              "originalUrl": "https://youimg1.c-ctrip.com/target/100m0z000000nzaz305A6.png",
              "width": 39,
              "height": 45,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            }
          }
        ],
        "operationTopics": [
        ],
        "pois": [
          {
            "poiType": 3,
            "poiId": 18185987,
            "poiName": "甘川文化村",
            "businessId": 1510992,
            "districtId": 432,
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=18185987&poiType=3&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=18185987&poiType=3&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 0,
            "isInChina": false,
            "countryName": "韩国"
          },
          {
            "poiType": 4,
            "poiId": 432,
            "poiName": "釜山",
            "districtId": 432,
            "districtName": "釜山",
            "districtENName": "Busan",
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=432&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=432&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 1,
            "isInChina": false
          }
        ],
        "publishTime": "2020-03-11 18:26:17",
        "publishTimeDisplay": "1天前",
        "shootTime": "2019-12-09 13:01:01",
        "shootTimeDisplay": "2019-12-09",
        "level": 2,
        "distanceText": "",
        "isLike": false,
        "imageCounts": 8,
        "isCollected": false,
        "collectCount": 4,
        "articleStatus": 2,
        "poiName": "釜山",
        "shareInfo": {
          "imageUrl": "https://youimg1.c-ctrip.com/target/1A0rhk124iaipz91t91BF_C_454_358_Q90.jpg?proc=source/tripshoot",
          "shareTitle": "大脸夫斯基在甘川文化村发了一篇超赞的旅拍，快来围观！",
          "shareContent": "很多人想到釜山，第一时间会想到",
          "platForm": "all",
          "token": "56b41ea3a076471493ea7e24a7e90f6d"
        },
        "currentDate": "2020.03.13",
        "sourceId": 0
      }
    },
    {
      "type": 1,
      "article": {
        "articleId": 7360802,
        "articleType": "reside",
        "strategyItemId": 147,
        "productType": 5,
        "sourceType": 126,
        "articleTitle": "跨年旅行这次我来到了摩洛哥，走进撒哈拉沙漠，来一次不一样的跨年狂欢！第一站我们去的是马拉喀什。马拉喀",
        "author": {
          "authorId": 760479,
          "nickName": "行走的法师羊",
          "clientAuth": "5CA41CEDAD176DCF8CEAD64194341E8C",
          "jumpUrl": "https://m.ctrip.com/webapp/you/user?clientAuth=5CA41CEDAD176DCF8CEAD64194341E8C",
          "coverImage": {
            "dynamicUrl": "https://dimg04.c-ctrip.com/images/Z8061c000001cu57wCCF8_C_180_180.jpg",
            "originalUrl": "https://dimg04.c-ctrip.com/images/Z8061c000001cu57wCCF8_C_180_180.jpg"
          },
          "followCount": 21
        },
        "images": [
          {
            "imageId": 481871949,
            "dynamicUrl": "https://youimg1.c-ctrip.com/target/1A091c000001cog4f5D19_R_800_10000_Q50.jpg?proc=source/tripshoot",
            "originalUrl": "https://youimg1.c-ctrip.com/target/1A091c000001cog4f5D19.jpg",
            "width": 1500,
            "height": 1062,
            "mediaType": 0,
            "lat": 0,
            "lon": 0,
            "isWaterMarked": false
          }
        ],
        "hasVideo": false,
        "readCount": 1164,
        "likeCount": 51,
        "commentCount": 8,
        "shareCount": 0,
        "urls": [
          {
            "version": "article",
            "appUrl": "ctrip://wireless/h5?page=index.html#detail/7360802.html&path=destination/article&navBarStyle=white",
            "h5Url": "https://m.ctrip.com/webapp/you/article/detail/7360802.html",
            "wxUrl": "/pages/article/detail?articleId=7360802"
          },
          {
            "version": "tripShoot",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NzM2MDgwMg==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=7360802",
            "wxUrl": "/pages/detail/detail?articleId=7360802"
          },
          {
            "version": "tripShoot2",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NzM2MDgwMg==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=7360802",
            "wxUrl": "/pages/you/lvpai/detail/detail?articleId=7360802"
          }
        ],
        "tags": [
        ],
        "topics": [
          {
            "topicId": 30239,
            "topicName": "新年趣旅行",
            "level": 1,
            "image": {
              "imageId": 481171558,
              "dynamicUrl": "https://youimg1.c-ctrip.com/target/10031c000001c6xv0DAFF_R_640_10000_Q90.jpg",
              "originalUrl": "https://youimg1.c-ctrip.com/target/10031c000001c6xv0DAFF.jpg",
              "width": 1023,
              "height": 575,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            },
            "iconImage": {
              "imageId": 455195817,
              "dynamicUrl": "https://youimg1.c-ctrip.com/target/100m0z000000nzaz305A6_R_640_10000_Q90.png",
              "originalUrl": "https://youimg1.c-ctrip.com/target/100m0z000000nzaz305A6.png",
              "width": 39,
              "height": 45,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            }
          }
        ],
        "operationTopics": [
        ],
        "pois": [
          {
            "poiType": 3,
            "poiId": 24651572,
            "poiName": "马拉喀什老城",
            "businessId": 1832446,
            "districtId": 1748,
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=24651572&poiType=3&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=24651572&poiType=3&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 0,
            "isInChina": false,
            "countryName": "摩洛哥"
          },
          {
            "poiType": 4,
            "poiId": 1748,
            "poiName": "马拉喀什",
            "districtId": 1748,
            "districtName": "马拉喀什",
            "districtENName": "Marrakech",
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=1748&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=1748&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 1,
            "isInChina": false
          }
        ],
        "publishTime": "2020-01-07 20:21:38",
        "publishTimeDisplay": "01-07",
        "shootTime": "2019-12-29 17:47:06",
        "shootTimeDisplay": "2019-12-29",
        "level": 2,
        "distanceText": "",
        "isLike": false,
        "imageCounts": 9,
        "isCollected": false,
        "collectCount": 1,
        "articleStatus": 2,
        "poiName": "马拉喀什",
        "shareInfo": {
          "imageUrl": "https://youimg1.c-ctrip.com/target/1A091c000001cog4f5D19_C_454_358_Q90.jpg?proc=source/tripshoot",
          "shareTitle": "行走的法师羊在马拉喀什老城发了一篇超赞的旅拍，快来围观！",
          "shareContent": "跨年旅行这次我来到了摩洛哥，走",
          "platForm": "all",
          "token": "1c4d993fca594e778792884a42603a95"
        },
        "currentDate": "2020.03.13",
        "sourceId": 0
      }
    },
    {
      "type": 1,
      "article": {
        "articleId": 7693750,
        "articleType": "newArticle",
        "strategyItemId": 148,
        "productType": 5,
        "sourceType": 126,
        "articleTitle": "#the Hub of Country Music   纳什维尔市中心 年轻音乐爱好者的寻梦之地  ",
        "author": {
          "authorId": 866366,
          "nickName": "走向世界的 Hathaway",
          "clientAuth": "DFE5387800883A14E21CABC789BBF19C228E3B84BA45FC7BEE04555B6F64CF95",
          "jumpUrl": "https://m.ctrip.com/webapp/you/user?clientAuth=DFE5387800883A14E21CABC789BBF19C228E3B84BA45FC7BEE04555B6F64CF95",
          "coverImage": {
            "dynamicUrl": "https://dimg04.c-ctrip.com/images/Z80o1e000001exha5CFBA_C_180_180.jpg",
            "originalUrl": "https://dimg04.c-ctrip.com/images/Z80o1e000001exha5CFBA_C_180_180.jpg"
          },
          "followCount": 6
        },
        "images": [
          {
            "imageId": 487030864,
            "dynamicUrl": "https://youimg1.c-ctrip.com/target/1A0u1e000001f50zg504C_R_800_10000_Q50.jpg?proc=source/tripshoot",
            "originalUrl": "https://youimg1.c-ctrip.com/target/1A0u1e000001f50zg504C.jpg",
            "width": 1080,
            "height": 1324,
            "mediaType": 0,
            "lat": 0,
            "lon": 0,
            "isWaterMarked": true
          }
        ],
        "hasVideo": false,
        "readCount": 831,
        "likeCount": 49,
        "commentCount": 6,
        "shareCount": 0,
        "urls": [
          {
            "version": "article",
            "appUrl": "ctrip://wireless/h5?page=index.html#detail/7693750.html&path=destination/article&navBarStyle=white",
            "h5Url": "https://m.ctrip.com/webapp/you/article/detail/7693750.html",
            "wxUrl": "/pages/article/detail?articleId=7693750"
          },
          {
            "version": "tripShoot",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NzY5Mzc1MA==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=7693750",
            "wxUrl": "/pages/detail/detail?articleId=7693750"
          },
          {
            "version": "tripShoot2",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NzY5Mzc1MA==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=7693750",
            "wxUrl": "/pages/you/lvpai/detail/detail?articleId=7693750"
          }
        ],
        "tags": [
        ],
        "topics": [
        ],
        "operationTopics": [
        ],
        "pois": [
          {
            "poiType": 4,
            "poiId": 21650,
            "poiName": "田纳西州",
            "districtId": 21650,
            "districtName": "田纳西州",
            "districtENName": "Tennessee",
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=21650&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=21650&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 0,
            "isInChina": false
          }
        ],
        "publishTime": "2020-03-11 14:20:47",
        "publishTimeDisplay": "2天前",
        "shootTime": "2019-09-20 12:01:01",
        "shootTimeDisplay": "2019-09-20",
        "level": 2,
        "distanceText": "",
        "isLike": false,
        "imageCounts": 9,
        "isCollected": false,
        "collectCount": 2,
        "articleStatus": 2,
        "poiName": "田纳西州",
        "shareInfo": {
          "imageUrl": "https://youimg1.c-ctrip.com/target/1A0u1e000001f50zg504C_C_454_358_Q90.jpg?proc=source/tripshoot",
          "shareTitle": "走向世界的 Hathaway在田纳西州发了一篇超赞的旅拍，快来围观！",
          "shareContent": "#theHubofCountr",
          "platForm": "all",
          "token": "a13ce532b1c84dd4a59c7ffa134c2758"
        },
        "currentDate": "2020.03.13",
        "sourceId": 0
      }
    },
    {
      "type": 1,
      "article": {
        "articleId": 7688106,
        "articleType": "reside",
        "strategyItemId": 147,
        "productType": 5,
        "sourceType": 126,
        "articleTitle": "北极点｜最全线路介绍  前往北极点，最好的方式是乘坐五十年胜利号核动力破冰船。  目前来说，普通旅客",
        "author": {
          "authorId": 83951,
          "nickName": "行之悦甘萌",
          "describe": "",
          "clientAuth": "174747834B5CA161B801E29B71CD3F09",
          "jumpUrl": "https://m.ctrip.com/webapp/you/user?clientAuth=174747834B5CA161B801E29B71CD3F09",
          "coverImage": {
            "dynamicUrl": "https://dimg04.c-ctrip.com/images/Z80c1e000001f5e6tB758_C_180_180.jpg",
            "originalUrl": "https://dimg04.c-ctrip.com/images/Z80c1e000001f5e6tB758_C_180_180.jpg"
          },
          "identityType": 18,
          "identityTypeName": "主题游商家",
          "followCount": 200
        },
        "images": [
          {
            "imageId": 486961043,
            "dynamicUrl": "https://youimg1.c-ctrip.com/target/1A041e000001f2v82B302_R_800_10000_Q50.jpg?proc=source/tripshoot",
            "originalUrl": "https://youimg1.c-ctrip.com/target/1A041e000001f2v82B302.jpg",
            "width": 1420,
            "height": 1920,
            "mediaType": 0,
            "lat": 30.610949,
            "lon": 104.084884,
            "isWaterMarked": true
          }
        ],
        "hasVideo": false,
        "readCount": 863,
        "likeCount": 26,
        "commentCount": 3,
        "shareCount": 0,
        "urls": [
          {
            "version": "article",
            "appUrl": "ctrip://wireless/h5?page=index.html#detail/7688106.html&path=destination/article&navBarStyle=white",
            "h5Url": "https://m.ctrip.com/webapp/you/article/detail/7688106.html",
            "wxUrl": "/pages/article/detail?articleId=7688106"
          },
          {
            "version": "tripShoot",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NzY4ODEwNg==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=7688106",
            "wxUrl": "/pages/detail/detail?articleId=7688106"
          },
          {
            "version": "tripShoot2",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NzY4ODEwNg==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=7688106",
            "wxUrl": "/pages/you/lvpai/detail/detail?articleId=7688106"
          }
        ],
        "tags": [
        ],
        "topics": [
          {
            "topicId": 12808,
            "topicName": "最美航拍",
            "level": 2
          },
          {
            "topicId": 12830,
            "topicName": "一个人说走就走",
            "level": 2
          },
          {
            "topicId": 12803,
            "topicName": "你没见过的新奇玩法",
            "level": 2,
            "image": {
              "imageId": 328737939,
              "dynamicUrl": "https://youimg1.c-ctrip.com/target/100u15000000xsudxD001_R_640_10000_Q90.jpg",
              "originalUrl": "https://youimg1.c-ctrip.com/target/100u15000000xsudxD001.jpg",
              "width": 640,
              "height": 427,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            }
          },
          {
            "topicId": 12781,
            "topicName": "轻奢旅行",
            "level": 2
          },
          {
            "topicId": 12774,
            "topicName": "大自然的奇观",
            "level": 2
          }
        ],
        "operationTopics": [
        ],
        "pois": [
          {
            "poiType": 3,
            "poiId": 24845910,
            "poiName": "北极点",
            "businessId": 1837126,
            "districtId": 120486,
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=24845910&poiType=3&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=24845910&poiType=3&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 0,
            "isInChina": false,
            "countryName": ""
          },
          {
            "poiType": 4,
            "poiId": 120486,
            "poiName": "北极",
            "districtId": 120486,
            "districtName": "北极",
            "districtENName": "Arcticregions",
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=120486&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=120486&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 1,
            "isInChina": false
          }
        ],
        "publishTime": "2020-03-10 11:24:56",
        "publishTimeDisplay": "3天前",
        "shootTime": "2019-08-15 00:00:00",
        "shootTimeDisplay": "2019-08-15",
        "level": 2,
        "distanceText": "",
        "isLike": false,
        "imageCounts": 6,
        "isCollected": false,
        "collectCount": 2,
        "articleStatus": 2,
        "poiName": "北极",
        "shareInfo": {
          "imageUrl": "https://youimg1.c-ctrip.com/target/1A041e000001f2v82B302_C_454_358_Q90.jpg?proc=source/tripshoot",
          "shareTitle": "行之悦甘萌在北极点发了一篇超赞的旅拍，快来围观！",
          "shareContent": "北极点｜最全线路介绍前往北极点",
          "platForm": "all",
          "token": "4bd399bb74cd45e7afbe592c59a075fc"
        },
        "currentDate": "2020.03.13",
        "sourceId": 0
      }
    },
    {
      "type": 1,
      "article": {
        "articleId": 7688094,
        "articleType": "reside",
        "strategyItemId": 147,
        "productType": 5,
        "sourceType": 126,
        "articleTitle": "从里斯本一直延伸到大西洋边山脚下的辛特拉小镇，曾被诗人拜伦赞为“人间伊甸园”。几个世纪以来， 辛特拉",
        "author": {
          "authorId": 4763,
          "nickName": "西西里玩不停",
          "describe": "",
          "clientAuth": "3D75418A3569F2DBEEA9B9BAE75920C0",
          "jumpUrl": "https://m.ctrip.com/webapp/you/user?clientAuth=3D75418A3569F2DBEEA9B9BAE75920C0",
          "coverImage": {
            "dynamicUrl": "https://dimg04.c-ctrip.com/images/Z80k13000000vht35BB45_C_180_180.jpg",
            "originalUrl": "https://dimg04.c-ctrip.com/images/Z80k13000000vht35BB45_C_180_180.jpg"
          },
          "qualification": "https://pages.c-ctrip.com/you/note/balloon_author.png",
          "identityType": 13,
          "identityTypeName": "签约旅行家",
          "userTags": [
            {
              "tagType": 1,
              "tagName": "自驾旅行达人",
              "tagDesc": "",
              "appUrl": "https://m.ctrip.com/webapp/you/tsnap/talentAreaIndex.html?isHideNavBar=yes&popup=close&activityid=199&allianceid=&sid=&ouid=",
              "h5Url": "https://m.ctrip.com/webapp/you/tsnap/talentAreaIndex.html?isHideNavBar=yes&popup=close&activityid=199&allianceid=&sid=&ouid=",
              "wxUrl": "https://m.ctrip.com/webapp/you/tsnap/talentAreaIndex.html?isHideNavBar=yes&popup=close&activityid=199&allianceid=&sid=&ouid="
            },
            {
              "tagType": 2,
              "tagName": "澳大利亚资深玩家",
              "tagDesc": "",
              "appUrl": "https://m.ctrip.com/webapp/you/tsnap/talentAreaIndex.html?isHideNavBar=yes&popup=close&activityid=199&allianceid=&sid=&ouid=",
              "h5Url": "https://m.ctrip.com/webapp/you/tsnap/talentAreaIndex.html?isHideNavBar=yes&popup=close&activityid=199&allianceid=&sid=&ouid=",
              "wxUrl": "https://m.ctrip.com/webapp/you/tsnap/talentAreaIndex.html?isHideNavBar=yes&popup=close&activityid=199&allianceid=&sid=&ouid="
            }
          ],
          "followCount": 96797,
          "remarkTag": {
            "tagId": 1,
            "tagName": "自驾旅行达人"
          }
        },
        "images": [
          {
            "imageId": 486959401,
            "dynamicUrl": "https://youimg1.c-ctrip.com/target/1A0l1e000001f40keF6AF_R_800_10000_Q50.jpg?proc=source/tripshoot",
            "originalUrl": "https://youimg1.c-ctrip.com/target/1A0l1e000001f40keF6AF.jpg",
            "width": 1250,
            "height": 1667,
            "mediaType": 0,
            "lat": 0,
            "lon": 0,
            "isWaterMarked": true
          }
        ],
        "hasVideo": false,
        "readCount": 1863,
        "likeCount": 107,
        "commentCount": 11,
        "shareCount": 0,
        "urls": [
          {
            "version": "article",
            "appUrl": "ctrip://wireless/h5?page=index.html#detail/7688094.html&path=destination/article&navBarStyle=white",
            "h5Url": "https://m.ctrip.com/webapp/you/article/detail/7688094.html",
            "wxUrl": "/pages/article/detail?articleId=7688094"
          },
          {
            "version": "tripShoot",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NzY4ODA5NA==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=7688094",
            "wxUrl": "/pages/detail/detail?articleId=7688094"
          },
          {
            "version": "tripShoot2",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NzY4ODA5NA==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=7688094",
            "wxUrl": "/pages/you/lvpai/detail/detail?articleId=7688094"
          }
        ],
        "tags": [
        ],
        "topics": [
          {
            "topicId": 32702,
            "topicName": "去年三月你在哪儿",
            "level": 1,
            "image": {
              "imageId": 486268113,
              "dynamicUrl": "https://youimg1.c-ctrip.com/target/100w0q000000gra5p4BAE_R_640_10000_Q90.jpg",
              "originalUrl": "https://youimg1.c-ctrip.com/target/100w0q000000gra5p4BAE.jpg",
              "width": 1280,
              "height": 854,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            },
            "iconImage": {
              "imageId": 485074271,
              "dynamicUrl": "https://youimg1.c-ctrip.com/target/100m0z000000nzaz305A6_R_640_10000_Q90.png",
              "originalUrl": "https://youimg1.c-ctrip.com/target/100m0z000000nzaz305A6.png",
              "width": 39,
              "height": 45,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            }
          }
        ],
        "operationTopics": [
        ],
        "pois": [
          {
            "poiType": 3,
            "poiId": 18512370,
            "poiName": "佩纳宫",
            "businessId": 1675995,
            "districtId": 29349,
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=18512370&poiType=3&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=18512370&poiType=3&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 0,
            "isInChina": false,
            "countryName": "葡萄牙"
          },
          {
            "poiType": 4,
            "poiId": 29349,
            "poiName": "辛特拉",
            "districtId": 29349,
            "districtName": "辛特拉",
            "districtENName": "Sintra",
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=29349&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=29349&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 1,
            "isInChina": false
          }
        ],
        "publishTime": "2020-03-10 10:38:13",
        "publishTimeDisplay": "3天前",
        "shootTime": "2020-03-09 17:59:31",
        "shootTimeDisplay": "2020-03-09",
        "level": 3,
        "distanceText": "",
        "isLike": false,
        "imageCounts": 9,
        "isCollected": false,
        "collectCount": 4,
        "articleStatus": 2,
        "poiName": "辛特拉",
        "shareInfo": {
          "imageUrl": "https://youimg1.c-ctrip.com/target/1A0l1e000001f40keF6AF_C_454_358_Q90.jpg?proc=source/tripshoot",
          "shareTitle": "西西里玩不停在佩纳宫发了一篇超赞的旅拍，快来围观！",
          "shareContent": "从里斯本一直延伸到大西洋边山脚",
          "platForm": "all",
          "token": "dd14a51985a443deb8de24f74d9b5766"
        },
        "currentDate": "2020.03.13",
        "sourceId": 0
      }
    },
    {
      "type": 1,
      "article": {
        "articleId": 6404026,
        "articleType": "reside",
        "strategyItemId": 176,
        "productType": 5,
        "sourceType": 126,
        "articleTitle": "山海关孟姜女庙景区～ 凤凰山上贞女祠！ 南望大海北倚燕山～潮起潮落，云长云消，唯贞女情长千古不变！ ",
        "author": {
          "authorId": 695677,
          "nickName": "红山玉雕龙",
          "clientAuth": "D15B1873B53658757DC820C56B76B410",
          "jumpUrl": "https://m.ctrip.com/webapp/you/user?clientAuth=D15B1873B53658757DC820C56B76B410",
          "coverImage": {
            "dynamicUrl": "https://dimg04.c-ctrip.com/images/fd/headphoto/g2/M01/CA/5E/Cghzf1UQvUeADCzRAAA2F-qecdE582_C_180_180.jpg",
            "originalUrl": "https://dimg04.c-ctrip.com/images/fd/headphoto/g2/M01/CA/5E/Cghzf1UQvUeADCzRAAA2F-qecdE582_C_180_180.jpg"
          },
          "followCount": 106
        },
        "images": [
          {
            "imageId": 454061531,
            "dynamicUrl": "https://youimg1.c-ctrip.com/target/1A02180000014yrrmB47B_R_800_10000_Q50.jpg?proc=source/tripshoot",
            "originalUrl": "https://youimg1.c-ctrip.com/target/1A02180000014yrrmB47B.jpg",
            "width": 1440,
            "height": 1080,
            "mediaType": 0,
            "lat": 39.926239,
            "lon": 119.588017,
            "isWaterMarked": true
          }
        ],
        "hasVideo": false,
        "readCount": 1855,
        "likeCount": 67,
        "commentCount": 5,
        "shareCount": 0,
        "urls": [
          {
            "version": "article",
            "appUrl": "ctrip://wireless/h5?page=index.html#detail/6404026.html&path=destination/article&navBarStyle=white",
            "h5Url": "https://m.ctrip.com/webapp/you/article/detail/6404026.html",
            "wxUrl": "/pages/article/detail?articleId=6404026"
          },
          {
            "version": "tripShoot",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NjQwNDAyNg==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=6404026",
            "wxUrl": "/pages/detail/detail?articleId=6404026"
          },
          {
            "version": "tripShoot2",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NjQwNDAyNg==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=6404026",
            "wxUrl": "/pages/you/lvpai/detail/detail?articleId=6404026"
          }
        ],
        "tags": [
          {
            "tagId": 102011,
            "tagName": "传统艺术",
            "tagLevel": 2,
            "parentTagId": 102000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 101004,
            "tagName": "岩石",
            "tagLevel": 2,
            "parentTagId": 101000,
            "source": 0,
            "sortIndex": 0
          },
          {
            "tagId": 101033,
            "tagName": "奇石",
            "tagLevel": 2,
            "parentTagId": 101000,
            "source": 0,
            "sortIndex": 0
          }
        ],
        "topics": [
        ],
        "operationTopics": [
        ],
        "pois": [
          {
            "poiType": 3,
            "poiId": 51918249,
            "poiName": "孟姜女庙景区",
            "businessId": 4626657,
            "districtId": 132,
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=51918249&poiType=3&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=51918249&poiType=3&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 0,
            "isInChina": true,
            "countryName": "中国"
          },
          {
            "poiType": 4,
            "poiId": 132,
            "poiName": "秦皇岛",
            "districtId": 132,
            "districtName": "秦皇岛",
            "districtENName": "Qinhuangdao",
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=132&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=132&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 1,
            "isInChina": true
          }
        ],
        "publishTime": "2019-09-24 21:53:26",
        "publishTimeDisplay": "2019-09-24",
        "shootTime": "2019-09-21 08:06:44",
        "shootTimeDisplay": "2019-09-21",
        "level": 2,
        "distanceText": "",
        "isLike": false,
        "imageCounts": 9,
        "isCollected": false,
        "collectCount": 1,
        "articleStatus": 2,
        "poiName": "秦皇岛",
        "shareInfo": {
          "imageUrl": "https://youimg1.c-ctrip.com/target/1A02180000014yrrmB47B_C_454_358_Q90.jpg?proc=source/tripshoot",
          "shareTitle": "红山玉雕龙在孟姜女庙景区发了一篇超赞的旅拍，快来围观！",
          "shareContent": "山海关孟姜女庙景区～凤凰山上贞",
          "platForm": "all",
          "token": "be129e552d2e44aaaa09012cc3b49b30"
        },
        "currentDate": "2020.03.13",
        "sourceId": 0
      }
    },
    {
      "type": 1,
      "article": {
        "articleId": 7694761,
        "articleType": "newArticle",
        "strategyItemId": 148,
        "productType": 5,
        "sourceType": 126,
        "articleTitle": "塔斯曼尼亚房车之旅 塔斯曼尼亚岛位于澳洲的南部，有“澳大利亚版的新西兰”之称。这个岛并不大，我们规划",
        "author": {
          "authorId": 464444,
          "nickName": "chloe",
          "clientAuth": "9E75F2549512305E4900AD9491507406",
          "jumpUrl": "https://m.ctrip.com/webapp/you/user?clientAuth=9E75F2549512305E4900AD9491507406",
          "coverImage": {
            "dynamicUrl": "https://dimg04.c-ctrip.com/images/t1/headphoto/413/567/085/8908ff1759f84b20bfe45785a674b2e3_C_180_180.jpg",
            "originalUrl": "https://dimg04.c-ctrip.com/images/t1/headphoto/413/567/085/8908ff1759f84b20bfe45785a674b2e3_C_180_180.jpg"
          },
          "followCount": 111
        },
        "images": [
          {
            "imageId": 487051853,
            "dynamicUrl": "https://youimg1.c-ctrip.com/target/1A0b1e000001f7o52F289_R_800_10000_Q50.jpg?proc=source/tripshoot",
            "originalUrl": "https://youimg1.c-ctrip.com/target/1A0b1e000001f7o52F289.jpg",
            "width": 1920,
            "height": 1280,
            "mediaType": 0,
            "lat": 0,
            "lon": 0,
            "isWaterMarked": true
          }
        ],
        "hasVideo": false,
        "readCount": 728,
        "likeCount": 25,
        "commentCount": 1,
        "shareCount": 0,
        "urls": [
          {
            "version": "article",
            "appUrl": "ctrip://wireless/h5?page=index.html#detail/7694761.html&path=destination/article&navBarStyle=white",
            "h5Url": "https://m.ctrip.com/webapp/you/article/detail/7694761.html",
            "wxUrl": "/pages/article/detail?articleId=7694761"
          },
          {
            "version": "tripShoot",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NzY5NDc2MQ==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=7694761",
            "wxUrl": "/pages/detail/detail?articleId=7694761"
          },
          {
            "version": "tripShoot2",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NzY5NDc2MQ==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=7694761",
            "wxUrl": "/pages/you/lvpai/detail/detail?articleId=7694761"
          }
        ],
        "tags": [
        ],
        "topics": [
          {
            "topicId": 12804,
            "topicName": "有爱的亲子照",
            "level": 2
          }
        ],
        "operationTopics": [
        ],
        "pois": [
          {
            "poiType": 4,
            "poiId": 25024,
            "poiName": "塔斯马尼亚",
            "districtId": 25024,
            "districtName": "塔斯马尼亚",
            "districtENName": "Tasmania",
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=25024&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=25024&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 0,
            "isInChina": false
          }
        ],
        "publishTime": "2020-03-11 21:38:52",
        "publishTimeDisplay": "1天前",
        "shootTime": "2016-02-09 17:01:27",
        "shootTimeDisplay": "2016-02-09",
        "level": 2,
        "distanceText": "",
        "isLike": false,
        "imageCounts": 6,
        "isCollected": false,
        "collectCount": 0,
        "articleStatus": 2,
        "poiName": "塔斯马尼亚",
        "shareInfo": {
          "imageUrl": "https://youimg1.c-ctrip.com/target/1A0b1e000001f7o52F289_C_454_358_Q90.jpg?proc=source/tripshoot",
          "shareTitle": "chloe在塔斯马尼亚发了一篇超赞的旅拍，快来围观！",
          "shareContent": "塔斯曼尼亚房车之旅塔斯曼尼亚岛",
          "platForm": "all",
          "token": "7346c91ecd6a47f1ad110a6e338ef7ea"
        },
        "currentDate": "2020.03.13",
        "sourceId": 0
      }
    },
    {
      "type": 1,
      "article": {
        "articleId": 7694002,
        "articleType": "newArticle",
        "strategyItemId": 148,
        "productType": 5,
        "sourceType": 126,
        "articleTitle": "【记录生活美一刻】湖州·月亮广场     太湖美呀太湖美    美就美在太湖水    水上有白帆哪 ",
        "author": {
          "authorId": 394617,
          "nickName": "自在GUAN",
          "clientAuth": "BC283024BA3F5F675BF8F33C92813260",
          "jumpUrl": "https://m.ctrip.com/webapp/you/user?clientAuth=BC283024BA3F5F675BF8F33C92813260",
          "coverImage": {
            "dynamicUrl": "https://dimg04.c-ctrip.com/images/Z80415000000xr4707057_C_180_180.jpg",
            "originalUrl": "https://dimg04.c-ctrip.com/images/Z80415000000xr4707057_C_180_180.jpg"
          },
          "followCount": 469
        },
        "images": [
          {
            "imageId": 487051000,
            "dynamicUrl": "https://youimg1.c-ctrip.com/target/1A0t1e000001f5bqgCDC2_R_800_10000_Q50.jpg?proc=source/tripshoot",
            "originalUrl": "https://youimg1.c-ctrip.com/target/1A0t1e000001f5bqgCDC2.jpg",
            "width": 1048,
            "height": 1660,
            "mediaType": 0,
            "lat": 0,
            "lon": 0,
            "isWaterMarked": true
          }
        ],
        "hasVideo": false,
        "readCount": 850,
        "likeCount": 27,
        "commentCount": 2,
        "shareCount": 0,
        "urls": [
          {
            "version": "article",
            "appUrl": "ctrip://wireless/h5?page=index.html#detail/7694002.html&path=destination/article&navBarStyle=white",
            "h5Url": "https://m.ctrip.com/webapp/you/article/detail/7694002.html",
            "wxUrl": "/pages/article/detail?articleId=7694002"
          },
          {
            "version": "tripShoot",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NzY5NDAwMg==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=7694002",
            "wxUrl": "/pages/detail/detail?articleId=7694002"
          },
          {
            "version": "tripShoot2",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NzY5NDAwMg==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=7694002",
            "wxUrl": "/pages/you/lvpai/detail/detail?articleId=7694002"
          }
        ],
        "tags": [
        ],
        "topics": [
          {
            "topicId": 32311,
            "topicName": "宅家翻相册",
            "level": 1,
            "image": {
              "imageId": 485429071,
              "dynamicUrl": "https://youimg1.c-ctrip.com/target/100t0z000000mhkm2C860_R_640_10000_Q90.jpg",
              "originalUrl": "https://youimg1.c-ctrip.com/target/100t0z000000mhkm2C860.jpg",
              "width": 1280,
              "height": 854,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            },
            "iconImage": {
              "imageId": 485074271,
              "dynamicUrl": "https://youimg1.c-ctrip.com/target/100m0z000000nzaz305A6_R_640_10000_Q90.png",
              "originalUrl": "https://youimg1.c-ctrip.com/target/100m0z000000nzaz305A6.png",
              "width": 39,
              "height": 45,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            }
          },
          {
            "topicId": 32578,
            "topicName": "三行诗大赛",
            "level": 1
          },
          {
            "topicId": 32543,
            "topicName": "在湖州看见美丽中国",
            "level": 1,
            "image": {
              "imageId": 486500603,
              "dynamicUrl": "https://youimg1.c-ctrip.com/target/100e1e000001f0tt9D9E3_R_640_10000_Q90.jpg",
              "originalUrl": "https://youimg1.c-ctrip.com/target/100e1e000001f0tt9D9E3.jpg",
              "width": 4800,
              "height": 2700,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            },
            "iconImage": {
              "imageId": 485074271,
              "dynamicUrl": "https://youimg1.c-ctrip.com/target/100m0z000000nzaz305A6_R_640_10000_Q90.png",
              "originalUrl": "https://youimg1.c-ctrip.com/target/100m0z000000nzaz305A6.png",
              "width": 39,
              "height": 45,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            }
          },
          {
            "topicId": 32702,
            "topicName": "去年三月你在哪儿",
            "level": 1,
            "image": {
              "imageId": 486268113,
              "dynamicUrl": "https://youimg1.c-ctrip.com/target/100w0q000000gra5p4BAE_R_640_10000_Q90.jpg",
              "originalUrl": "https://youimg1.c-ctrip.com/target/100w0q000000gra5p4BAE.jpg",
              "width": 1280,
              "height": 854,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            },
            "iconImage": {
              "imageId": 485074271,
              "dynamicUrl": "https://youimg1.c-ctrip.com/target/100m0z000000nzaz305A6_R_640_10000_Q90.png",
              "originalUrl": "https://youimg1.c-ctrip.com/target/100m0z000000nzaz305A6.png",
              "width": 39,
              "height": 45,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            }
          },
          {
            "topicId": 31722,
            "topicName": "疫情结束后最想去哪儿",
            "level": 1,
            "image": {
              "imageId": 484647830,
              "dynamicUrl": "https://youimg1.c-ctrip.com/target/100t1d000001e9p3b8763_R_640_10000_Q90.jpg",
              "originalUrl": "https://youimg1.c-ctrip.com/target/100t1d000001e9p3b8763.jpg",
              "width": 1920,
              "height": 1280,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            }
          }
        ],
        "operationTopics": [
        ],
        "pois": [
          {
            "poiType": 88,
            "poiId": 69505560,
            "poiName": "月亮广场",
            "businessId": 69505560,
            "districtId": 68,
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=69505560&poiType=88&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=69505560&poiType=88&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 0,
            "isInChina": true,
            "countryName": "中国"
          },
          {
            "poiType": 4,
            "poiId": 68,
            "poiName": "湖州",
            "districtId": 68,
            "districtName": "湖州",
            "districtENName": "Huzhou",
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=68&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=68&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 1,
            "isInChina": true
          }
        ],
        "publishTime": "2020-03-11 18:44:16",
        "publishTimeDisplay": "1天前",
        "shootTime": "2014-11-10 12:01:01",
        "shootTimeDisplay": "2014-11-10",
        "level": 2,
        "distanceText": "",
        "isLike": false,
        "imageCounts": 9,
        "isCollected": false,
        "collectCount": 0,
        "articleStatus": 2,
        "poiName": "湖州",
        "shareInfo": {
          "imageUrl": "https://youimg1.c-ctrip.com/target/1A0t1e000001f5bqgCDC2_C_454_358_Q90.jpg?proc=source/tripshoot",
          "shareTitle": "自在GUAN在月亮广场发了一篇超赞的旅拍，快来围观！",
          "shareContent": "【记录生活美一刻】湖州·月亮广",
          "platForm": "all",
          "token": "035d537834164ec1932a0fda34da3da4"
        },
        "currentDate": "2020.03.13",
        "sourceId": 0
      }
    },
    {
      "type": 1,
      "article": {
        "articleId": 7689598,
        "articleType": "newArticle",
        "strategyItemId": 148,
        "productType": 5,
        "sourceType": 126,
        "articleTitle": "日本｜小众旅行地——福井吃喝玩乐全攻略  去过日本很多地方，最近喜欢找一些比较小众的地方玩，这次去了",
        "author": {
          "authorId": 4988,
          "nickName": "Mimo夏未末",
          "describe": "",
          "clientAuth": "B574A19A6DAC33026117718DFAB4006F",
          "jumpUrl": "https://m.ctrip.com/webapp/you/user?clientAuth=B574A19A6DAC33026117718DFAB4006F",
          "coverImage": {
            "dynamicUrl": "https://dimg04.c-ctrip.com/images/Z80m10000000pr6q16983_C_180_180.jpg",
            "originalUrl": "https://dimg04.c-ctrip.com/images/Z80m10000000pr6q16983_C_180_180.jpg"
          },
          "qualification": "https://pages.c-ctrip.com/you/note/balloon_author.png",
          "identityType": 13,
          "identityTypeName": "签约旅行家",
          "followCount": 101673
        },
        "images": [
          {
            "imageId": 486978193,
            "dynamicUrl": "https://youimg1.c-ctrip.com/target/1A081e000001f4fjeF96B_R_800_10000_Q50.jpg?proc=source/tripshoot",
            "originalUrl": "https://youimg1.c-ctrip.com/target/1A081e000001f4fjeF96B.jpg",
            "width": 1440,
            "height": 1920,
            "mediaType": 0,
            "lat": 0,
            "lon": 0,
            "isWaterMarked": true
          }
        ],
        "hasVideo": false,
        "readCount": 2062,
        "likeCount": 126,
        "commentCount": 16,
        "shareCount": 0,
        "urls": [
          {
            "version": "article",
            "appUrl": "ctrip://wireless/h5?page=index.html#detail/7689598.html&path=destination/article&navBarStyle=white",
            "h5Url": "https://m.ctrip.com/webapp/you/article/detail/7689598.html",
            "wxUrl": "/pages/article/detail?articleId=7689598"
          },
          {
            "version": "tripShoot",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NzY4OTU5OA==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=7689598",
            "wxUrl": "/pages/detail/detail?articleId=7689598"
          },
          {
            "version": "tripShoot2",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NzY4OTU5OA==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=7689598",
            "wxUrl": "/pages/you/lvpai/detail/detail?articleId=7689598"
          }
        ],
        "tags": [
        ],
        "topics": [
          {
            "topicId": 32702,
            "topicName": "去年三月你在哪儿",
            "level": 1,
            "image": {
              "imageId": 486268113,
              "dynamicUrl": "https://youimg1.c-ctrip.com/target/100w0q000000gra5p4BAE_R_640_10000_Q90.jpg",
              "originalUrl": "https://youimg1.c-ctrip.com/target/100w0q000000gra5p4BAE.jpg",
              "width": 1280,
              "height": 854,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            },
            "iconImage": {
              "imageId": 485074271,
              "dynamicUrl": "https://youimg1.c-ctrip.com/target/100m0z000000nzaz305A6_R_640_10000_Q90.png",
              "originalUrl": "https://youimg1.c-ctrip.com/target/100m0z000000nzaz305A6.png",
              "width": 39,
              "height": 45,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            }
          }
        ],
        "operationTopics": [
        ],
        "pois": [
          {
            "poiType": 4,
            "poiId": 56531,
            "poiName": "福井",
            "districtId": 56531,
            "districtName": "福井",
            "districtENName": "Fukui",
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=56531&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=56531&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 0,
            "isInChina": false
          }
        ],
        "publishTime": "2020-03-10 17:39:44",
        "publishTimeDisplay": "2天前",
        "shootTime": "2020-03-10 17:11:44",
        "shootTimeDisplay": "2020-03-10",
        "level": 3,
        "distanceText": "",
        "isLike": false,
        "imageCounts": 9,
        "isCollected": false,
        "collectCount": 5,
        "articleStatus": 2,
        "poiName": "福井",
        "shareInfo": {
          "imageUrl": "https://youimg1.c-ctrip.com/target/1A081e000001f4fjeF96B_C_454_358_Q90.jpg?proc=source/tripshoot",
          "shareTitle": "Mimo夏未末在福井发了一篇超赞的旅拍，快来围观！",
          "shareContent": "日本｜小众旅行地——福井吃喝玩",
          "platForm": "all",
          "token": "073349997cb74165957ff869819de232"
        },
        "currentDate": "2020.03.13",
        "sourceId": 0
      }
    },
    {
      "type": 1,
      "article": {
        "articleId": 7690377,
        "articleType": "newArticle",
        "strategyItemId": 148,
        "productType": 5,
        "sourceType": 126,
        "articleTitle": "北京南站亚朵酒店毗邻陶然亭公园这是一座融古代与现代造园艺术为一体的现代新型城市园林名闻遐迩的陶然亭、",
        "author": {
          "authorId": 865873,
          "nickName": "世间Anjunla",
          "clientAuth": "08CC3A86DC20E4D7E329D735EC37D31BA44968DE59EA039859A2C95313554207",
          "jumpUrl": "https://m.ctrip.com/webapp/you/user?clientAuth=08CC3A86DC20E4D7E329D735EC37D31BA44968DE59EA039859A2C95313554207",
          "coverImage": {
            "dynamicUrl": "https://dimg04.c-ctrip.com/images/Z8091e000001f6txw093A_C_180_180.jpg",
            "originalUrl": "https://dimg04.c-ctrip.com/images/Z8091e000001f6txw093A_C_180_180.jpg"
          },
          "followCount": 10
        },
        "images": [
          {
            "imageId": 486986183,
            "dynamicUrl": "https://youimg1.c-ctrip.com/target/1A0o1e000001f37yf1F70_R_800_10000_Q50.jpg?proc=source/tripshoot",
            "originalUrl": "https://youimg1.c-ctrip.com/target/1A0o1e000001f37yf1F70.jpg",
            "width": 1616,
            "height": 1080,
            "mediaType": 0,
            "lat": 0,
            "lon": 0,
            "isWaterMarked": true
          }
        ],
        "hasVideo": false,
        "readCount": 1969,
        "likeCount": 105,
        "commentCount": 8,
        "shareCount": 0,
        "urls": [
          {
            "version": "article",
            "appUrl": "ctrip://wireless/h5?page=index.html#detail/7690377.html&path=destination/article&navBarStyle=white",
            "h5Url": "https://m.ctrip.com/webapp/you/article/detail/7690377.html",
            "wxUrl": "/pages/article/detail?articleId=7690377"
          },
          {
            "version": "tripShoot",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NzY5MDM3Nw==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=7690377",
            "wxUrl": "/pages/detail/detail?articleId=7690377"
          },
          {
            "version": "tripShoot2",
            "appUrl": "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NzY5MDM3Nw==",
            "h5Url": "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=7690377",
            "wxUrl": "/pages/you/lvpai/detail/detail?articleId=7690377"
          }
        ],
        "tags": [
        ],
        "topics": [
          {
            "topicId": 12830,
            "topicName": "一个人说走就走",
            "level": 2
          },
          {
            "topicId": 12789,
            "topicName": "睡过才会懂的高端酒店",
            "level": 2
          },
          {
            "topicId": 31722,
            "topicName": "疫情结束后最想去哪儿",
            "level": 1,
            "image": {
              "imageId": 484647830,
              "dynamicUrl": "https://youimg1.c-ctrip.com/target/100t1d000001e9p3b8763_R_640_10000_Q90.jpg",
              "originalUrl": "https://youimg1.c-ctrip.com/target/100t1d000001e9p3b8763.jpg",
              "width": 1920,
              "height": 1280,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            }
          }
        ],
        "operationTopics": [
        ],
        "pois": [
          {
            "poiType": 50,
            "poiId": 78746000,
            "poiName": "北京南站亚朵酒店",
            "businessId": 52159868,
            "districtId": 1,
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=78746000&poiType=50&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=78746000&poiType=50&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 0,
            "isInChina": true,
            "countryName": "中国"
          },
          {
            "poiType": 4,
            "poiId": 1,
            "poiName": "北京",
            "districtId": 1,
            "districtName": "北京",
            "districtENName": "Beijing",
            "poiExt": {
              "h5Url": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=1&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl": "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=1&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 1,
            "isInChina": true
          }
        ],
        "publishTime": "2020-03-13 06:09:58",
        "publishTimeDisplay": "8小时前",
        "shootTime": "2020-03-10 20:45:02",
        "shootTimeDisplay": "2020-03-10",
        "level": 2,
        "distanceText": "",
        "isLike": false,
        "imageCounts": 20,
        "isCollected": false,
        "collectCount": 8,
        "articleStatus": 2,
        "poiName": "北京",
        "shareInfo": {
          "imageUrl": "https://youimg1.c-ctrip.com/target/1A0o1e000001f37yf1F70_C_454_358_Q90.jpg?proc=source/tripshoot",
          "shareTitle": "世间Anjunla在北京南站亚朵酒店发了一篇超赞的旅拍，快来围观！",
          "shareContent": "北京南站亚朵酒店毗邻陶然亭公园",
          "platForm": "all",
          "token": "ad0ddc560eb5424a9874c3e7f008ef42"
        },
        "currentDate": "2020.03.13",
        "sourceId": 0
      }
    }
  ]
}
;
