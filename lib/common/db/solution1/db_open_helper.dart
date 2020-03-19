import 'package:sqflite/sqlite_api.dart';


/// 用于升级表操作帮助类
class DbOpenHelper{

  /// 表语句
   static void creteTables(Database db) async {
    String chatsql =  'CREATE TABLE Student (id TEXT PRIMARY KEY, name TEXT, score INTEGER)';
    // 学生
    await db.execute(
        'CREATE TABLE ChatMessage (id TEXT PRIMARY KEY, msg TEXT, score INTEGER)');

    await db.execute(chatsql);
  }

  /// 升级表  -- 当修改了数据库版本号会粗发这个方法
  /// 考虑了两个场景 1 老表过来 2 其它
  static void onUpgrade(Database db, int oldVersion, int newVersion) {
    // 版本更新可能牵扯到重新插入表、删除表、表中字段变更
    print('oldVersion:$oldVersion---newversion:$newVersion');
    switch (oldVersion) {
      case 1: //

        break;
      case 2: //

        break;
    }
  }
}