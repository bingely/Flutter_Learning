typedef void RouteHandle(Map params);

var wsRouter = new WsRouter();

class WsRouter {
  static Map<String, RouteHandle> _routers = new Map();

  init() {
    routers.forEach((route) {
      route.forEach((name, value) {
        this.add(name, value);
      });
    });
  }

  // 增加路由
  void add(String name, RouteHandle handle) {
    WsRouter._routers[name] = handle;
  }

  // 路由处理
  Future<void> handle(String name, Map params) async {
    RouteHandle handle = WsRouter._routers[name];
    if (handle == null) {
      print("路由不存在");
      return;
    }
    handle(params);
  }
}

List<Map<String, RouteHandle>> routers = [
  /*{"login": UserLogic.login},
  {"kick": UserLogic.kick},*/
];