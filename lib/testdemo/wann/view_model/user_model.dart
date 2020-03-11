import 'package:flutter_qyyim/testdemo/provider/change_notifier.dart';
import 'package:flutter_qyyim/testdemo/wann/model/user.dart';

class UserModel extends ChangeNotifier {

  User _user;

  User get user => _user;

  set user(User value) {
    _user = value;
  }
}