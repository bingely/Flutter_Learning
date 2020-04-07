import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/provider/provider_widget.dart';
import 'package:flutter_qyyim/pages/chat/map/place_view.dart';
import 'package:flutter_qyyim/testdemo/trip/widget/search_bar.dart';
import 'package:flutter_qyyim/view_model/place_view_model.dart';

class MapSearchPage extends StatefulWidget {
  @override
  _MapSearchPageState createState() => new _MapSearchPageState();
}

class _MapSearchPageState extends State<MapSearchPage> {
  PlaceViewModle placeViewmodle;

  String keyStr;

  var _textEditController = TextEditingController();

  @override
  void dispose() {
    _textEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            SearchBar(
              searchBarType: SearchBarType.normal,
              onChanged: (str) {
                keyStr = str;
              },
              leftButtonClick: () {
                Navigator.pop(context);
              },
              rightButtonClick: () {
                if (keyStr.isNotEmpty) {
                  placeViewmodle?.searchKeyWord(keyStr);
                }
              },
            ),
            ProviderWidget<PlaceViewModle>(
              model: PlaceViewModle(),
              onModelReady: (modle) async {
                placeViewmodle = modle;
              },
              builder: (context, modle, widget) {
                return Flexible(
                  child: new ListView.builder(
                    controller: ScrollController(),
                    shrinkWrap: true,
                    padding: EdgeInsets.all(8.0),
                    reverse: false,
                    itemBuilder: (context, int index) {
                      return new PlaceView(modle.places[index]);
                    },
                    itemCount: modle.places?.length,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget newSearchView() {
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.search),
          Expanded(
            child: TextField(
              controller: _textEditController,
              autofocus: true,
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
              //输入文本的样式
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 9),
                border: InputBorder.none,
                hintText: '',
                hintStyle: TextStyle(fontSize: 15),
              ),
            ),
          )
        ],
      ),
    );
  }
}
