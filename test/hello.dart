import 'dart:developer' as developer;

import 'package:flutter_qyyim/tool/date_utils.dart';
import 'package:flutter_qyyim/tool/log_utils.dart';

import 'package:logging/logging.dart';

main(){
  /*var currentStamp = DateUtils.getCurrentStamp();

  print(currentStamp);

  print(DateUtils.stampToDateStr(currentStamp,format: DateUtils.fomateYYMMDDHHNNSS));

  LogUtil.d('hello');
  LogUtil.e("hh");*/

  developer.log('log me', name: 'my.app.category');

  Logger log = new Logger("main");

  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
    if(rec.error != null &&
        rec.stackTrace != null) {
      print('${rec.error}: ${rec.stackTrace}');
    }
    LogUtil.d('code');
  });

  log.config("x=5");
  log.info("对x进行赋值");
  log.warning("x是double类型");
  log.severe("网络连接失败");

  try {
    var y = 1/0;
  } catch(error, stackTrace) {
    //捕获Error及堆栈信息
    log.shout("Main.dart Line 35, var y = x/3", error, stackTrace);
  }
}