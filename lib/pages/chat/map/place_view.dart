import 'package:flutter/material.dart';
import 'package:flutter_qyyim/config/app.dart';
import 'package:flutter_qyyim/pages/chat/map/place.dart';

class PlaceView extends StatefulWidget {

  //位置
  int index;


  int mindex;

  Place place;
  VoidCallback onpress;
  PlaceView(this.place,{this.onpress,this.index,this.mindex});

  @override
  _PlaceViewState createState() => new _PlaceViewState();
}

class _PlaceViewState extends State<PlaceView> {

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      /*onPressed: () {
        widget.place.isCheck = !widget.place.isCheck;
        setState(() {});
      },*/
      onPressed: this.widget.onpress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${widget.place.title}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    '${widget.place.address}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
          (widget.index == widget.mindex)
              ? Icon(
                  Icons.check,
                  color: Colors.green,
                )
              : Container(width: 20,)
        ],
      ),
    );
  }
}
