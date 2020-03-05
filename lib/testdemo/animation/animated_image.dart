import 'package:flutter/material.dart';

class AnimatedImage extends AnimatedWidget{
  AnimatedImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: Image.asset("images/contact_list_normal.png",
          width: animation.value,
          height: animation.value
      ),
    );
  }

}
