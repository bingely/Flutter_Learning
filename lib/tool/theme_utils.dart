
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_qyyim/config/app.dart';

class ThemeUtils {

  static bool isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Color getDarkColor(BuildContext context, Color darkColor) {
    return isDark(context) ? darkColor : null;
  }

  static Color getIconColor(BuildContext context) {
    return isDark(context) ? AppColors.dark_text : null;
  }
  
  static Color getBackgroundColor(BuildContext context) {
    return Theme.of(context).scaffoldBackgroundColor;
  }

  static Color getDialogBackgroundColor(BuildContext context) {
    return Theme.of(context).canvasColor;
  }
  
  static Color getStickyHeaderColor(BuildContext context) {
    return isDark(context) ? AppColors.dark_bg_gray_ : AppColors.bg_gray_;
  }

  static Color getDialogTextFieldColor(BuildContext context) {
    return isDark(context) ? AppColors.dark_bg_gray_ : AppColors.bg_gray;
  }

  static Color getKeyboardActionsColor(BuildContext context) {
    return isDark(context) ? AppColors.dark_bg_color : Colors.grey[200];
  }
}