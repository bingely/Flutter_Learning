# Padding

## 5.1 填充（Padding）
fromLTRB(double left, double top, double right, double bottom)：分别指定四个方向的填充。
all(double value) : 所有方向均使用相同数值的填充。
only({left, top, right ,bottom })：可以设置具体某个方向的填充(可以同时指定多个方向)。
symmetric({ vertical, horizontal })：用于设置对称方向的填充，vertical指top和bottom，horizontal指left和right。

# 5.2 尺寸限制类容器


## 5.2.1 ConstrainedBox
ConstrainedBox用于对子组件添加额外的约束。例如，如果你想让子组件的最小高度是80像素，你可以使用const BoxConstraints(minHeight: 80.0)作为子组件的约束。
## 5.2.2 SizeBox
SizedBox只是ConstrainedBox的一个定制
## 5.2.3 多重限制
发现有多重限制时，对于minWidth和minHeight来说，是取父子中相应数值较大的
对于maxWidth和maxHeight，多重限制的策略是什么样的呢？为啥设置完之后会消失了
ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 90.0, maxWidth: 120.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 60.0, maxWidth: 90.0),
                child: redBox,
              )
          ),

## 5.2.4 UnconstrainedBox
UnconstrainedBox对父组件限制的“去除”并非是真正的去除
那么有什么方法可以彻底去除父ConstrainedBox的限制吗？答案是否定的！所以在此提示读者，在定义一个通用的组件时，如果要对子组件指定限制，
那么一定要注意，因为一旦指定限制条件，子组件如果要进行相关自定义大小时将可能非常困难，因为子组件在不更改父组件的代码的情况下无法彻底去除其限制条件。

## 5.2.4 其它尺寸限制类容器
比如AspectRatio，它可以指定子组件的长宽比、LimitedBox 用于指定最大宽高、FractionallySizedBox 可以根据父容器宽高的百分比来设置子组件宽高等，


# 5.3 装饰容器DecoratedBox
## BoxDecoration
LinearGradient类，它用于定义线性渐变的类，Flutter中还提供了其它渐变配置类，如RadialGradient、SweepGradient，

## 5.4 变换（Transform）
注意：要使用math.pi需先进行如下导包。

import 'dart:math' as math;

## 5.5 Container
1 Container是一个组合类容器，它本身不对应具体的RenderObject，它是DecoratedBox、ConstrainedBox、Transform、Padding、Align等组件组合的一个多功能容器，
所以我们只需通过一个Container组件可以实现同时需要装饰、变换、限制的场景
2 里面有 Padding和Margin

## 5.6 Scaffold、TabBar、底部导航

