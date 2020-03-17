# label_row.dart

VoidCallback onPressed // 代表空参数的点击事件

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

# 起占位距离的控件
## 空白
Spacer()
Expanded(child: SizedBox.shrink(),),
## 具体间隔
SizedBox（用于控制间隔），