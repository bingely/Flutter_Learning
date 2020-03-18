
ScreenUtil().setWidth(100) 来适配


# 聊天item 多种写法
## 第一种：conversation_item.dart  -- 没有借助FlatButton   参考微信消息列表UI
```
Material(
    child: InkWell(  // --onTap  onTapDown onLongPress
        child: Container(
            chid: Row( // - 分为了
                avatarContainer（）// 头像
                Content（）// 内容
            )
        )
    )
)
```

* avatarContainer 是图片和未读数量
```
Stack(
   overflow: Overflow.visible, /// Overflowing children will be visible.
   child: [
     Avatar(), // 头像
     Position{  // 图像右上角的未读
        right:-3.0 ,
        top: -3.0,
        child: unreadMsgCountText(conversationItemData),
     }
   ]
)
```

* unreadMsgCountText
```
Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(35.0),color: Color(AppColors.NotifyDotBg))
    child: Text()
)
```
* Content 是右边内容
```
Expanded(
    child: Container(
        decoration: BoxDecoration( /// 决定了横线的位置
            border: Border(bottom: BorderSide(width: 0.5,color: Color(AppColors.DividerColor),))
        ),
        child: Row(
            [
             Title(conversationItemData), // 正标题和副标题
             Tip(conversationItemData) // 应该就是时间，和消息喇叭
            ]
        )

    )
)
```


# item 参考 微信我的 点击 每个item
label_row.dart

VoidCallback onPressed // 代表空参数的点击事件
```
Container(   // 最主要是可以设置margin padding decoration
    child: FlatButton(  // 那么已经就具备了点击能力了，并且还有点击效果。 可见 每个控件的child都是具有特别大的想象。 还有就是套上某个控件子孩子也就具备了
        child: Container(
            chid: Row(
                SizeBox( //
                    Text（），

                )
                Spacer()，// 充当占位空间作用
                Text（）
            )
        )
    )
)
```
# 起占位距离的控件
## 空白
Spacer()
Expanded(child: SizedBox.shrink(),),
## 具体间隔
SizedBox（用于控制间隔），  // SizedBox(height: ScreenUtil().setHeight(15.0),),


# 增加点击效果的
有些控件不具备点击事件，比如Text Imag
解决方案：
1 Button Wrap
2 Inkwell  --- 具备了水波纹的样子
3 GestureDetector  -- 具备了常见手势监听



# 文本常用的
```
Text(
      conversationItemData.title,
      style: TextStyle(fontSize: ScreenUtil().setSp(30.0),color: Color(AppColors.TitleColor),fontWeight:FontWeight.w400),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    )
```
