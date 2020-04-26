
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/res/dimens.dart';
import 'package:flutter_qyyim/common/res/gaps.dart';
import 'package:flutter_qyyim/tool/navigator_util.dart';

import '../image_view.dart';
import 'base_dialog.dart';


/// design/3订单/index.html#artboard5
class OrderPayTypeDialog extends StatefulWidget {

  OrderPayTypeDialog({
    Key key,
    this.onPressed,
  }) : super(key : key);

  final Function(int, String) onPressed;
  
  @override
  _PayTypeDialog createState() => _PayTypeDialog();
  
}

class _PayTypeDialog extends State<OrderPayTypeDialog> {

  int _value = 0;
  var _list = ['未收款', '支付宝', '微信', '现金'];

  Widget _buildItem(int index) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        child: SizedBox(
          height: 42.0,
          child: Row(
            children: <Widget>[
              Gaps.hGap16,
              Expanded(
                child: Text(
                  _list[index],
                  style: _value == index ? TextStyle(
                    fontSize: Dimens.font_sp14,
                    color: Theme.of(context).primaryColor,
                  ) : null,
                ),
              ),
              Visibility(
                visible: _value == index,
                child: const LoadAssetImage('order/ic_check', width: 16.0, height: 16.0)),
              Gaps.hGap16,
            ],
          ),
        ),
        onTap: () {
          if (mounted) {
            setState(() {
              _value = index;
            });
          }
        },
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: '收款方式',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: List.generate(_list.length, (i) => _buildItem(i))
      ),
      onPressed: () {
        NavigatorUtil.goBack(context);
        widget.onPressed(_value, _list[_value]);
      },
    );
  }
}