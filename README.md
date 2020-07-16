# flutter_qyyim

A new Flutter application.

## flutter 环境
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, v1.12.13+hotfix.7, on Mac OS X 10.14.4 18E226, locale zh-Hans-CN)

[✓] Android toolchain - develop for Android devices (Android SDK version 28.0.3)
[✓] Xcode - develop for iOS and macOS (Xcode 10.2.1)
[✓] Android Studio (version 3.5)
[!] IntelliJ IDEA Ultimate Edition (version 2019.1)
    ✗ Flutter plugin not installed; this adds Flutter specific functionality.
    ✗ Dart plugin not installed; this adds Dart specific functionality.
[✓] Connected device (1 available)

! Doctor found issues in 1 category.



common	如通用方法类、网络接口类、保存全局变量的静态类等
models	Json文件对应的Dart Model类会在此目录下
states	保存APP中需要跨组件共享的状态类
routers	存放所有路由页面类
pages  存放app页面
(ui)widgets	APP内封装的一些Widget组件都在该目录下
tool   一些工具类
provider 存放继承ChangeNotifier

MVVM 架构
M: modle
V: pages, ui
M: view_model


## 公共模块
* MVVM 结构(通过provider管理)
* 数据库管理增删改查来模拟接口调用，以及用来数据缓存
* 通用的appbar,通用的按钮，通用的item
* 暗黑模式

模块功能
## 消息列表
多头像拼接
时间友好显示，时间排序 ， 置顶效果， 左滑删除, 右上角弹窗，
二维码

## 聊天页面
* 聊天列表（倒序和分页显示）
* 相册，拍摄，视频，地图，文件功能

## 发现页面
收集比较有难度的布局



