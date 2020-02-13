import 'package:extended_text_library/extended_text_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/ui/fluttercadis/my_special_text_span_builder.dart'
    as demo;
import 'emoji_text.dart' as emoji;
import 'package:flutter_qyyim/ui/fluttercadis/emoji_text.dart' as ej;


class MySpecialTextSpanBuilder extends demo.MySpecialTextSpanBuilder {
  /// whether show background for @somebody
  final bool showAtBackground;
  MySpecialTextSpanBuilder({
    this.showAtBackground: false,
  }) : super(showAtBackground: showAtBackground);

  @override
  SpecialText createSpecialText(String flag,
      {TextStyle textStyle, SpecialTextGestureTapCallback onTap, int index}) {
    if (flag == null || flag == "") return null;

    if (isStart(flag, ej.EmojiText.flag)) {
      return emoji.EmojiText(textStyle,
          start: index - (ej.EmojiText.flag.length - 1));
    } /*else if (isStart(flag, ImageText.flag)) {
      return ImageText(textStyle,
          start: index - (ImageText.flag.length - 1), onTap: onTap);
    }*/
    return super.createSpecialText(flag,
        textStyle: textStyle, onTap: onTap, index: index);
  }
}
