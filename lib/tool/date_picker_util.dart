
import 'package:flutter/material.dart';
/// 用于日期选择
class DatePickerUtil {

  // 日期选择，原生方法，在中间弹窗
  static Future<DateTime> showDataPicker(BuildContext context) async {
    Locale myLocale = Localizations.localeOf(context);
    return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2016),
        lastDate: DateTime(2119),
        locale: myLocale);
  }


}
