import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/provider/provider_widget.dart';
import 'package:flutter_qyyim/testdemo/wann/view_model/structure_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'article_list_item.dart';

class ArticleListPage extends StatefulWidget {
  int cid;

  ArticleListPage(this.cid);

  @override
  _ArticleListPageState createState() => new _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleListPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<StructureListModel>(
      model: StructureListModel(widget.cid),
      onModelReady: (model) => model.initData(),
      builder: (context, model, child) {
        return SmartRefresher(
          header: WaterDropHeader(),
          footer: ClassicFooter(),
          controller: model.refreshController,
          onRefresh: model.refresh,
          onLoading: model.loadMore,
          enablePullUp: true,
          child: ListView.builder(
              itemCount: model.list.length,
              itemBuilder: (context, index) {
                return ArticleItemWidget(model.list[index]);
              }),
        );
      },
    );
  }
}
