import 'package:flutter/material.dart';

class FuturePage extends StatefulWidget {
  @override
  FuturePageState createState() => new FuturePageState();
}

class FuturePageState extends State<FuturePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        builder: Future.delayed(Duration(seconds: 3),()=>{}),
      ),
    );
  }

}