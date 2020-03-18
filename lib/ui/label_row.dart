import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_qyyim/config/app.dart';


class LabelRow extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double labelWidth;
  final bool isRight;  // 是否显示右边的视图
  final bool isLine;  // 显示底部的横线
  final String value;
  final String rValue;  // 右边的标题
  final Widget rightW;
  final EdgeInsetsGeometry margin;  // 设置周围的距离
  final EdgeInsetsGeometry padding;
  final Widget headW;
  final double lineWidth;

  LabelRow({
    this.label,
    this.onPressed,
    this.value,
    this.labelWidth,
    this.isRight = true,
    this.isLine = false,
    this.rightW,
    this.rValue,
    this.margin,
    this.padding = const EdgeInsets.only(top: 15.0, bottom: 15.0, right: 5.0),
    this.headW,
    this.lineWidth = AppConstants.mainLineWidth,
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new FlatButton(
        color: Colors.white,
        padding: EdgeInsets.all(0),
        onPressed: onPressed ?? () {},
        child: new Container(
          padding: padding,
          margin: EdgeInsets.only(left: 20.0),
          decoration: BoxDecoration(
            border: isLine
                ? Border(bottom: BorderSide(color: AppColors.lineColor, width: lineWidth))
                : null,
          ),
          child: new Row(
            children: <Widget>[
              if (headW != null) headW,
              new SizedBox(
                width: labelWidth,
                child: new Text(
                  label ?? '',
                  style: TextStyle(fontSize: 17.0),
                ),
              ),
              value != null
                  ? new Text(value,
                      style: TextStyle(
                        color: AppColors.mainTextColor.withOpacity(0.7),
                      ))
                  : new Container(),
              new Spacer(),
              rValue != null
                  ? new Text(rValue,
                      style: TextStyle(
                          color: AppColors.mainTextColor.withOpacity(0.7),
                          fontWeight: FontWeight.w400))
                  : new Container(),
              rightW != null ? rightW : new Container(),
              isRight
                  ? new Icon(CupertinoIcons.right_chevron,
                      color: AppColors.mainTextColor.withOpacity(0.5))
                  : new Container(width: 10.0)
            ],
          ),
        ),
      ),
      margin: margin,
    );
  }
}
