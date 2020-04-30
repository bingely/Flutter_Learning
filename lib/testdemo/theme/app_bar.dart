
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_qyyim/common/res/colors.dart';
import 'package:flutter_qyyim/common/res/dimens.dart';
import 'package:flutter_qyyim/common/res/gaps.dart';
import 'package:flutter_qyyim/tool/theme_utils.dart';

/// 自定义AppBar
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {

  const MyAppBar({
    Key key,
    this.backgroundColor,
    this.title: '',
    this.centerTitle: '',
    this.actionName: '',
    this.backImg: 'assets/images/wechat_locate.png',
    this.onPressed,
    this.isBack: true
  }): super(key: key);

  final Color backgroundColor;
  final String title;
  final String centerTitle;
  final String backImg;
  final String actionName;
  final VoidCallback onPressed;
  final bool isBack;

  @override
  Widget build(BuildContext context) {
    Color _backgroundColor;

    if (backgroundColor == null) {
      _backgroundColor = ThemeUtils.getBackgroundColor(context);
    } else {
      _backgroundColor = backgroundColor;
    }

    SystemUiOverlayStyle _overlayStyle = ThemeData.estimateBrightnessForColor(_backgroundColor) == Brightness.dark
        ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark;

    var back = isBack ? IconButton(
      onPressed: () {
        FocusScope.of(context).unfocus();
        Navigator.maybePop(context);
      },
      tooltip: 'Back',
      padding: const EdgeInsets.all(12.0),
      icon: Image.asset(
        backImg,
        color: ThemeUtils.getIconColor(context),
      ),
    ) : Gaps.empty;

    var action = actionName.isNotEmpty ? Positioned(
      right: 0.0,
      child: Theme(
        data: Theme.of(context).copyWith(
            buttonTheme: ButtonThemeData(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              minWidth: 60.0,
            )
        ),
        child: FlatButton(
          child: Text(actionName, key: const Key('actionName')),
          textColor: ThemeUtils.isDark(context) ? Colours.dark_text : Colours.text,
          highlightColor: Colors.transparent,
          onPressed: onPressed,
        ),
      ),
    ) : Gaps.empty;

    return Material(
      child: SafeArea(
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Semantics(
              namesRoute: true,
              header: true,
              child: Container(
                alignment: centerTitle.isEmpty ? Alignment.centerLeft : Alignment.center,
                width: double.infinity,
                child: Text(
                  title.isEmpty ? centerTitle : title,
                  style: TextStyle(fontSize: Dimens.font_sp18,)
                ),
                margin: const EdgeInsets.symmetric(horizontal: 48.0),
              ),
            ),
            back,
            action,
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(48.0);
}
