import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

class DBHelper {
  static Future<Database> database() async {
    try {
      final dbPath = await sql.getDatabasesPath();
      return sql.openDatabase(path.join(dbPath, 'usertype.db'),
          onCreate: (db, version) {
        print('table created properly');
        return db.execute(
            'CREATE TABLE usertype( isEmployee INTEGER, isEmployer INTEGER)');
      }, version: 1);
    } catch (e) {
      print('error creating table');
    }
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    try {
      final db = await DBHelper.database();
      db.insert(
        'usertype',
        data,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      // db.update(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
      print('data inserted');
    } catch (e) {
      print('error inserting data');
    }
  }

  static Future<void> update(String table, Map<String, Object> data) async {
    try {
      final db = await DBHelper.database();
      db.update(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
      print('data inserted');
    } catch (e) {
      print('error inserting data');
    }
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    return db.query(table);
  }
}
