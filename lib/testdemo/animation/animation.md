



# 9.3 自定义路由切换动画

MaterialPageRoute 它可以使用和平台风格一致的路由切换动画，如在iOS上会左右滑动切换，而在Android上会上下滑动切换

CupertinoPageRoute 是Cupertino组件库提供的iOS风格的路由切换组件，它实现的就是左右滑动切换。

那自定义
无论是MaterialPageRoute、CupertinoPageRoute，还是PageRouteBuilder，它们都继承自PageRoute类，而PageRouteBuilder其实只是PageRoute的一个包装，我们可以直接继承PageRoute类来实现自定义路由

自定义应用场景假如我们只想在打开新路由时应用动画，而在返回时不使用动画，那么我们在构建过渡动画时就必须判断当前路由isActive属性是否为true


# 9.4 Hero动画 （英雄），有一种说法是说美国文化中的超人是可以飞的）
实现Hero动画只需要用Hero组件将要共享的widget包装起来，并提供一个相同的tag即可，中间的过渡帧都是Flutter Framework自动完成的。必须要注意， 前后路由页的共享Hero的tag必须是相同的，Flutter Framework内部正是通过tag来确定新旧路由页widget的对应关系的。

Hero动画的原理比较简单，Flutter Framework知道新旧路由页中共享元素的位置和大小，所以根据这两个端点，在动画执行过程中求出过渡时的插值（中间态）即可，而感到幸运的是，这些事情不需要我们自己动手，Flutter已经帮我们做了！



# 9.5 交织动画
这些动画可能由一个动画序列或重叠的动画组成

# 9.6 通用"切换动画"组件（AnimatedSwitcher）


# 9.7 动画过渡组件