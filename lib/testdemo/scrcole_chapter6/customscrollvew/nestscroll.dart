import 'package:flutter/material.dart' hide NestedScrollView;
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';

class ActPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ActState();
  }
}

class ActState extends State<ActPage> with SingleTickerProviderStateMixin {
  List<Choice> tabs = [];
  TabController mTabController;
  int mCurrentPosition = 0;

  @override
  Widget build(BuildContext context) {

    final double statusBarHeight = MediaQuery.of(context).padding.top;
    var pinnedHeaderHeight =
    //statusBar height
    statusBarHeight*8 +
        //pinned SliverAppBar height in header
        kToolbarHeight;
    return new Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, bool) => _headerSliverBuilder(),
        body: _tabBarView(),
        pinnedHeaderSliverHeightBuilder: (){
          return pinnedHeaderHeight;
        },
      ),
    );
  }

  List<Widget> _headerSliverBuilder() {
    return [
      new SliverAppBar(
        pinned: true,
        expandedHeight: 620.0,
        bottom: PreferredSize(
            child: new Container(
              color: Colors.white,
              child: new TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.green,
                labelColor: Colors.green,
                unselectedLabelColor: Colors.black45,
                tabs: tabs.map((Choice choice) {
                  return new Tab(
                    text: choice.title,
                    icon: new Icon(
                      choice.icon,
                    ),
                  );
                }).toList(),
                controller: mTabController,
              ),
            ),
            preferredSize: new Size(double.infinity, 18.0)),
        flexibleSpace: new Container(
          child: new Column(
            children: <Widget>[
              new Expanded(
                child: new Container(
                  child: Image.asset(
                    "images/temp2.jpg",
                    fit: BoxFit.cover,
                  ),
                  width: double.infinity,
                ),
              )
            ],
          ),
        ),
      )
    ];
  }

  Widget _tabBarView() {
    return new TabBarView(
      children: tabs.map((Choice choice) {
        return new Padding(
            padding: const EdgeInsets.all(15.0),
            child: choice.position == 0
                ? new Container(
                    child: new ListView(
                    children: <Widget>[
                      new ListTile(
                        leading: new Icon(Icons.map),
                        title: new Text('Map'),
                      ),
                      new ListTile(
                        leading: new Icon(Icons.photo),
                        title: new Text('Album'),
                      ),
                      new ListTile(
                        leading: new Icon(Icons.phone),
                        title: new Text('Phone'),
                      ),
                      new ListTile(
                        leading: new Icon(Icons.map),
                        title: new Text('Map'),
                      ),
                      new ListTile(
                        leading: new Icon(Icons.photo),
                        title: new Text('Album'),
                      ),
                      new ListTile(
                        leading: new Icon(Icons.phone),
                        title: new Text('Phone'),
                      ),
                    ],
                  ))
                : new Container(
                    child: new Text("ahhhhhhhhhhhhh"),
                  ));
      }).toList(),
      controller: mTabController,
    );
  }

  @override
  void initState() {
    super.initState();
    tabs.add(Choice(title: '热门', icon: Icons.hot_tub, position: 0));
    tabs.add(Choice(title: '最新', icon: Icons.fiber_new, position: 1));
    mTabController = new TabController(vsync: this, length: tabs.length);
    //判断TabBar是否切换
    mTabController.addListener(() {
      if (mTabController.indexIsChanging) {
        setState(() {
          mCurrentPosition = mTabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    mTabController.dispose();
  }
}

class Choice {
  const Choice({this.title, this.icon, this.position});

  final String title;
  final int position;
  final IconData icon;
}
