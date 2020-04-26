
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/res/gaps.dart';
import 'package:flutter_qyyim/tool/navigator_util.dart';
import 'package:flutter_qyyim/tool/toast_util.dart';
import 'package:flutter_qyyim/ui/dialog/base_dialog.dart';
import 'package:flutter_qyyim/ui/image_view.dart';



/// design/7店铺-店铺配置/index.html#artboard10
class PayTypeDialog extends StatefulWidget {

  PayTypeDialog({
    Key key,
    this.value,
    this.onPressed,
  }) : super(key : key);

  final List<int> value;
  final Function(List) onPressed;
  
  @override
  _PayTypeDialog createState() => _PayTypeDialog();
  
}

class _PayTypeDialog extends State<PayTypeDialog> {

  List _selectValue;
  var _list = ['线上支付', '对公转账', '货到付款'];

  Widget _buildItem(int index) {
    _selectValue = widget.value ?? [0];
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        child: SizedBox(
          height: 42.0,
          child: Row(
            children: <Widget>[
              Gaps.hGap16,
              Expanded(
                child: Text(_list[index]),
              ),
              LoadAssetImage(_selectValue.contains(index) ? 'shop/xz' : 'shop/xztm', width: 16.0, height: 16.0),
              Gaps.hGap16,
            ],
          ),
        ),
        onTap: () {
          if (mounted) {
            if (index == 0) {
              ToastUtils.show('线上支付为必选项',context);
              return;
            }
            setState(() {
              if (_selectValue.contains(index)) {
                _selectValue.remove(index);
              } else {
                _selectValue.add(index);
              }
            });
          }
        },
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: '支付方式(多选)',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: List.generate(_list.length, (i) => _buildItem(i))
      ),
      onPressed: () {
        NavigatorUtil.goBack(context);
        widget.onPressed(_selectValue);
      },
    );
  }
}