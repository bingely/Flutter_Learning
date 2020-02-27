import 'dart:async';

import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => new _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  Timer _timer;
  int _start = 0;

  void startTimer(){
    Timer.periodic(Duration(seconds: 1), (timer){
      if (mounted) {
        setState(() {
          _start = _start + 1;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.yellow
      ),
      child: Row(
        children: <Widget>[
          Text(
            "$_start",
            style: TextStyle(
              color: Colors.white
            ),
          )
        ],
      ),
    );
  }


}
