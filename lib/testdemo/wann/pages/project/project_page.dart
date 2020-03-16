import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/provider/provider_widget.dart';
import 'package:flutter_qyyim/testdemo/trip/widget/loading_container.dart';
import 'package:flutter_qyyim/testdemo/wann/model/tree.dart';
import 'package:flutter_qyyim/testdemo/wann/view_model/project_model.dart';
import 'package:provider/provider.dart';

import 'article_list_page.dart';

class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() => new _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  ValueNotifier<int> valueNotifier;

  @override
  void initState() {
    valueNotifier = ValueNotifier(0);
    super.initState();
  }

  @override
  void dispose() {
    valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<ProjectCategoryModel>(
      model: ProjectCategoryModel(),
      onModelReady: (model) {
        model.initData();
      },
      builder: (context, model, child) {
        List<Tree> treeList = model.list;

        return ValueListenableProvider<int>.value(
          value: valueNotifier,
          child: DefaultTabController(
            length: model.list.length,
            initialIndex: valueNotifier.value,
            child: Builder(builder: (context) {
              if (tabController == null) {
                tabController = DefaultTabController.of(context);
                tabController.addListener(() {
                  valueNotifier.value = tabController.index;
                });
              }
              return new Scaffold(
                appBar: new AppBar(
                  title: TabBar(
                    isScrollable: true,
                    tabs: List.generate(treeList.length, (index) {
                      return Tab(
                        text: treeList[index].name,
                      );
                    }),
                  ),
                ),
                body: model.isBusy
                    ? LoadingContainer(
                        isLoading: true,
                        child: TabBarView(
                          children: List.generate(treeList.length,
                              (index) => ArticleListPage(treeList[index].id)),
                        ),
                      )
                    : TabBarView(
                        children: List.generate(treeList.length,
                            (index) => ArticleListPage(treeList[index].id)),
                      ),
              );
            }),
          ),
        );
      },
    );
  }
}
