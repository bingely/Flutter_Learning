import 'package:flutter_qyyim/tool/device_utils.dart';
import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';

/// https://blog.csdn.net/qq_19979101/article/details/93030803
/// 数据库的创建，关闭等基础操作
class DBManager {
  /// dbversion
  static const int _VERSION = 1;

  /// db name
  static const String _DB_NAME = "qqyim.db";

  /// db instance
  static Database _database;

  static init() async {
    var databasePath = await getDatabasesPath();
    String path = databasePath + _DB_NAME;
    if (DeviceUtils.isIOS) {
      path = databasePath + "/" + _DB_NAME;
    }

    // create db and open
    _database = await openDatabase(path,
        version: _VERSION, onCreate: (Database database, int version) {

        });
  }

  /// db table exist?
  static isTableExits(String tableName) async {
    await getCurrentDatabase();
    String sql =
        "select * from Sqlite_master where type = 'table' and name = '$tableName'";
    var res = await _database.query(sql);
    return res != null && res.length > 0;
  }

  static Future<Database> getCurrentDatabase() async {
    if (_database == null) {
      await init();
    }
    return _database;
  }

  /// close db
  static close() {
    _database?.close();
    _database = null;
  }
}
