import 'package:keep_account/databases/db_provider.dart';
import 'package:keep_account/databases/models/preset_model.dart';
import 'package:sqflite/sqflite.dart';

class PresetProvider extends BaseDbProvider {
  // 表名
  final String name = 'preset_table';

  final String columnId = "id";
  final String columnName = "presetName";
  final String columnContent = "content";
  final String columnCreateTime = 'createTime'; // 插入的时间
  final String columnUpdateTime = 'updateTime'; // 更新的时间

  PresetProvider();

  @override
  tableName() {
    return tableName;
  }

  @override
  createTableString() {
    return '''
        create table $name (
        $columnId integer primary key AUTOINCREMENT,
        $columnName text not null,
        $columnContent text not null,
        $columnCreateTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        $columnUpdateTime text not null,
        )
      ''';
  }

  Future query() async {
    Database database = await getDataBase();

    final List<Map<String, dynamic>> presets = await database.rawQuery(
        "select id, presetName, content, createTime, updateTime from $name WHERE ORDER BY datetime(createTime) DESC");

    // return List.generate(presets.length, (i) => {
    //   return PresetModel({
    //
    //     })
    // });

  }

  // 预设的信息插入数据库
  Future insert(PresetModel model) async {
    Database db = await getDataBase();

    return await db.rawInsert("insert into $name ($columnName, $columnContent, $columnCreateTime, $columnUpdateTime) values (?, ?, ?, ?)",
        [
      model.presetName,
      model.content,
      model.createTime,
      model.updateTime
    ]);
  }



  // 删除预设信息
 Future delete(int id) async {
    Database db = await getDataBase();

    return await db.rawQuery("Delete from $name where id = $id");
 }

  /// 加载账号列表
  Future handlePresetList() async {
    Database db = await getDataBase();

    return await db.query("SELECT id, presetName, content from $name");
  }
}
