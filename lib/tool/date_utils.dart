import 'package:date_format/date_format.dart';


/// https://blog.csdn.net/ruoshui_t/article/details/93072017
//命名构造，获取当前时间
//millisecondsSinceEpoch
//
//DateTime转时间戳
//
//fromMillisecondsSinceEpoch
//
//时间戳转DateTime
//parse(string)
//
//字符串转DateTime
//
//isBefore(date)
//
//时间比较---在之前
//
//isAfter(date)
//
//时间比较---在之后
//
//isAtSameMomentAs(date)
//
//时间比较---相等
//
//compareTo(date)
//
//大于返回1；等于返回0；小于返回-1
//
//add(Duration)
//
//时间增加
//subtract(Duration)
//
//时间减少
//
//difference(date)
//
//时间差 两个时间相差 小时数
//
//timeZoneName
//
//本地时区简码
//
//timeZoneOffset
//
//返回UTC与本地时差 小时数
//
//year、month、day、hour、minute、second、millisecond、microsecond
//
//返回   年、月、日、时、分、秒、毫秒、微妙
//weekday
//
//返回星期几
//————————————————


class DateUtils {
  static String full = "yyyy-MM-dd HH:mm:ss";

  static String formatDateV(DateTime dateTime, {bool isUtc, String format}) {
    if (dateTime == null) return "";
    format = format ?? full;
    if (format.contains("yy")) {
      String year = dateTime.year.toString();
      if (format.contains("yyyy")) {
        format = format.replaceAll("yyyy", year);
      } else {
        format = format.replaceAll(
            "yy", year.substring(year.length - 2, year.length));
      }
    }

    format = _comFormat(dateTime.month, format, 'M', 'MM');
    format = _comFormat(dateTime.day, format, 'd', 'dd');
    format = _comFormat(dateTime.hour, format, 'H', 'HH');
    format = _comFormat(dateTime.minute, format, 'm', 'mm');
    format = _comFormat(dateTime.second, format, 's', 'ss');
    format = _comFormat(dateTime.millisecond, format, 'S', 'SSS');

    return format;
  }

  static String _comFormat(
      int value, String format, String single, String full) {
    if (format.contains(single)) {
      if (format.contains(full)) {
        format =
            format.replaceAll(full, value < 10 ? '0$value' : value.toString());
      } else {
        format = format.replaceAll(single, value.toString());
      }
    }
    return format;
  }


  /// 时间格式化
  //// formatDate(message.time, [HH, ':', nn, ':', 'ss'])
  static String formateTime(DateTime dateTime, {List<String> format}) {
    return formatDate(dateTime, format);
  }

  /// 获取当前时间戳
  static int getCurrentStamp(){
    return DateTime.now().millisecondsSinceEpoch;
  }

  /// 将时间戳转换为时间
  static DateTime stampToDate(int millisecondsSinceEpoch){
    return DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  }

  /// //拼接成date  DateTime(2019, 6, 20, 17, 30,20)
  /// // 字符串转date  DateTime.parse("2019-06-20 15:32:41");
/// // 时间比较
}
