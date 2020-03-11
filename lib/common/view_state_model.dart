import 'package:flutter/material.dart';
import 'package:flutter_qyyim/provider/view_state.dart';

/// ChangeNotifier基类，防止有特殊变化
class ViewStateModel with ChangeNotifier{

  ///
  bool _disposed = false;

  ///
  ViewState _viewState;


}
