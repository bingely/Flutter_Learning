import 'package:amap_search_fluttify/amap_search_fluttify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/pages/chat/map/place.dart';

class PlaceView extends StatelessWidget {

  String poi;

  PlaceView(this.poi);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(child: Text(poi,maxLines: 1,overflow: TextOverflow.ellipsis,))
      ],

    );
  }
}
