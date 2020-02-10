import 'package:flutter/material.dart';

class TextFieldPage extends StatefulWidget {
  @override
  TextFieldPageState createState() => new TextFieldPageState();
}

class TextFieldPageState extends State<TextFieldPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('textfield'),
      ),
      body: Column(
        children: <Widget>[
          TextField(

          )
        ],
      ),
    );
  }
 
}
