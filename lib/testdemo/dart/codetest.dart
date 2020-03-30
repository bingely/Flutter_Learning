import 'package:flutter_qyyim/tool/timeline_util.dart';

main() {
  /**  ----------------TimelineUtil----------------  */
  DateTime xxxDateTime = DateTime(2018, 10, 3, 16, 16, 16);
  print("Timeline: " +
      TimelineUtil.formatByDateTime(xxxDateTime, locale: 'zh').toString());
}
