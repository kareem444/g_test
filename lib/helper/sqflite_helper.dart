import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteHelper {
  static Database? _database;

  static Future<void> initDB() async {
    if (_database == null) {
      String path = "${await getDatabasesPath()}session.db";
      _database = await openDatabase(path, version: 1);
    }
  }

  static Future<void> createTable(
      {required String tableName, required String columns}) async {
    if (_database != null) {
      await _database!.execute('''
                  create table if not exists $tableName ( 
                    userId String primary key, 
                    $columns
                    )
                  ''');
    }
  }

  static Future<void> insert({
    required String table,
    required dynamic data,
  }) async {
    if (_database != null) {
      await _database!.insert(table, data);
      debugPrint("$table inserted");
    }
  }
}
