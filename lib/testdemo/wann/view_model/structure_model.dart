import 'package:flutter_qyyim/common/provider/view_state_list_model.dart';
import 'package:flutter_qyyim/common/provider/view_state_refresh_list_model.dart';
import 'package:flutter_qyyim/common/service/wanandroid_service.dart';
import 'package:flutter_qyyim/common/view_state_model.dart';
import 'package:flutter_qyyim/testdemo/wann/model/article.dart';
import 'package:flutter_qyyim/testdemo/wann/model/tree.dart';

class StructureListModel extends ViewStateRefreshListModel<Article> {
  final int cid;

  StructureListModel(this.cid);

  @override
  Future<List<Article>> loadData({int pageNum}) {
    return WanAndroidRepository.fetchArticles(pageNum, cid: cid);
  }

  @override
  onCompleted(List data) {
    //GlobalFavouriteStateModel.refresh(data);
  }
}
