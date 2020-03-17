import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/provider/view_state_list_model.dart';
import 'package:flutter_qyyim/common/service/wanandroid_service.dart';
import 'package:flutter_qyyim/common/provider/view_state_model.dart';
import 'package:flutter_qyyim/testdemo/wann/model/tree.dart';
import 'package:flutter_qyyim/ui/toast.dart';

class ProjectCategoryModel extends ViewStateListModel<Tree> {

  @override
  Future<List<Tree>> loadData() {
    return WanAndroidRepository.fetchProjectCategories();
  }
}
