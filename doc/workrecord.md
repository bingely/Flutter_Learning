# 代码学习-->到熟能
1 跟着demo理解并写一遍，直到熟练，理解清楚里面的作用是什么
2 跟着思路，抛开demo,自己去实现一遍。


研究下http是怎么管理超时任务的。

单元测试 https://www.jianshu.com/p/6170999fb16c
公共基类的学习封装 数据 provide list的下拉上拉数据加载封装
熟练学习mvvm开发思维


还需要定制扫描二维码布局


https://kdocs.cn/el/e42fvap?f=501
邀请你一起编辑「3月考勤.xlsx」

# 3/20
@override
  DbBaseBean fromJson(Map<String, dynamic> map) {
     new ChatData(
      msg: map['msg'] as String,
      id: map['id'] as String,
      time: map['time'] as int,
      nickName: map['nickName'] as String,
      avatar: map['avatar'] as String,
    );
  }

昨晚因为这个语句纠结了很久，报错提示没生成该对象。
ide不报错，但是有预警，所以预警信息也很重要。

今日完成：
1 加入联系人列表模拟数据
2 调节聊天页面细节数据处理问题

下周一准备完成：
1 调整聊天页面滑动（交互）细节处理,
2 解决部分开源插件兼容问题
3 编写多选的图片相册组件




# 3/19
今日完成：
1 聊天数据缓存，模拟简单离线消息场景。
2 listview修改支持倒序分页加载数据。

明天准备完成：
1 调节聊天页面细节数据处理问题
2 加入联系人列表模拟数据


# 3/18
今日完成：
1 聊天页面的mvvm重构
调整ui细节，业务逻辑分离

明天准备完成：
1 继续聊天页面数据整理
1.1 加入数据缓存，模拟离线消息场景。
1.2 listview修改支持倒序分页加载数据。


# 3/17
今日完成：
1 消息列表页mvvm 重构
2 调整项目结构
3 研究路由支持对象传递的写法，时间DateTime小工具封装

明天准备完成
1 聊天页面的mvvm重构

# 3/16
今日完成：
1 列表页（具有下拉刷新和分页加载）的基类的封装

2 优化知识点
通过Intl插件进行文字管理
通过AutomaticKeepAliveClientMixin解决Tab页面状态失效原因

3 修复禅道问题

明天准备完成：
1 消息模块的mvvm重构



组合聊天页面

组合联系人页面

组件控件整理入口

分组折叠展开组件研究


# 3/13
今日完成：
1 二维码组件使用
分别有生成二维码和扫描二维码插件
2 路由框架Fluro的研究使用
3 修复禅道bug

下周准备完成：
1 分组折叠展开组件研究
https://juejin.im/post/5d08a1d0f265da1bb27732ec
2 列表页（具有下拉刷新和分页加载）的基类的封装
3 mvvm开发模式重构消息列表/聊天页面
4 flutter构建项目单元测试。



rxdart 封装比较好点的
https://www.wandouip.com/t5i266374/

今日完成：
1 学习基于provider对mvvm写法的设计思路

明天准备完成
1 对二维码的插件封装
2 路由框架Fluro的研究使用

# 3/12

1 对二维码的插件封装
还需要定制扫描二维码布局
2 路由框架Fluro的研究使用
对比自己管理路由框架是什么样子



# 3/11
今日准备完成
1 学习RxDart响应式编程api
2 对http/websocket请求场景进行RxDart代码优化。



明天准备完成：
1 学习mvvm开发模式重构个别页面。



明天准备完成：
写 RxDart + Dio + Sqlite 组成的带缓存的网络请求


# 3/10
今日完成：
1 处理wesocket 断线重连，超时逻辑
2 了解RxDart响应式编程api


明天准备完成：
1 继续学习RxDart响应式编程api,
2 对http/websocket请求场景进行RxDart代码优化。






future 本身就有
https://www.jianshu.com/p/0f0201f74679
getDatas().then((List<Chat> datas) {
      if(!_cancelConnect){
        setState(() {
          _datas = datas;
        });
      }
    }).catchError((e) {
      print('error$e');
    }).whenComplete((){
      print('完毕');
    }).timeout(Duration(seconds: 1)).catchError((timeOut){
      //超时:TimeoutException after 0:00:00.010000: Future not completed
      print('超时:${timeOut}');
      _cancelConnect = true;
    });//设置超时时间

http://blog.itpub.net/69952849/viewspace-2673863/


1 学习flutter 任务队列、异步等知识,
编写websocket 断线重连，超时逻辑
断线重连（无网络到有网络）
超时逻辑 (进行定时的任务，超过了指定的时间点就是超时）。


# 3/9
今日完成:
1 修复云帮手禅道问题
2 比较几款websocket框架，选定 web_socket_channel
3 对web_socket_channel 封装了基本的操作。


明天准备完成：
1 学习flutter 任务队列、异步等知识,编写websocket 断线重连，超时逻辑

# 3/6
测试下登录接口还会不会再有出现多个连接实例。

今日完成：
1重构和测试剩余的ny.user接口

下周一准备完成：
1编写websocket的调研和封装

# 3/5
今日完成
1 调通和服务端的grpc数据逻辑
2 重构user.thrfit文件中用户相关接口数据。
目前确定已调通（登录/修改昵称/修改用户信息（地区，性别）/修改登录用户密码)

明天准备完成：
1 重构和测试剩余的接口


# 3/4

今日完成：
1 比较几款orm框架优劣，学习里面的设计思路.
2 学习TextField和Form UI组件
3 搭建probuf编译环境,使用掌握序列化/反序列化过程.

明天准备完成：
1 websocket的调研和封装

https://juejin.im/post/5c45c72d6fb9a049d81c2b4c

## 研究下数据库加密原理
1 greendao 加密原理是 引入了android-database-sqlcipher作为支持
目前flutter sqlcipher 支持


# 3/3
今日完成：
1 sqflite数据库基本操作面向对象封装.


明天准备完成：
1 对jaguar_query_sqflite（https://pub.dev/packages/jaguar_query_sqflite）
https://github.com/Jaguar-dart/jaguar_orm
和 idb_sqflite（https://pub.dev/packages/idb_sqflite）这两款面向对象数据库插件进行学习研究
2 研究下数据库加密原理


包含了逻辑书写， 验证数据库基本操作以及升级数据库操作准确性
