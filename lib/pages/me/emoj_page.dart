import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';

import 'ImItem.dart';

class EmojPage extends StatefulWidget {
  @override
  MainPageState createState() => new MainPageState();
}

class MainPageState extends State<EmojPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EmojiPicker(
        rows: 3,
        columns: 7,
        recommendKeywords: ["racing", "horse"],
        numRecommended: 10,
        onEmojiSelected: (emoji, category) {
          print(emoji);
        },
      ),
    );
  }
}