import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_qyyim/tool/win_media.dart';
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
  MyExtendedMaterialTextSelectionControls _myExtendedMaterialTextSelectionControls = MyExtendedMaterialTextSelectionControls();


  MySpecialTextSpanBuilder _mySpecialTextSpanBuilder = MySpecialTextSpanBuilder();
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
        child: new Container(
          width:
              widget.text.length > 24 ? (winWidth(context) - 66) - 100 : null,
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: widget.isMyself ? Color(0xff98E165) : Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          margin: EdgeInsets.only(right: 7.0),
          child: ExtendedText(
              widget.text,
              textAlign: TextAlign.left,
              specialTextSpanBuilder: _mySpecialTextSpanBuilder,
              onSpecialTextTap: (value) {

              }
          ),
          /*child: ExtendedTextField(
            specialTextSpanBuilder: MySpecialTextSpanBuilder(
              showAtBackground: true,
            ),
            controller: _textEditingController,
            textSelectionControls: _myExtendedMaterialTextSelectionControls,
            maxLines: null,
            focusNode: _focusNode,
            decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      //sessions.insert(0, _textEditingController.text);
                      _textEditingController.value =
                          _textEditingController.value.copyWith(
                              text: "",
                              selection: TextSelection.collapsed(offset: 0),
                              composing: TextRange.empty);
                    });
                  },
                  child: Icon(Icons.send),
                ),
                contentPadding: EdgeInsets.all(12.0)),
          ),*/
        ));
  }
}
