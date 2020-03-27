import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 设置没有高度的 appbar，目的是为了设置状态栏的颜色
      appBar: PreferredSize(
        child: AppBar(
          elevation: 0,
        ),
        preferredSize: Size.zero,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            Padding(
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 150),
                        child: TabBar(
                          labelStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          unselectedLabelStyle: TextStyle(fontSize: 14),
                          indicator: UnderlineTabIndicator(),
                          controller: _tabController,
                          tabs: [
                            Tab(
                              text: '发现',
                            ),
                            Tab(
                              text: '我的',
                            ),
                            Tab(
                              text: '动态',
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 20,
                        child: IconButton(
                          icon: Icon(
                            Icons.search,
                            size: 50,
                            color: Colors.black87,
                          ),
                          onPressed: () {
                          },
                        ),
                      ),
                    ],
                  ),
                  /*Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        DiscoverPage(),
                        MyPage(),
                        EventPage(),
                      ],
                    ),
                  ),*/
                ],
              ), padding: EdgeInsets.only(bottom: 80),
            ),
          ],
        ),
      ),
    );
  }
}
