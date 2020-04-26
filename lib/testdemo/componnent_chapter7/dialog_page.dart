import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/res/gaps.dart';
import 'package:flutter_qyyim/tool/toast_util.dart';
import 'package:flutter_qyyim/ui/dialog/exit_dialog.dart';
import 'package:flutter_qyyim/ui/dialog/order_pay_type_dialog.dart';
import 'package:flutter_qyyim/ui/dialog/pay_type_dialog.dart';
import 'package:flutter_qyyim/ui/commom_bar.dart';
import 'package:flutter_qyyim/ui/commom_button.dart';
import 'package:flutter_qyyim/ui/dialog/update_dialog.dart';
import 'package:flutter_qyyim/ui/dialog_utils.dart';

class DialogPage extends StatefulWidget {
  @override
  DialogPageState createState() => new DialogPageState();
}

class DialogPageState extends State<DialogPage> {

  var _selectValue = [0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dialog'),
      ),
      body: Column(
        children: <Widget>[
          // AlertDialog
          ComMomButton(
            text: "hhh",
            onTap: () {
              DialogUtils.showElasticDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return PayTypeDialog(
                      value: _selectValue,
                      onPressed: (value) {
                        setState(() {
                          _selectValue = value;
                        });
                      },
                    );
                  });
            },
          ),
          Gaps.hGap5,
          ComMomButton(
            text: "hhh",
            onTap: () {
              DialogUtils.showDialogView(context, OrderPayTypeDialog(
                onPressed: (index, type) {
                  ToastUtils.show('收款类型：$type', context);
                },
              ));
            },
          ),

          Gaps.hGap5,
          ComMomButton(
            text: "hhh",
            onTap: () {
              DialogUtils.showDialogView(context, ExitDialog());
            },
          ),
          Gaps.hGap5,
          ComMomButton(
            text: "hhh",
            onTap: () {
              DialogUtils.showDialogView(context,  UpdateDialog());
            },
          )
        ],
      ),
    );
  }
}
