import 'package:flutter/material.dart';

// 启动页
class LoadPage extends StatefulWidget {
  @override
  LoadPageState createState() {
    return LoadPageState();
  }
}

class LoadPageState extends State<LoadPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      Navigator.pushReplacementNamed(context, 'app');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Image.asset("images/loading.jpeg", fit: BoxFit.cover)
        ],
      ),
    );
  }
}