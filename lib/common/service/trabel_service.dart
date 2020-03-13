import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/pages/trip/model/home_model.dart';
import 'package:flutter_qyyim/pages/trip/model/travel_model.dart';
import 'package:flutter_qyyim/pages/trip/model/travel_tab_model.dart';

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
    "Timestamp": "/Date(1583982037473+0800)/",
    "Ack": "Success",
    "Errors": [],
    "Extension": [
      {"Id": "CLOGGING_TRACE_ID", "Value": "3360158458880360851"},
      {"Id": "RootMessageId", "Value": "921812-0a3d3e74-439995-34311"}
    ]
  },
  "totalCount": 500,
  "resultList": [
    {
      "type": 1,
      "article": {
        "articleId": 4392155,
        "articleType": "newArticle",
        "strategyItemId": 148,
        "productType": 5,
        "sourceType": 126,
        "articleTitle": "「伦敦眼」上看伦敦......  在「伦敦眼」上俯瞰泰晤士河两岸，美不胜收的英伦画面展现在你眼前。乘",
        "author": {
          "authorId": 412109,
          "nickName": "-看世界",
          "clientAuth": "7D405BDE57BA0ABBFABE8274061E0D6D",
          "jumpUrl":
              "https://m.ctrip.com/webapp/you/user?clientAuth=7D405BDE57BA0ABBFABE8274061E0D6D",
          "coverImage": {
            "dynamicUrl":
                "https://dimg04.c-ctrip.com/images/Z80e1c000001ckvn7CDDF_C_180_180.jpg",
            "originalUrl":
                "https://dimg04.c-ctrip.com/images/Z80e1c000001ckvn7CDDF_C_180_180.jpg"
          },
          "followCount": 774
        },
        "images": [
          {
            "imageId": 304902357,
            "dynamicUrl":
                "https://youimg1.c-ctrip.com/target/1A0810000000pgu8sDD4E_R_800_10000_Q50.jpg?proc=source/tripshoot",
            "originalUrl":
                "https://youimg1.c-ctrip.com/target/1A0810000000pgu8sDD4E.jpg",
            "width": 1920,
            "height": 1078,
            "mediaType": 0,
            "lat": 0,
            "lon": 0,
            "isWaterMarked": false
          }
        ],
        "hasVideo": false,
        "readCount": 2006,
        "likeCount": 65,
        "commentCount": 22,
        "shareCount": 0,
        "urls": [
          {
            "version": "article",
            "appUrl":
                "ctrip://wireless/h5?page=index.html#detail/4392155.html&path=destination/article&navBarStyle=white",
            "h5Url":
                "https://m.ctrip.com/webapp/you/article/detail/4392155.html",
            "wxUrl": "/pages/article/detail?articleId=4392155"
          },
          {
            "version": "tripShoot",
            "appUrl":
                "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NDM5MjE1NQ==",
            "h5Url":
                "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=4392155",
            "wxUrl": "/pages/detail/detail?articleId=4392155"
          },
          {
            "version": "tripShoot2",
            "appUrl":
                "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NDM5MjE1NQ==",
            "h5Url":
                "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=4392155",
            "wxUrl": "/pages/you/lvpai/detail/detail?articleId=4392155"
          }
        ],
        "tags": [],
        "topics": [],
        "operationTopics": [],
        "pois": [
          {
            "poiType": 3,
            "poiId": 81747,
            "poiName": "伦敦眼",
            "businessId": 25602,
            "districtId": 309,
            "poiExt": {
              "h5Url":
                  "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=81747&poiType=3&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl":
                  "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=81747&poiType=3&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 0,
            "isInChina": false,
            "countryName": "英国"
          },
          {
            "poiType": 4,
            "poiId": 309,
            "poiName": "伦敦",
            "districtId": 309,
            "districtName": "伦敦",
            "districtENName": "London",
            "poiExt": {
              "h5Url":
                  "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=309&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl":
                  "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=309&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 1,
            "isInChina": false
          }
        ],
        "publishTime": "2020-03-10 12:16:24",
        "publishTimeDisplay": "1天前",
        "shootTime": "2018-05-12 12:01:01",
        "shootTimeDisplay": "2018-05-12",
        "level": 2,
        "distanceText": "",
        "isLike": false,
        "imageCounts": 8,
        "isCollected": false,
        "collectCount": 3,
        "articleStatus": 2,
        "poiName": "伦敦",
        "shareInfo": {
          "imageUrl":
              "https://youimg1.c-ctrip.com/target/1A0810000000pgu8sDD4E_C_454_358_Q90.jpg?proc=source/tripshoot",
          "shareTitle": "-看世界在伦敦眼发了一篇超赞的旅拍，快来围观！",
          "shareContent": "「伦敦眼」上看伦敦......",
          "platForm": "all",
          "token": "4a2a099aa17a4ebbb925dd8166c36afc"
        },
        "currentDate": "2020.03.12",
        "sourceId": 0
      }
    },
    {
      "type": 1,
      "article": {
        "articleId": 7648637,
        "articleType": "reside",
        "strategyItemId": 176,
        "productType": 5,
        "sourceType": 126,
        "articleTitle": "济州岛：亲子互动性超高的森林小火车生态公园  EcoLand生态主题公园，是一个以火车旅行为主题的大",
        "author": {
          "authorId": 863090,
          "nickName": "小奶酥89",
          "clientAuth": "E7E21CD28C936C1EF77F9981506199F6",
          "jumpUrl":
              "https://m.ctrip.com/webapp/you/user?clientAuth=E7E21CD28C936C1EF77F9981506199F6",
          "coverImage": {
            "dynamicUrl":
                "https://dimg04.c-ctrip.com/images/Z80q1d000001epqwi1EB4_C_180_180.jpg",
            "originalUrl":
                "https://dimg04.c-ctrip.com/images/Z80q1d000001epqwi1EB4_C_180_180.jpg"
          },
          "followCount": 25
        },
        "images": [
          {
            "imageId": 486102000,
            "dynamicUrl":
                "https://youimg1.c-ctrip.com/target/1A0f1e000001et0f6ADD1_R_800_10000_Q50.jpg?proc=source/tripshoot",
            "originalUrl":
                "https://youimg1.c-ctrip.com/target/1A0f1e000001et0f6ADD1.jpg",
            "width": 1281,
            "height": 1920,
            "mediaType": 0,
            "lat": 0,
            "lon": 0,
            "isWaterMarked": true
          }
        ],
        "hasVideo": false,
        "readCount": 1230,
        "likeCount": 29,
        "commentCount": 7,
        "shareCount": 0,
        "urls": [
          {
            "version": "article",
            "appUrl":
                "ctrip://wireless/h5?page=index.html#detail/7648637.html&path=destination/article&navBarStyle=white",
            "h5Url":
                "https://m.ctrip.com/webapp/you/article/detail/7648637.html",
            "wxUrl": "/pages/article/detail?articleId=7648637"
          },
          {
            "version": "tripShoot",
            "appUrl":
                "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NzY0ODYzNw==",
            "h5Url":
                "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=7648637",
            "wxUrl": "/pages/detail/detail?articleId=7648637"
          },
          {
            "version": "tripShoot2",
            "appUrl":
                "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NzY0ODYzNw==",
            "h5Url":
                "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=7648637",
            "wxUrl": "/pages/you/lvpai/detail/detail?articleId=7648637"
          }
        ],
        "tags": [],
        "topics": [
          {"topicId": 12680, "topicName": "打卡韩剧取景地", "level": 2},
          {
            "topicId": 31722,
            "topicName": "疫情结束后最想去哪儿",
            "level": 1,
            "image": {
              "imageId": 484647830,
              "dynamicUrl":
                  "https://youimg1.c-ctrip.com/target/100t1d000001e9p3b8763_R_640_10000_Q90.jpg",
              "originalUrl":
                  "https://youimg1.c-ctrip.com/target/100t1d000001e9p3b8763.jpg",
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
              "dynamicUrl":
                  "https://youimg1.c-ctrip.com/target/100t0z000000mhkm2C860_R_640_10000_Q90.jpg",
              "originalUrl":
                  "https://youimg1.c-ctrip.com/target/100t0z000000mhkm2C860.jpg",
              "width": 1280,
              "height": 854,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            },
            "iconImage": {
              "imageId": 485074271,
              "dynamicUrl":
                  "https://youimg1.c-ctrip.com/target/100m0z000000nzaz305A6_R_640_10000_Q90.png",
              "originalUrl":
                  "https://youimg1.c-ctrip.com/target/100m0z000000nzaz305A6.png",
              "width": 39,
              "height": 45,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            }
          }
        ],
        "operationTopics": [],
        "pois": [
          {
            "poiType": 3,
            "poiId": 23909829,
            "poiName": "济州Ecoland生态主题乐园",
            "businessId": 1789427,
            "districtId": 297,
            "poiExt": {
              "h5Url":
                  "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=23909829&poiType=3&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl":
                  "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=23909829&poiType=3&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 0,
            "isInChina": false,
            "countryName": "韩国"
          },
          {
            "poiType": 4,
            "poiId": 297,
            "poiName": "济州岛",
            "districtId": 297,
            "districtName": "济州岛",
            "districtENName": "JejuIsland",
            "poiExt": {
              "h5Url":
                  "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=297&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl":
                  "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=297&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 1,
            "isInChina": false
          }
        ],
        "publishTime": "2020-03-01 18:52:30",
        "publishTimeDisplay": "10天前",
        "shootTime": "2020-03-01 17:24:45",
        "shootTimeDisplay": "2020-03-01",
        "level": 2,
        "distanceText": "",
        "isLike": false,
        "imageCounts": 10,
        "isCollected": false,
        "collectCount": 1,
        "articleStatus": 2,
        "poiName": "济州岛",
        "shareInfo": {
          "imageUrl":
              "https://youimg1.c-ctrip.com/target/1A0f1e000001et0f6ADD1_C_454_358_Q90.jpg?proc=source/tripshoot",
          "shareTitle": "小奶酥89在济州Ecoland生态主题乐园发了一篇超赞的旅拍，快来围观！",
          "shareContent": "济州岛：亲子互动性超高的森林小",
          "platForm": "all",
          "token": "6cec5fd421cc4adeb7590d7b1cfb5383"
        },
        "currentDate": "2020.03.12",
        "sourceId": 0
      }
    },
    {
      "type": 1,
      "article": {
        "articleId": 7686505,
        "articleType": "newArticle",
        "strategyItemId": 148,
        "productType": 5,
        "sourceType": 126,
        "articleTitle": "迪拜超冷门印度区，揭秘贫民真实日常！超市物价有多贵？   中东之城迪拜，身在这座烙印着奢华标签之都，",
        "author": {
          "authorId": 401088,
          "nickName": "大樱桃与小灯泡",
          "clientAuth": "40DA8B069F34E5812BBC92F219591AAF",
          "jumpUrl":
              "https://m.ctrip.com/webapp/you/user?clientAuth=40DA8B069F34E5812BBC92F219591AAF",
          "coverImage": {
            "dynamicUrl":
                "https://dimg04.c-ctrip.com/images/Z8020y000000mdk3d61F6_C_180_180.jpg",
            "originalUrl":
                "https://dimg04.c-ctrip.com/images/Z8020y000000mdk3d61F6_C_180_180.jpg"
          },
          "qualification":
              "https://pages.c-ctrip.com/you/note/balloon_author.png",
          "identityType": 13,
          "identityTypeName": "签约旅行家",
          "userTags": [
            {
              "tagType": 2,
              "tagName": "杭州资深玩家",
              "tagDesc": "",
              "appUrl":
                  "https://m.ctrip.com/webapp/you/tsnap/talentAreaIndex.html?isHideNavBar=yes&popup=close&activityid=199&allianceid=&sid=&ouid=",
              "h5Url":
                  "https://m.ctrip.com/webapp/you/tsnap/talentAreaIndex.html?isHideNavBar=yes&popup=close&activityid=199&allianceid=&sid=&ouid=",
              "wxUrl":
                  "https://m.ctrip.com/webapp/you/tsnap/talentAreaIndex.html?isHideNavBar=yes&popup=close&activityid=199&allianceid=&sid=&ouid="
            }
          ],
          "followCount": 13326,
          "remarkTag": {"tagId": 2, "tagName": "杭州资深玩家"}
        },
        "images": [
          {
            "imageId": 486932828,
            "dynamicUrl":
                "https://youimg1.c-ctrip.com/target/1A0a1e000001f4mmmFCC6_R_800_10000_Q50.jpg?proc=source/tripshoot",
            "originalUrl":
                "https://youimg1.c-ctrip.com/target/1A0a1e000001f4mmmFCC6.jpg",
            "width": 1920,
            "height": 1080,
            "mediaType": 0,
            "lat": 30.307502,
            "lon": 120.190427,
            "isWaterMarked": false
          }
        ],
        "coverGIF": {"originalUrl": ""},
        "hasVideo": true,
        "video": {
          "videoId": 559593,
          "coverImageUrl":
              "https://youimg1.c-ctrip.com/target/1A0a1e000001f4mmmFCC6_R_800_10000_Q50.jpg?proc=source/tripshoot",
          "videoUrl":
              "https://vodlnr6niz5.vod.126.net/vodlnr6niz5/gnAsoguI_2932149596_shd.mp4",
          "mediaType": 1,
          "width": 1280,
          "height": 720
        },
        "readCount": 829,
        "likeCount": 47,
        "commentCount": 4,
        "shareCount": 0,
        "urls": [
          {
            "version": "article",
            "appUrl":
                "ctrip://wireless/h5?page=index.html#detail/7686505.html&path=destination/article&navBarStyle=white",
            "h5Url":
                "https://m.ctrip.com/webapp/you/article/detail/7686505.html",
            "wxUrl": "/pages/article/detail?articleId=7686505"
          },
          {
            "version": "tripShoot",
            "appUrl":
                "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NzY4NjUwNQ==",
            "h5Url":
                "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=7686505",
            "wxUrl": "/pages/detail/detail?articleId=7686505"
          },
          {
            "version": "tripShoot2",
            "appUrl":
                "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NzY4NjUwNQ==",
            "h5Url":
                "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=7686505",
            "wxUrl": "/pages/you/lvpai/detail/detail?articleId=7686505"
          }
        ],
        "tags": [],
        "topics": [
          {"topicId": 12830, "topicName": "一个人说走就走", "level": 2},
          {"topicId": 12810, "topicName": "我的旅行Vlog", "level": 2},
          {"topicId": 31902, "topicName": "心愿旅行地", "level": 2},
          {
            "topicId": 32311,
            "topicName": "宅家翻相册",
            "level": 1,
            "image": {
              "imageId": 485429071,
              "dynamicUrl":
                  "https://youimg1.c-ctrip.com/target/100t0z000000mhkm2C860_R_640_10000_Q90.jpg",
              "originalUrl":
                  "https://youimg1.c-ctrip.com/target/100t0z000000mhkm2C860.jpg",
              "width": 1280,
              "height": 854,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            },
            "iconImage": {
              "imageId": 485074271,
              "dynamicUrl":
                  "https://youimg1.c-ctrip.com/target/100m0z000000nzaz305A6_R_640_10000_Q90.png",
              "originalUrl":
                  "https://youimg1.c-ctrip.com/target/100m0z000000nzaz305A6.png",
              "width": 39,
              "height": 45,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            }
          }
        ],
        "operationTopics": [],
        "pois": [
          {
            "poiType": 5,
            "poiId": 77482012,
            "poiName": "Al Adil Supermarket",
            "businessId": 77482012,
            "districtId": 1062,
            "poiExt": {
              "h5Url":
                  "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=77482012&poiType=5&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl":
                  "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=77482012&poiType=5&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 0,
            "isInChina": false,
            "countryName": "阿联酋"
          },
          {
            "poiType": 4,
            "poiId": 1062,
            "poiName": "迪拜",
            "districtId": 1062,
            "districtName": "迪拜",
            "districtENName": "Dubai",
            "poiExt": {
              "h5Url":
                  "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=1062&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl":
                  "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=1062&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 1,
            "isInChina": false
          }
        ],
        "publishTime": "2020-03-09 23:38:12",
        "publishTimeDisplay": "2天前",
        "shootTime": "2020-03-09 00:00:00",
        "shootTimeDisplay": "2020-03-09",
        "level": 3,
        "distanceText": "",
        "isLike": false,
        "imageCounts": 0,
        "isCollected": false,
        "collectCount": 1,
        "articleStatus": 2,
        "poiName": "迪拜",
        "shareInfo": {
          "imageUrl":
              "https://youimg1.c-ctrip.com/target/1A0a1e000001f4mmmFCC6_C_454_358_Q90_Mplay_5.jpg?proc=source/tripshoot",
          "shareTitle": "大樱桃与小灯泡在Al Adil Supermarket发了一篇超赞的旅拍，快来围观！",
          "shareContent": "迪拜超冷门印度区，揭秘贫民真实",
          "platForm": "all",
          "token": "f5bacb00164541c5a7d056790e22b529"
        },
        "currentDate": "2020.03.12",
        "sourceId": 0
      }
    },
    {
      "type": 1,
      "article": {
        "articleId": 7383210,
        "articleType": "reside",
        "strategyItemId": 147,
        "productType": 5,
        "sourceType": 126,
        "articleTitle": "落日余晖下的龙舟画舫，如优美的剪影勾勒出如诗如画般的西山晚晴，冰面上欢愉的人们，霞光投射在十七孔桥洞",
        "author": {
          "authorId": 638672,
          "nickName": "听荧",
          "clientAuth": "660D7DB82120096F01761CD69DC11C42",
          "jumpUrl":
              "https://m.ctrip.com/webapp/you/user?clientAuth=660D7DB82120096F01761CD69DC11C42",
          "coverImage": {
            "dynamicUrl":
                "https://dimg04.c-ctrip.com/images/Z8050v000000jnn3hF304_C_180_180.jpg",
            "originalUrl":
                "https://dimg04.c-ctrip.com/images/Z8050v000000jnn3hF304_C_180_180.jpg"
          },
          "followCount": 228
        },
        "images": [
          {
            "imageId": 482280875,
            "dynamicUrl":
                "https://youimg1.c-ctrip.com/target/1A061c000001cx19aA080_R_800_10000_Q50.jpg?proc=source/tripshoot",
            "originalUrl":
                "https://youimg1.c-ctrip.com/target/1A061c000001cx19aA080.jpg",
            "width": 1620,
            "height": 1080,
            "mediaType": 0,
            "lat": 40.031282,
            "lon": 116.269824,
            "isWaterMarked": true
          }
        ],
        "hasVideo": false,
        "readCount": 1124,
        "likeCount": 57,
        "commentCount": 7,
        "shareCount": 0,
        "urls": [
          {
            "version": "article",
            "appUrl":
                "ctrip://wireless/h5?page=index.html#detail/7383210.html&path=destination/article&navBarStyle=white",
            "h5Url":
                "https://m.ctrip.com/webapp/you/article/detail/7383210.html",
            "wxUrl": "/pages/article/detail?articleId=7383210"
          },
          {
            "version": "tripShoot",
            "appUrl":
                "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NzM4MzIxMA==",
            "h5Url":
                "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=7383210",
            "wxUrl": "/pages/detail/detail?articleId=7383210"
          },
          {
            "version": "tripShoot2",
            "appUrl":
                "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NzM4MzIxMA==",
            "h5Url":
                "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=7383210",
            "wxUrl": "/pages/you/lvpai/detail/detail?articleId=7383210"
          }
        ],
        "tags": [],
        "topics": [
          {
            "topicId": 30239,
            "topicName": "新年趣旅行",
            "level": 1,
            "image": {
              "imageId": 481171558,
              "dynamicUrl":
                  "https://youimg1.c-ctrip.com/target/10031c000001c6xv0DAFF_R_640_10000_Q90.jpg",
              "originalUrl":
                  "https://youimg1.c-ctrip.com/target/10031c000001c6xv0DAFF.jpg",
              "width": 1023,
              "height": 575,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            },
            "iconImage": {
              "imageId": 455195817,
              "dynamicUrl":
                  "https://youimg1.c-ctrip.com/target/100m0z000000nzaz305A6_R_640_10000_Q90.png",
              "originalUrl":
                  "https://youimg1.c-ctrip.com/target/100m0z000000nzaz305A6.png",
              "width": 39,
              "height": 45,
              "mediaType": 0,
              "lat": 0,
              "lon": 0
            }
          }
        ],
        "operationTopics": [],
        "pois": [
          {
            "poiType": 3,
            "poiId": 100561,
            "poiName": "颐和园龙舟画舫",
            "businessId": 139690,
            "districtId": 1,
            "poiExt": {
              "h5Url":
                  "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=100561&poiType=3&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl":
                  "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=100561&poiType=3&isHideHeader=true&isHideNavBar=YES&seo=0"
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
              "h5Url":
                  "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=1&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl":
                  "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=1&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 1,
            "isInChina": true
          }
        ],
        "publishTime": "2020-01-11 08:21:14",
        "publishTimeDisplay": "01-11",
        "shootTime": "2020-01-11 08:04:47",
        "shootTimeDisplay": "2020-01-11",
        "level": 2,
        "distanceText": "",
        "isLike": false,
        "imageCounts": 6,
        "isCollected": false,
        "collectCount": 1,
        "articleStatus": 2,
        "poiName": "北京",
        "shareInfo": {
          "imageUrl":
              "https://youimg1.c-ctrip.com/target/1A061c000001cx19aA080_C_454_358_Q90.jpg?proc=source/tripshoot",
          "shareTitle": "听荧在颐和园龙舟画舫发了一篇超赞的旅拍，快来围观！",
          "shareContent": "落日余晖下的龙舟画舫，如优美的",
          "platForm": "all",
          "token": "8d9ace09cde942a3b90be1973436fad1"
        },
        "currentDate": "2020.03.12",
        "sourceId": 0
      }
    },
    {
      "type": 1,
      "article": {
        "articleId": 7457547,
        "articleType": "reside",
        "strategyItemId": 147,
        "productType": 5,
        "sourceType": 126,
        "articleTitle": "滇西慢旅、崇聖寺 始建於唐玄宗開元年間，是唐代地方政權「南詔國」和宋代「大理國」的「皇家寺院」和佛教",
        "author": {
          "authorId": 606541,
          "nickName": "宛若丶渊源",
          "clientAuth": "EB210C686CCB4DCAE8C77BC0F2E1B71F",
          "jumpUrl":
              "https://m.ctrip.com/webapp/you/user?clientAuth=EB210C686CCB4DCAE8C77BC0F2E1B71F",
          "coverImage": {
            "dynamicUrl":
                "https://dimg04.c-ctrip.com/images/headphoto/688/951/078/b739f2587f8a4ef2bc51cf3a4cac905d_C_180_180.jpg",
            "originalUrl":
                "https://dimg04.c-ctrip.com/images/headphoto/688/951/078/b739f2587f8a4ef2bc51cf3a4cac905d_C_180_180.jpg"
          },
          "followCount": 168
        },
        "images": [
          {
            "imageId": 483395568,
            "dynamicUrl":
                "https://youimg1.c-ctrip.com/target/1A081c000001diahg37E1_R_800_10000_Q50.jpg?proc=source/tripshoot",
            "originalUrl":
                "https://youimg1.c-ctrip.com/target/1A081c000001diahg37E1.jpg",
            "width": 1078,
            "height": 1440,
            "mediaType": 0,
            "lat": 0,
            "lon": 0,
            "isWaterMarked": true
          }
        ],
        "hasVideo": false,
        "readCount": 924,
        "likeCount": 33,
        "commentCount": 6,
        "shareCount": 0,
        "urls": [
          {
            "version": "article",
            "appUrl":
                "ctrip://wireless/h5?page=index.html#detail/7457547.html&path=destination/article&navBarStyle=white",
            "h5Url":
                "https://m.ctrip.com/webapp/you/article/detail/7457547.html",
            "wxUrl": "/pages/article/detail?articleId=7457547"
          },
          {
            "version": "tripShoot",
            "appUrl":
                "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NzQ1NzU0Nw==",
            "h5Url":
                "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=7457547",
            "wxUrl": "/pages/detail/detail?articleId=7457547"
          },
          {
            "version": "tripShoot2",
            "appUrl":
                "ctrip://wireless/h5?type=5&url=L3JuX2Rlc3RpbmF0aW9uX3ZpZGVvL21haW4uanM/Q1JOTW9kdWxlTmFtZT1kZXN0aW5hdGlvbmxpdmUmQ1JOVHlwZT0xJmluaXRpYWxQYWdlPXRyYXZlbFJlY29yZF9kZXRhaWwmaWQ9NzQ1NzU0Nw==",
            "h5Url":
                "https://m.ctrip.com/webapp/you/livestream/paipai/detail.html?Id=7457547",
            "wxUrl": "/pages/you/lvpai/detail/detail?articleId=7457547"
          }
        ],
        "tags": [],
        "topics": [
          {"topicId": 12781, "topicName": "轻奢旅行", "level": 2}
        ],
        "operationTopics": [],
        "pois": [
          {
            "poiType": 3,
            "poiId": 56809828,
            "poiName": "崇圣寺",
            "businessId": 5073077,
            "districtId": 31,
            "poiExt": {
              "h5Url":
                  "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=56809828&poiType=3&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl":
                  "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=56809828&poiType=3&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 0,
            "isInChina": true,
            "countryName": "中国"
          },
          {
            "poiType": 4,
            "poiId": 31,
            "poiName": "大理",
            "districtId": 31,
            "districtName": "大理",
            "districtENName": "Dali",
            "poiExt": {
              "h5Url":
                  "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=31&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0",
              "appUrl":
                  "https://m.ctrip.com/webapp/you/tripshoot/paipai/poiPage/poiHome?poiId=31&poiType=4&isHideHeader=true&isHideNavBar=YES&seo=0"
            },
            "source": 2,
            "isMain": 1,
            "isInChina": true
          }
        ],
        "publishTime": "2020-01-19 13:54:04",
        "publishTimeDisplay": "01-19",
        "shootTime": "2018-12-14 00:00:00",
        "shootTimeDisplay": "2018-12-14",
        "level": 2,
        "distanceText": "",
        "isLike": false,
        "imageCounts": 9,
        "isCollected": false,
        "collectCount": 0,
        "articleStatus": 2,
        "poiName": "大理",
        "shareInfo": {
          "imageUrl":
              "https://youimg1.c-ctrip.com/target/1A081c000001diahg37E1_C_454_358_Q90.jpg?proc=source/tripshoot",
          "shareTitle": "宛若丶渊源在崇圣寺发了一篇超赞的旅拍，快来围观！",
          "shareContent": "滇西慢旅、崇聖寺始建於唐玄宗開",
          "platForm": "all",
          "token": "fa3d700ca9394834ad34888a371b3d5a"
        },
        "currentDate": "2020.03.12",
        "sourceId": 0
      }
    }
  ]
};
