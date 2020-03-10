import 'package:connectivity/connectivity.dart';


/// 对connectivity https://pub.dev/packages/connectivity#-readme-tab-
/// 封装
class NetUtil{

  checkCurrentNetStatus() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
    }
  }

  /// 判断是否联网
  static Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }
}