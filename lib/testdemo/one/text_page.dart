import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            "Hello world",
            textAlign: TextAlign.left,
          ),

        ],
      ),
    );
  }
}
