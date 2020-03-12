import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/service/trabel_service.dart';
import 'package:flutter_qyyim/pages/trip/model/travel_tab_model.dart';
import 'package:flutter_qyyim/pages/trip/view/travel_tab_page.dart';
import 'package:underline_indicator/underline_indicator.dart';

class TravelPage extends StatefulWidget {
  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage>
    with TickerProviderStateMixin {
  TabController _controller;
  List<TravelTab> tabs = [];
  TravelTabModel travelTabModel;

  @override
  void initState() {
    _controller = TabController(length: 0, vsync: this);
    TravelResponsitory.fetchTravelTab().then((TravelTabModel model) {
      _controller = TabController(
          length: model.tabs.length, vsync: this); //fix tab label 空白问题
      setState(() {
        tabs = model.tabs;
        travelTabModel = model;
      });
    }).catchError((e) {
      print(e);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(top: 30),
              child: TabBar(
                  controller: _controller,
                  isScrollable: true,
                  labelColor: Colors.black,
                  labelPadding: EdgeInsets.fromLTRB(20, 0, 10, 5),
                  indicator: UnderlineIndicator(
                      strokeCap: StrokeCap.round,
                      borderSide: BorderSide(
                        color: Color(0xff2fcfbb),
                        width: 3,
                      ),
                      insets: EdgeInsets.only(bottom: 10)),
                  tabs: tabs.map<Tab>((TravelTab tab) {
                    return Tab(
                      text: tab.labelName,
                    );
                  }).toList()),
            ),
            Flexible(
                child: TabBarView(
                    controller: _controller,
                    children: tabs.map((TravelTab tab) {
                      return TravelTabPage(
                        travelUrl: travelTabModel.url,
                        params: travelTabModel.params,
                        groupChannelCode: tab.groupChannelCode,
                      );
                    }).toList()))
          ],
        ));
  }
}
