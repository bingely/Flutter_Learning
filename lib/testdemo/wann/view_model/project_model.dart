import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/service/wanandroid_service.dart';
import 'package:flutter_qyyim/common/view_state_model.dart';
import 'package:flutter_qyyim/testdemo/wann/model/tree.dart';
import 'package:flutter_qyyim/tool/toast.dart';

class ProjectCategoryModel extends ViewStateModel {
  /// 页面数据
  List<Tree> list = [];

  /// 第一次进入页面loading skeleton
  Future<List<Tree>> initData() async {
    List<Tree> fetchProjectCategories =
        await WanAndroidRepository.fetchProjectCategories();
    if (fetchProjectCategories.isEmpty) {
      // 空视图
      debugPrint("refrsh----nothing");
      setEmpty();
    } else {
      list.clear();
      list.addAll(fetchProjectCategories);
      setIdle();
    }
    return fetchProjectCategories;
    // return await refrsh(init: true);
  }

  refrsh({bool init}) async {
    List<Tree> fetchProjectCategories =
        await WanAndroidRepository.fetchProjectCategories();
    if (fetchProjectCategories.isEmpty) {
      // 空视图
      debugPrint("refrsh----nothing");
    } else {
      list.clear();
      list.addAll(fetchProjectCategories);
    }
  }
}
