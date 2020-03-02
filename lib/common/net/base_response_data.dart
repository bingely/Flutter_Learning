/// 子类需要重写,定义了基本返回数据结构
abstract class BaseResponseData {
  int code = 0;
  String message;
  dynamic data;

  bool get success;

  BaseResponseData({this.code, this.message, this.data});

  @override
  String toString() {
    return 'BaseResponseData{code: $code, message: $message, data: $data}';
  }
}