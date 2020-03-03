// 基础bean，工具类操作依赖此bean
abstract class DbBaseBean {
  /// 实体转换Map
  Map<String, dynamic> toJson();

  /// map转实体
  DbBaseBean fromJson(Map<String, dynamic> map);

  /// 关联表名称  得保证和建表的语句那里保持一致性。
  String getTableName();
}