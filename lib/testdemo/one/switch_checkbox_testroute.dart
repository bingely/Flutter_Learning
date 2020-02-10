import 'package:flutter/material.dart';

///通过Switch和Checkbox我们可以看到，虽然它们本身是与状态（是否选中）关联的，但它们却不是自己来维护状态，而是需要父组件来管理状态，然后当用户点击时，再通过事件通知给父组件，这样是合理的，因为Switch和Checkbox是否选中本就和用户数据关联，而这些用户数据也不可能是它们的私有状态。我们在自定义组件时也应该思考一下哪种状态的管理方式最为合理。
class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  @override
  SwitchAndCheckBoxTestRouteState createState() => new SwitchAndCheckBoxTestRouteState();
}

class SwitchAndCheckBoxTestRouteState extends State<SwitchAndCheckBoxTestRoute> {
  bool _switchSelected=true; //维护单选开关状态
  bool _checkboxSelected=true;//维护复选框状态

  @override
  Widget build(BuildContext context) {
    var _switchSecleted = true;
    return Column(
      children: <Widget>[
        Switch(
          value: _switchSecleted,
          onChanged: (value){
            //重新构建页面
            setState(() {
              _switchSecleted = value;
            });
          },
        ),
        Checkbox(
          value: _checkboxSelected,
          activeColor: Colors.red,
          onChanged:(value){
            setState(() {
              _checkboxSelected=value;
            });
          } ,
        )
      ],
    );
  }
 
}
