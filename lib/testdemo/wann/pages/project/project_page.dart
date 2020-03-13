import 'package:flutter/material.dart';

import 'article_list_page.dart';

class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() => new _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> with SingleTickerProviderStateMixin{

  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 1, vsync: this);
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
      appBar: new AppBar(
        title: TabBar(
          controller: tabController,
          tabs: <Widget>[
            Tab(
              text: 'hello',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[ArticleListPage()],
      ),
    );
  }
}
