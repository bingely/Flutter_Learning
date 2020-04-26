
import 'package:flutter/material.dart';

import 'package:flutter_qyyim/common/res/styles.dart';

import 'base_dialog.dart';

class ExitDialog extends StatefulWidget {

  ExitDialog({
    Key key,
  }) : super(key : key);

  @override
  _ExitDialog createState() => _ExitDialog();
  
}

class _ExitDialog extends State<ExitDialog> {

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: '提示',
      child: const Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: const Text('您确定要清空聊天记录吗？', style: TextStyles.textSize16),
      ),
      onPressed: () {
        //NavigatorUtils.push(context, LoginRouter.loginPage, clearStack: true);
      },
    );
  }
}



/*
class ExitDialog extends StatelessWidget {
  String dialogTitle;
  String dialogDes = "";

  ExitDialog(this.dialogDes,{
    Key key,
    this.dialogTitle,
  }) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: '提示',
      child: const Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child:  Text("dd$dialogDes", style: TextStyles.textSize16),
      ),
      onPressed: () {
        //NavigatorUtils.push(context, LoginRouter.loginPage, clearStack: true);
      },
    );
  }
}*/
