import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/base/provider_widget.dart';
import 'package:flutter_qyyim/testdemo/wann/view_model/structure_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'article_list_item.dart';

class ArticleListPage extends StatefulWidget {
  int cid;
  ArticleListPage(this.cid);

  @override
  _ArticleListPageState createState() => new _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleListPage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<StructureListModel>(
      model: StructureListModel(),
      onModelReady: (modlue) => modlue.inidata(0, widget.cid),
      builder: (context, modlel, child) {
        return SmartRefresher(
          header: WaterDropHeader(),
          footer: ClassicFooter(),
          controller: _refreshController,
          child: ListView.builder(
              itemCount: modlel.list.length,
              itemBuilder: (context, index) {
                return ArticleItemWidget(modlel.list[index]);
              }),
        );
      },
    );
  }
}
