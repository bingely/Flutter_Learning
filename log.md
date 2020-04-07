

diaoyang

定位和图表两个控件

今日完成：
1 调研一款地图插件
集成地图展示，地图定位搜索数据获取功能


明天准备完成：
1 消息类型支持发送地图类型业务编写


今日完成：
1 消息类型支持发送地图类型业务编写

明天准备完成：
1 完善地图展示效果


今日完成：
研究地图移动地图获取中心焦点，获取定位地址逻辑

下周准备完成：
仿微信地图展示：
1 地图的地址搜索页列表页折叠UI效果
2 点击聊天记录跳到对应地图区域的UI展示
2 处理地图控件细节问题



研究下一些布局的适配的问题总结：
## 使用flutter_ScreenUtil
##  在Flutter 的Column或者Row内
当子元素超过了屏幕大小

* child:使用ListView.builder()
报错log:RenderBox was not laid out: RenderViewport#680c1 NEEDS-LAYOUT NEEDS-PAINT

在Flutter 的Column或者Row内使用ListView.builder()需要对改ListView的大小进行指定.
  具体的解决办法就是 在该ListView.builder()外嵌套一个SizeBox或者Container即可…
  https://blog.csdn.net/heming9174/article/details/89919561

* child:普通元素(比如img)
log:flutter: The following message was thrown during layout:
    flutter: A RenderFlex overflowed by 826 pixels on the right.

解决方法：A widget that expands a child of a Row, Column, or Flex.
     Using an Expanded widget makes a child of a Row, Column, or Flex expand to fill the available space in the main axis
     (e.g., horizontally for a Row or vertically for a Column). If multiple children are expanded, the available space is divided among them according to the flex factor.
     即使用Expanded来包裹
拓展： Expanded 除了可以解决上面的问题之外，还有一个妙用就是比例布局（指定它的flex)
https://mp.weixin.qq.com/s/CfXR3nshGD8LwG0FgaemVw


* 还有一种情况，在Column等外面包裹Expanded
Consider applying a flex factor (e.g. using an Expanded widget) to force the children of the RenderFlex to fit within the available space instead of being sized to their natural size.

————————————————
版权声明：本文为CSDN博主「鲨鱼不会飞」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/shayubuhuifei/java/article/details/86748327

## listview 和单选的checkbox如何处理