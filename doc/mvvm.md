# model
存的是类似于javabean  ，里面包含tojson fromjson 重要方法
# view
 是页面布局控件
# view_model
下是页面的业务逻辑 ，继承自ChangeNotifier(这里有过渡一个中间件ViewStateModel)；
网络接口请求放在一个单独的页面中，比如XXXRespsitory

至于如何刷新view层？当然通过provider


项目结构应该是
ui/ 下分为了pages widget



# 升级版本
https://www.jianshu.com/p/a13d38ba617f


# 没看懂为啥这样封装
class _ProviderWidgetState<T extends ChangeNotifier>
    extends State<ProviderWidget<T>> {
  T model;

  @override
  void initState() {
    model = widget.model;
    widget.onModelReady?.call(model);
    super.initState();
  }

  @override
  void dispose() {
    if (widget.autoDispose) model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: model,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}