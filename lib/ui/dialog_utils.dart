import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/config/app.dart';
import 'package:flutter_qyyim/tool/toast_util.dart';
import 'package:flutter_qyyim/ui/dialog/pay_type_dialog.dart';
import 'package:flutter_qyyim/tool/device_utils.dart';
import 'package:flutter_qyyim/ui/ui.dart';

import 'dialog/action_sheet.dart';
import 'dialog/order_pay_type_dialog.dart';

/// 根据showDialog<T> boolean标志点击的是哪个区域按钮
/// 自定义视图 已做
class DialogUtils {
  /// 中间的对话框（默认是ios风格）
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


  /// 自定义中间位置的对话框
  /// DialogUtils.showDialogView(context, ExitDialog());
  static showDialogView(BuildContext context,Widget widget){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return widget;
        }
    );
  }


  static Future<T> showElasticDialog<T>({
    @required BuildContext context,
    bool barrierDismissible = true,
    WidgetBuilder builder,
  }) {

    final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
        final Widget pageChild = Builder(builder: builder);
        return SafeArea(
          child: Builder(
              builder: (BuildContext context) {
                return theme != null
                    ? Theme(data: theme, child: pageChild)
                    : pageChild;
              }
          ),
        );
      },
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 550),
      transitionBuilder: _buildDialogTransitions,
    );
  }



  /// 加载圈
  static showLoadingDialog(BuildContext context) {
    LoadingDialog().show(context);
  }

//static dimissLoadingDialog()

  /// 底部弹出的
  /// 如何设置固定高度
  /// 普通用法出现占比的控件是
  static showModalBottomSheetDialog(
    BuildContext context, {
    Key key,
    Widget title,
    Widget message,
    List<Widget> actions,
    ScrollController messageScrollController,
    ScrollController actionScrollController,
    Widget cancelButton,
  }) {
    // 第一种实现方案 有些bug
   /* showModalBottomSheet(
        context: context,
        builder: (context) {
          return new ListTile(
            leading: new Icon(Icons.photo_camera),
            title: new Text("Camera"),
            onTap: () async {
              Navigator.pop(context);
            },
          );
        });*/

    // 第二种实现方案
    ActionSheet.show(
      context,
      actions: actions,
      cancelButton: cancelButton,
    );
  }
}

/// 通过FractionallySize控制比例高度
showBt(BuildContext context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.5,
          child: BigListViewWidget(),
        );
      });
}

Widget BigListViewWidget() {
  return ListView.builder(
    itemBuilder: (context, int) {
      return Text('$int');
    },
    itemCount: 30,
  );
}

shoCam(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new ListTile(
              leading: new Icon(Icons.photo_camera),
              title: new Text("Camera"),
              onTap: () async {
                Navigator.pop(context);
              },
            ),
            new ListTile(
              leading: new Icon(Icons.photo_library),
              title: new Text("Gallery"),
              onTap: () async {
                Navigator.pop(context);
              },
            ),
            new ListTile(
              leading: new Icon(Icons.photo_camera),
              title: new Text("Camera"),
              onTap: () async {
                Navigator.pop(context);
              },
            ),
            new ListTile(
              leading: new Icon(Icons.photo_library),
              title: new Text("Gallery"),
              onTap: () async {
                Navigator.pop(context);
              },
            ),
            new ListTile(
              leading: new Icon(Icons.photo_camera),
              title: new Text("Camera"),
              onTap: () async {
                Navigator.pop(context);
              },
            ),
            new ListTile(
              leading: new Icon(Icons.photo_library),
              title: new Text("Gallery"),
              onTap: () async {
                Navigator.pop(context);
              },
            ),
            new ListTile(
              leading: new Icon(Icons.photo_camera),
              title: new Text("Camera"),
              onTap: () async {
                Navigator.pop(context);
              },
            ),
            new ListTile(
              leading: new Icon(Icons.photo_library),
              title: new Text("Gallery"),
              onTap: () async {
                Navigator.pop(context);
              },
            ),
            new ListTile(
              leading: new Icon(Icons.photo_camera),
              title: new Text("Camera"),
              onTap: () async {
                Navigator.pop(context);
              },
            ),
            new ListTile(
              leading: new Icon(Icons.photo_library),
              title: new Text("Gallery"),
              onTap: () async {
                Navigator.pop(context);
              },
            ),
            new ListTile(
              leading: new Icon(Icons.photo_camera),
              title: new Text("Camera"),
              onTap: () async {
                Navigator.pop(context);
              },
            ),
            new ListTile(
              leading: new Icon(Icons.photo_library),
              title: new Text("Gallery"),
              onTap: () async {
                Navigator.pop(context);
              },
            ),
          ],
        );
      });
}

codeDialog(BuildContext context) {
  Widget item(item) {
    return new Container(
      width: DeviceUtils.winWidth(context),
      decoration: BoxDecoration(
        border: item != '重置二维码'
            ? Border(
                bottom: BorderSide(color: AppColors.lineColor, width: 0.2),
              )
            : null,
      ),
      child: new FlatButton(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 15.0),
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: new Text(item),
      ),
    );
  }

  showModalBottomSheet(
    context: context,
    builder: (context) {
      List data = ['换个样式', '保存到手机', '扫描二维码', '重置二维码'];
      return new Material(
        type: MaterialType.transparency,
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              child: new Container(
                color: Colors.white,
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Column(children: data.map(item).toList()),
                    new HorizontalLine(
                        color: AppColors.appBarColor, height: 10.0),
                    new FlatButton(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      color: Colors.white,
                      onPressed: () => Navigator.of(context).pop(),
                      child: new Container(
                        width: DeviceUtils.winWidth(context),
                        alignment: Alignment.center,
                        child: new Text('取消'),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    },
  );
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




Widget _buildDialogTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
  return FadeTransition(
    opacity: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    ),
    child: SlideTransition(
      position: Tween<Offset>(
          begin: const Offset(0.0, 0.3),
          end: Offset.zero
      ).animate(CurvedAnimation(
        parent: animation,
        curve: animation.status != AnimationStatus.forward ? Curves.easeOutBack: ElasticOutCurve(0.85),
      )),
      child: child,
    ),
  );
}