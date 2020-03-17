import 'package:flutter_qyyim/common/provider/view_state_model.dart';
import 'package:flutter_qyyim/testdemo/provider/change_notifier.dart';
import 'package:flutter_qyyim/testdemo/wann/model/user.dart';

class UserModel extends ViewStateModel {

  User _user;

  User get user => _user;

  set user(User value) {
    _user = value;
  }

  void saveUser(User user) {
    _user = user;
    notifyListeners();
    // 保存数据库 TODO

  }



}