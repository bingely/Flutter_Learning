import 'package:flutter/material.dart';
import 'package:flutter_qyyim/testdemo/trip/widget/search_bar.dart';

class TravelHomePageDemo extends StatefulWidget {
  @override
  _TravelHomePageDemoState createState() => new _TravelHomePageDemoState();
}

class _TravelHomePageDemoState extends State<TravelHomePageDemo> {
  var appBarAlpha;

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
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
              context: context,
              child: Container(
                color: Colors.white,
              )),
          appBar()
        ],
      ));
  }

  Widget appBar() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0x66000000), Colors.transparent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
        height: 80.0,
        decoration: BoxDecoration(
          color: Color.fromARGB((appBarAlpha * 255).toInt(), 255, 255, 255),
        ),
        child: Row(
          children: <Widget>[
            Text('b'),
            Expanded(
              child: Text('a'),
            )
          ],
        ),
      ),
    );
  }
}
