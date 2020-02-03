import 'package:flutter/material.dart';

// 启动页
class LoadPage extends StatefulWidget{
  @override
  LoadPageState createState() {
    // TODO: implement createState
    return LoadPageState();
  }
}

class LoadPageState extends State<LoadPage>
{
  
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushNamed(context, 'msglist');
    });
    
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Stack(
        children: <Widget>[
          Image.asset("images/loading.jpeg", fit: BoxFit.cover)

        ],
      ),
    );
  }
  
}