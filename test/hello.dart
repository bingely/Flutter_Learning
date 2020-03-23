import 'package:flutter_qyyim/tool/date_utils.dart';

main(){
  var currentStamp = DateUtils.getCurrentStamp();

  print(currentStamp);

  print(DateUtils.stampToDateStr(currentStamp,format: DateUtils.fomateYYMMDDHHNNSS));

}