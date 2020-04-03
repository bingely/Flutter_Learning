import 'package:flutter/material.dart';
import 'package:flutter_qyyim/config/app.dart';
import 'package:flutter_qyyim/pages/chat/map/place.dart';
import 'package:flutter_qyyim/pages/me/list_tile_view.dart';

class PlaceView extends StatelessWidget {

  Place place;

  PlaceView(this.place);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
            child: ListTileView(
              border: Border(
                  bottom: BorderSide(color: AppColors.lineColor, width: 0.2)),
              title: '${place.title}',
              label: '${place.address}',
              isLabel: true,
              padding: EdgeInsets.symmetric(vertical: 16.0),
              width: 25.0,
              fit: BoxFit.cover,
              onPressed: () {
              },
            ))
      ],
    );
  }
}
