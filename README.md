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