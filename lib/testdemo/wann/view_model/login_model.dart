import 'package:flutter_qyyim/common/service/wanandroid_service.dart';
import 'package:flutter_qyyim/common/view_state_model.dart';
import 'package:flutter_qyyim/testdemo/wann/view_model/user_model.dart';

class LoginModel extends ViewStateModel {

  UserModel userModel;


  // 登陆、退出
  Future<bool> login(loginName, password) async{
    //setBusy();
    return false;
  }
}
