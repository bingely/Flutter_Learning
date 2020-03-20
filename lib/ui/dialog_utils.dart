import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 根据showDialog<T> boolean标志点击的是哪个区域按钮
/// 自定义视图 TODO
class DialogUtils {


  /// dialogType = 1 为ios CupertinoAlertDialog
  static Future<bool> showAlert(BuildContext context, String title,
      {String negativeText = '取消',
      String positiveText = '确定',
      String mainTile = "温馨提示",
      bool onlyPositive = false,
      int dialogType = 1}) {

    _showAlert<bool>(
        context: context,
        child: dialogType == 1
            ? CupertinoAlertDialog(
                title: Text(title),
                actions: _buildAlertActions(
                    context, onlyPositive, negativeText, positiveText),
              )
            : AlertDialog(
                title: Text(mainTile),
                content: Text(title),
                actions: <Widget>[
                  FlatButton(
                    child: Text(negativeText),
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                  FlatButton(
                    child: Text(positiveText),
                    onPressed: () => Navigator.of(context).pop(true),
                  ),
                ],
              ));
  }

  static showLoadingDialog(BuildContext context) {
    LoadingDialog().show(context);
  }

//static dimissLoadingDialog()

}

Future _showLoadingDialog(BuildContext c, LoadingDialog loading,
        {bool cancelable = true}) =>
    showDialog(
        context: c,
        barrierDismissible: cancelable,
        builder: (BuildContext c) => loading);

/// 加载框
class LoadingDialog extends CupertinoAlertDialog {
  BuildContext parentContext;
  BuildContext currentContext;
  bool showing;

  show(BuildContext context) {
    parentContext = context;
    showing = true;
    _showLoadingDialog(context, this).then((_) {
      showing = false;
    });
  }

  hide() {
    if (showing) {
      Navigator.removeRoute(parentContext, ModalRoute.of(currentContext));
    }
  }

  @override
  Widget build(BuildContext context) {
    currentContext = context;
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Center(
            child: Container(
              width: 120,
              height: 120,
              child: CupertinoPopupSurface(
                child: Semantics(
                  namesRoute: true,
                  scopesRoute: true,
                  explicitChildNodes: true,
                  child: const Center(
                    child: CupertinoActivityIndicator(),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Future<T> _showAlert<T>({BuildContext context, Widget child}) => showDialog<T>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => child,
    );

List<Widget> _buildAlertActions(BuildContext context, bool onlyPositive,
    String negativeText, String positiveText) {
  if (onlyPositive) {
    return [
      CupertinoDialogAction(
        child: Text(
          positiveText,
          style: TextStyle(fontSize: 18.0),
        ),
        isDefaultAction: true,
        onPressed: () {
          Navigator.pop(context, true);
        },
      ),
    ];
  } else {
    return [
      CupertinoDialogAction(
        child: Text(
          negativeText,
          style: TextStyle(color: Color(0xFF71747E), fontSize: 18.0),
        ),
        isDestructiveAction: true,
        onPressed: () {
          Navigator.pop(context, false);
        },
      ),
      CupertinoDialogAction(
        child: Text(
          positiveText,
          style: TextStyle(fontSize: 18.0),
        ),
        isDefaultAction: true,
        onPressed: () {
          Navigator.pop(context, true);
        },
      ),
    ];
  }
}
