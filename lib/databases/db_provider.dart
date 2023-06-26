import 'package:keep_account/databases/database_manager.dart';
import 'package:sqflite/sqflite.dart';
import 'package:meta/meta.dart';

abstract class BaseDbProvider {
  bool isTableExits = false;

  createTableString();

  tableName();

  ///创建表sql语句
  tableBaseString(String sql) {
    return sql;
  }

  Future<Database> getDataBase() async {
    return await open();
  }

  ///super 函数对父类进行初始化
  @mustCallSuper
  prepare(name, String createSql) async {
    isTableExits = await DatabaseManager.isTableExits(name);
    if (!isTableExits) {
      Database? db = await DatabaseManager.getCurrentDatabase();
      return await db?.execute(createSql);
    }
  }

  @mustCallSuper
  open() async {
    if (!isTableExits) {
      await prepare(tableName(), createTableString());
    }
    return await DatabaseManager.getCurrentDatabase();
  }

}