import 'package:flutter/material.dart';

const INDEX_BAR_WORDS = [
  "↑",
  "☆",
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "L",
  "M",
  "N",
  "O",
  "P",
  "Q",
  "R",
  "S",
  "T",
  "U",
  "V",
  "W",
  "X",
  "Y",
  "Z",
  "#"
];

class ContactsDemo extends StatefulWidget {
  @override
  _ContactsDemoState createState() => new _ContactsDemoState();
}

class _ContactsDemoState extends State<ContactsDemo> {
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
    /*children: List.generate(INDEX_BAR_WORDS.length, (index) {
      Text(INDEX_BAR_WORDS[index]);
    }).toList(),*/

    List<Widget> body = [
      ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Text('hello');
          }),
      Positioned(
        right: 0,
        top: 0,
        bottom: 0,
        child: Column(
//          children: INDEX_BAR_WORDS.map((word) {
//            return Expanded(
//              child: Text(word),
//            );
//          }).toList(),
          children: List.generate(INDEX_BAR_WORDS.length,
                  (index) => Text(INDEX_BAR_WORDS[index])),
        ),
      )
    ];
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('contactdemo'),
      ),
      body: Stack(
        children: body,
      ),
    );
  }
}
