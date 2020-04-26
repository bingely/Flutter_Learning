import 'package:sqflite/sqlite_api.dart';


/// 用于升级表操作帮助类
class DbOpenHelper{

  /// 表语句
   static void creteTables(Database db) async {
    // 消息表
    String messageSql = 'CREATE TABLE MessageData (id TEXT PRIMARY KEY, msg TEXT, nickName TEXT, time INTEGER, avatar TEXT, chatId TEXT, mapPic BLOB)';
    // 联系人表
    String contractSql = 'CREATE TABLE Contact (id TEXT PRIMARY KEY, avatar TEXT, name TEXT, nameIndex TEXT, isSelect INTEGER )';
    // 离线消息表
    String sessionSql = 'CREATE TABLE SessionMsg (id TEXT PRIMARY KEY, userId TEXT, avatars TEXT, name TEXT, nameIndex TEXT, title TEXT, subTitle TEXT, time INTEGER, type INTEGER, isDisturbMode INTEGER)';

    await db.execute(messageSql);
    await db.execute(contractSql);
    await db.execute(sessionSql);

   }

  /// 升级表  -- 当修改了数据库版本号会触发这个方法
  /// 考虑了两个场景 1 老表过来 2 其它
  static void onUpgrade(Database db, int oldVersion, int newVersion) async{
    // 版本更新可能牵扯到重新插入表、删除表、表中字段变更
    print('oldVersion:$oldVersion---newversion:$newVersion');
    switch (oldVersion) {
      case 1: //

        break;
      case 2:
        break;
    }
  }
}