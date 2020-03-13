import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_qyyim/tool/toast.dart';
import 'package:qr_flutter/qr_flutter.dart';

///https://blog.csdn.net/weixin_42215775/article/details/101061254
class QrPage extends StatefulWidget {
  @override
  _QrPageState createState() => new _QrPageState();
}

class _QrPageState extends State<QrPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('qr_demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            QrImage(
              data: 'This is a simple QR code',
              version: QrVersions.auto,
              size: 320,
              gapless: false,
            ),
            RaisedButton(
              onPressed: () {
                scan();
              },
              child: Text('扫描二维码'),
            )
          ],
        ),
      ),
    );
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      print('扫码结果：' + barcode);
      Toast.show('扫码结果：' + barcode, context);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        print('未授予APP相机权限');
      } else {
        print('扫码错误：$e');
      }
    } on FormatException {
      print('进入扫码页面后未扫码就返回');
    } catch (e) {
      print('扫码错误：$e');
    }
  }
}
