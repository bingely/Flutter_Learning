
学会ui绘制
> 每天必写几个item 页面


以及别人如何封装项目结构

# 实现单例的模式来管理
  1 构造私有化
  XXX._ss();
  2 getInstance()
  XXX  getInstance(){
      if (ss == null){
          return XXX._ss();
      }
      return ss；
  }
  剩下就是对象的非静态方法


# 几种通过生成listview 类型写法
## listview.build
        ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Text('hello');
          }),

## List.generate
```
    TabBarView(
         children: List.generate(treeList.length,
         (index) => ArticleListPage(treeList[index].id)),
     )
```
## (xx数组).map((content){return }).toList()
        Column(
          children: INDEX_BAR_WORDS.map((word) {
            return Expanded(
              child: Text(word),
            );
          }).toList(),
        )
        等效于第二种
        Column(
        //          children: INDEX_BAR_WORDS.map((word) {
        //            return Expanded(
        //              child: Text(word),
        //            );
        //          }).toList(),
                  children: List.generate(INDEX_BAR_WORDS.length,
                          (index) => Text(INDEX_BAR_WORDS[index])),
                ),

# Flutter中的AutomaticKeepAliveClientMixin
https://blog.csdn.net/xcf111/article/details/95318987
切换tab后保留tab的状态，避免initState方法重复调用



provider


# 国际化Intl方案
https://juejin.im/post/5e4536d0e51d4526ef5f85a9


# provider
        message ??= S.of(context).viewStateMessageNetworkError;


ViewStateModel with ChangeNotifier    (provider 基础类)
abstract class ViewStateListModel<T> extends ViewStateModel   （请求数据）
abstract class ViewStateRefreshListModel<T> extends ViewStateListModel<T> （请求数据，并且有下拉刷新，分页加载的）


ListenableProvider(

)

## ProviderWidget
封装了Cumsumer provider

# Skeleton骨架
一个图像的"骨架"是指图像中央的骨骼部分，是描述图像几何拓扑性质的重要特征之一。

SkeletonBox



********************common*******************
# db
# net
# pinyin
# provider
# route
路由跳转封装
路由的效果
# service
# websocket


# touch_callback.dart
封装了Container为单位的点击事件效果


*******************config********************
# app.dart
存放的是color  style   constant


# dictonnary.dart
放的是字母索引数组

# keys.dart
放的是那些keyvalue逻辑的业务，比如sp,map 所对应的key

# provider_config.dart
实现单例的模式来管理
是对app 整个对象的provider管理,比如theme,local


# resource_mananger.dart
资源管理，易错的路径写法，比如图片路径写法的wrap,

# router_manger.dart
用来管理路由的

# storage_manager.dart
用来管理数据存储相关的



********************tool***********************
# check.dart
验证小工具类 ，比如正则，校验

# date.dart

# log_utils.dart
之所以要封装log

# navigator_util.dart
路由跳转语句封装

# net_util.dart
网路判断

# platform_utils.dart
app 信息资源获取  /// 是否是生产环境 ，包名，版本号

# shared_util.dart
sp 封装

# string_utils.dart
string 操作封装



# toast_util.dart
Toast.dart
通过单例的方式
Overlay   OverlayEntry
https://blog.csdn.net/weixin_34390105/article/details/88017229

ui:
Positioned{
  top: gravity == 2 ? 50 : null,
  bottom: gravity == 0 ? 50 : null,
  child:Container{

        }
}


# win_media.dart
获取屏幕一些margin padding  bar高度

*************ui***********
# 带有第三方功能插件的要wrap一层，防止后续变化替换成更好的插件
> 可见一般都是封装常用的flutter ui 组件


# commom_bar.dart
封装了AppBar

# commom_button.dart

# dialog.dart
封装dialog


# image.dart  和 image_view.dart
WrapperImage 封装了CachedNetworkImage
image_view.dart 封装了 Image api

TODO 这两个看可以组合在一起
> 感悟一个组件api,原来可以封装在一块


## shoshow_toast.dart
封装了showToast


# loading_container.dart
加载进度条组件



# view_state.dart
通过emum封装了常见错误的类型
# ViewStateListModel.dart
通用的
# view_state_widget.dart
包含了三个通用widget
## 加载中
Center(
   child: CircularProgressIndicator()
)
LoadingContainer  可以包含一个child

## ErrorWidget
## 页面无数据
## 页面未授权
## 未授权图片
## 公用Button
包装了OutLineButton,封装了基本操作

# skeleton.dart  article_skeleton.dart
骨架视图

# toast.dart
dart 语言的toast,不借助插件



# ui.dart
定义了几个通用的ui widget
/// 水平线
/// 垂直线
/// 空白区域

