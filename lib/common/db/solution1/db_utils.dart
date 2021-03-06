import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_qyyim/tool/log_utils.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import 'db_base_bean.dart';
import 'db_open_helper.dart';

/// https://www.jianshu.com/p/7d9a73a857e0 参考修改
/// 数据库存储
class DbUtils {
  DbUtils._();

  // 数据库路径
  String databasesPath;

  // 数据库
  Database database;

  // 数据库版本
  int dbVersion = 1;

  static DbUtils dbUtils;

  static DbUtils getInstance() {
    if (null == dbUtils) dbUtils = DbUtils._();
    return dbUtils;
  }

  /// 打开数据库
  Future openDb(String dbName) async {
    // 如果数据库路径不存在，赋值
    if (null == databasesPath || databasesPath.isEmpty)
      databasesPath = await getDatabasesPath();

    // 如果数据库存在，而且数据库没有关闭，先关闭数据库
    closeDb();

    database = await openDatabase(join(databasesPath, dbName + '.db'),
        version: dbVersion, onCreate: (Database db, int version) async {
      DbOpenHelper.creteTables(db);
    }, onUpgrade: (Database db, int oldVersion, int newVersion) {
      DbOpenHelper.onUpgrade(db, oldVersion, newVersion);
    });
  }

  // 插入数据
  Future<void> insertItem<T extends DbBaseBean>(T t) async {
    if (null == database || !database.isOpen) return;
    log("开始插入数据：${t.toJson()}");

    // 插入操作
    await database.insert(
      t.getTableName(),
      t.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// 删除数据
  Future<void> deleteItem<T extends DbBaseBean>(T t,
      {String key, String value}) async {
    if (null == database || !database.isOpen) return null;

    // 删除表
    if (key == null || value == null || key.isEmpty || value.isEmpty) {
      await database.delete(t.getTableName());
    } else {
      // 删除数据
      await database.delete(
        t.getTableName(),
        where: (key + " = ?"),
        whereArgs: [value],
      );
    }
  }

  /// 更新数据
  Future<void> updateItem<T extends DbBaseBean>(
      T t, String key, String value) async {
    if (null == database || !database.isOpen) return null;

    // 更新数据
    await database.update(
      t.getTableName(),
      t.toJson(),
      where: (key + " = ?"),
      whereArgs: [value],
    );
  }

  // 查询数据
  Future<List<T>> queryItems<T extends DbBaseBean>(T t,
      {String key = "", String value = ""}) async {
    if (null == database || !database.isOpen) return null;

    List<Map<String, dynamic>> maps = List();

    // 列表数据
    if (key == null || value == null || key.isEmpty || value.isEmpty) {
      maps = await database.query(t.getTableName());
    } else {
      maps = await database.query(
        t.getTableName(),
        where: (key + " = ?"),
        whereArgs: [value],
      );
    }

    // map转换为List集合
    return List.generate(maps.length, (i) {
      //LogUtil.d("queryItems：${maps[i]}");
      return t.fromJson(maps[i]);
    });
  }

  // 查询数据 -- 分页  orderBy: "id Asc  Desc
  Future<List<T>> queryItemsLimitOrder<T extends DbBaseBean>(T t,
      {int limit = 0,int offset = 0,orderBy = "",String key = "", String value = ""}) async {
    if (null == database || !database.isOpen) return null;

    List<Map<String, dynamic>> maps = List();

    // 列表数据

    maps = await database.query(
      t.getTableName(),
      orderBy: orderBy,
    );

    // map转换为List集合
    return List.generate(maps.length, (i) {
      //LogUtil.d("queryItems：${maps[i]}");
      return t.fromJson(maps[i]);
    });
  }


  Future<List<T>> queryItemsLimit<T extends DbBaseBean>(T t,
      {int limit = 0,int offset = 0,orderBy = "",String key = "", String value = ""}) async {
    if (null == database || !database.isOpen) return null;

    List<Map<String, dynamic>> maps = List();

    // 列表数据

    maps = await database.query(
      t.getTableName(),
      where: (key + " = ?"),
      whereArgs: [value],
      limit: limit,
      offset: offset,
      orderBy: orderBy,
    );
    // map转换为List集合
    return List.generate(maps.length, (i) {
      //LogUtil.d("queryItems：${maps[i]}");
      return t.fromJson(maps[i]);
    });
  }



  Future<List<T>> rawQuery<T extends DbBaseBean>(T t,  {int limit = 0,int offset = 0,orderBy = "",String key = "", String value = "", int time}
      ) async {
    if (null == database || !database.isOpen) return null;

   // String sql = 'select ${t.getTableName()} where $key = $value and time = $time';
    String sql = 'select * from ${t.getTableName()} where $key = $value and time <= $time';

    List<Map<String, dynamic>> maps = List();
    maps = await database.rawQuery(sql);

    // map转换为List集合
    return List.generate(maps.length, (i) {
      //LogUtil.d("queryItems：${maps[i]}");
      return t.fromJson(maps[i]);
    });
  }

  Future<List<T>> rawQueryLike<T extends DbBaseBean>(T t,  {int limit = 0,int offset = 0,orderBy = "",String key = "", String value = "", String msg}
      ) async {
    if (null == database || !database.isOpen) return null;

    // String sql = 'select ${t.getTableName()} where $key = $value and time = $time';
    String sql = 'select * from ${t.getTableName()} where msg like "$msg"';

    List<Map<String, dynamic>> maps = List();
    maps = await database.rawQuery(sql);

    // map转换为List集合
    return List.generate(maps.length, (i) {
      LogUtil.d("queryItems：${maps[i]}");
      return t.fromJson(maps[i]);
    });
  }



  /// 关闭数据库
  closeDb() async {
    // 如果数据库存在，而且数据库没有关闭，先关闭数据库
    if (null != database && database.isOpen) {
      await database.close();
      database = null;
    }
  }

  /// 删除数据库
  deleteDb(String dbName) async {
    // 如果数据库路径不存在，赋值
    if (null == databasesPath || databasesPath.isEmpty)
      databasesPath = await getDatabasesPath();

    await deleteDatabase(join(databasesPath, dbName + '.db'));
  }
}
