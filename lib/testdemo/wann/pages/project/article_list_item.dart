import 'package:flutter/material.dart';

class ArticleItemWidget extends StatefulWidget {
  @override
  _ArticleItemWidgetState createState() => new _ArticleItemWidgetState();
}

class _ArticleItemWidgetState extends State<ArticleItemWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //
        Material(
          child: InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  border: Border(
                    bottom: Divider.createBorderSide(context, width: 0.7),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      ClipOval(

                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[Text('center')],
                  )
                ],
              ),
            ),
          ),
        ),
        // 2
        Positioned(
          right: 0,
          bottom: 0,
          child: Text('bottom'),
        )
      ],
    );
  }
}
