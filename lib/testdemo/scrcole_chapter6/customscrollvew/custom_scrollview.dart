import 'package:flutter/material.dart';
import 'package:flutter_qyyim/testdemo/scrcole_chapter6/customscrollvew/sliver_customhead.dart';
import 'package:flutter_qyyim/testdemo/scrcole_chapter6/customscrollvew/sticky_tabbar.dart';
import 'package:flutter_qyyim/ui/commom_button.dart';

class CustomScrollViewTestRoute extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<CustomScrollViewTestRoute>  with SingleTickerProviderStateMixin{
  TabController tabController;

  @override
  void initState() {
    super.initState();
    this.tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //因为本路由没有使用Scaffold，为了让子级Widget(如Text)使用
    //Material Design 默认的样式风格,我们使用Material作为本路由的根。
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          //AppBar，包含一个导航栏
          /*SliverAppBar(
            snap: true,
            floating: true,
            pinned: true,
            expandedHeight: 250.0,
            actions: <Widget>[IconButton(icon: Icon(Icons.shopping_cart))],
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Demo'),
              background: Image.asset(
                "assets/images/tabbar_contacts_c.webp",
                fit: BoxFit.cover,
              ),
            ),
          ),*/

          /*SliverPersistentHeader(
            pinned: true,
            delegate: StickyTabBarDelegate(
              child: TabBar(
                labelColor: Colors.black,
                controller: this.tabController,
                tabs: <Widget>[
                  Tab(text: 'Home'),
                  Tab(text: 'Profile'),
                ],
              ),
            ),
          ),*/




          /*SliverFillRemaining(
            child: TabBarView(
              controller: this.tabController,
              children: <Widget>[
                Center(child: Text('Content of Home')),
                Center(child: Text('Content of Profile')),
              ],
            ),
          ),*/


          SliverPersistentHeader(
            pinned: true,
            delegate: SliverCustomHeaderDelegate(
                title: '哪吒之魔童降世',
                collapsedHeight: 310,
                expandedHeight: 500,
                paddingTop: MediaQuery.of(context).padding.top,
                coverImgUrl: 'https://img.zcool.cn/community/01c6615d3ae047a8012187f447cfef.jpg@1280w_1l_2o_100sh.jpg'
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: new SliverGrid(
              //Grid
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //Grid按两列显示
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  //创建子widget
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: new Text('grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
          //List
          new SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              //创建列表项
              return new Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: new Text('list item $index'),
              );
            }, childCount: 50 //50个列表项
                ),
          ),
        ],
      ),
    );
  }
}
