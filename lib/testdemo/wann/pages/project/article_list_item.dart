import 'package:flutter/material.dart';
import 'package:flutter_qyyim/testdemo/wann/model/article.dart';
import 'package:flutter_qyyim/testdemo/wann/model/tree.dart';
import 'package:flutter_qyyim/ui/image_view.dart';

class ArticleItemWidget extends StatefulWidget {

  Article article;
  ArticleItemWidget(this.article);

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
                        child: ImageView(
                          img: widget.article.envelopePic,
                          height: 20,
                          width: 20,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(widget.article.author),
                      ),
                      Expanded(
                        child: SizedBox.shrink(),
                      ),
                      Text(widget.article.niceDate)
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(widget.article.desc),
                      ),
                      ImageView(
                        img: widget.article.envelopePic,
                        height: 60,
                        width: 60,
                      )
                    ],
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
            child: Icon(Icons.favorite, color: Colors.redAccent[100]))
      ],
    );
  }
}
