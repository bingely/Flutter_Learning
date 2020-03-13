import 'package:flutter_qyyim/common/service/wanandroid_service.dart';
import 'package:flutter_qyyim/common/view_state_model.dart';
import 'package:flutter_qyyim/testdemo/wann/model/article.dart';
import 'package:flutter_qyyim/testdemo/wann/model/tree.dart';

class StructureListModel extends ViewStateModel {
  List<Article> list = [];

  inidata(int index, int cid) async {
    List<Article> fetchTreeCategories =
        await WanAndroidRepository.fetchArticles(index, cid: cid);
    if (fetchTreeCategories.isEmpty) {
      // 空视图
      setEmpty();
    } else {
      list.clear();
      list.addAll(fetchTreeCategories);
      setIdle();
    }
  }
}
