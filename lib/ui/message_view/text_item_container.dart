import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_qyyim/tool/device_utils.dart';
import 'package:flutter_qyyim/ui/bubble/bubble.dart';
import 'package:flutter_qyyim/ui/bubble/bublewidget.dart';
import 'package:flutter_qyyim/ui/edit/text_span_builder.dart';
import 'package:flutter_qyyim/ui/fluttercadis/my_extended_text_selection_controls.dart';
import 'package:flutter_qyyim/ui/pop/magic_pop.dart';
import 'package:extended_text/extended_text.dart';

class TextItemContainer extends StatefulWidget {
  final String text;
  final String action;
  final bool isMyself;

  TextItemContainer({this.text, this.action, this.isMyself = true});

  @override
  _TextItemContainerState createState() => _TextItemContainerState();
}

class _TextItemContainerState extends State<TextItemContainer> {
  FocusNode _focusNode = FocusNode();

  TextEditingController _textEditingController = TextEditingController();
  MyExtendedMaterialTextSelectionControls
      _myExtendedMaterialTextSelectionControls =
      MyExtendedMaterialTextSelectionControls();

  MySpecialTextSpanBuilder _mySpecialTextSpanBuilder =
      MySpecialTextSpanBuilder();

  @override
  Widget build(BuildContext context) {
    return new MagicPop(
        onValueChanged: (int value) {
          switch (value) {
            case 0:
              Clipboard.setData(new ClipboardData(text: widget.text));
              break;
            case 3:
              break;
          }
        },
        pressType: PressType.longPress,
        actions: ['复制', '转发', '收藏', '撤回', '删除'],
        child:
        FLBubble(
            from: FLBubbleFrom.right,
            backgroundColor: Color(0xff98E165),
            child: Container(
              width: widget.text.length > 24 ? (DeviceUtils.winWidth(context) - 66) - 100 : null,
              padding: EdgeInsets.all(5),
              child: ExtendedText(
                  widget.text,
                  textAlign: TextAlign.left,
                  specialTextSpanBuilder: _mySpecialTextSpanBuilder,
                  onSpecialTextTap: (value) {

                  }
              ),
            ))
    );
  }
}
