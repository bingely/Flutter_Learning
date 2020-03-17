import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 启动页
class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() {
    return SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, 'app');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          //Image.asset("images/loading.jpeg", fit: BoxFit.cover),
          Container(
            color: Colors.white,
            child: Center(
              child: Text(
                'qyyim',
                style: TextStyle(
                  color: Colors.blue,
                  inherit: false, //2.不继承默认样式
                  fontSize: 32.0
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
