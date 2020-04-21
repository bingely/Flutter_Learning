import 'package:flutter/material.dart';

class FuturePage extends StatefulWidget {
  @override
  FuturePageState createState() => new FuturePageState();
}

class FuturePageState extends State<FuturePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<String>(
        future: netWorkdata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              // 请求失败，显示错误
              return Text("Error: ${snapshot.error}");
            } else {
              // 请求成功，显示数据
              return Text("Contents: ${snapshot.data}");
            }
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Future<String> netWorkdata() async {
    return Future.delayed(Duration(seconds: 2), () => "hello");
  }
}



