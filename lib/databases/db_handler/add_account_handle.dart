import 'package:keep_account/databases/db_provider.dart';
import 'package:keep_account/databases/models/account_model.dart';
import 'package:sqflite/sqlite_api.dart';

class AccountDBProvider extends BaseDbProvider {
  // 表名
  final String name = 'AccountTable';

  final String columnId = "id";
  final String columAppName = 'appname';
  final String columnIcon = 'icon'; // 图标
  final String columnAccount = 'account'; // 账号
  final String columnPassword = 'password'; // 密码
  final String columnInsertTime = 'insertTime'; // 插入的时间
  final String columnUpdateTime = 'updateTime'; // 更新的时间
  final String columnIsHide = 'isHide'; // 是否在首页隐藏
  final String columnIsTop = 'isTop'; // 是否置顶

  AccountDBProvider();

  @override
  tableName() {
    return name;
  }

  @override
  createTableString() {
    return '''
        create table $name (
        $columnId integer primary key AUTOINCREMENT,
        $columnIcon text not null,
        $columnAccount text not null,
        $columnPassword text not null,
        $columnInsertTime text not null,
        $columnUpdateTime text not null,
        $columAppName text not null,
        $columnIsHide INTEGER DEFAULT 0,
        $columnIsTop INTEGER DEFAULT 0
        )
      ''';
  }

  //插入到数据库
  Future insert(AccountModel model) async {
    Database db = await getDataBase();

    return await db.rawInsert(
        "insert into $name ($columAppName, $columnIcon,$columnAccount,$columnPassword,$columnInsertTime,$columnUpdateTime) values (?,?,?,?,?,?)",
        [
          model.appname,
          model.icon,
          model.account,
          model.password,
          model.insertTime,
          model.updateTime,
        ]);
  }

  //更新数据库
  Future<void> update(AccountModel model) async {
    Database database = await getDataBase();
    await database.rawUpdate(
        "update $name set $columAppName = ? , $columnIcon = ?,$columnAccount = ?,$columnPassword = ?,$columnUpdateTime = ? where $columnId= ?",
        [
          model.appname,
          model.icon,
          model.account,
          model.password,
          model.updateTime
        ]);
  }

  // 查询数据库
  Future<List<AccountModel>> query() async {
    Database database = await getDataBase();

    final List<Map<String, dynamic>> accounts = await database.rawQuery(
        "select id, icon, appname, account, password, insertTime, updateTime from $name WHERE isHide != 1 ORDER BY datetime(updateTime) DESC");

    return List.generate(accounts.length, (i) {
      return AccountModel(
          id: accounts[i]['id'],
          icon: accounts[i]['icon'],
          account: accounts[i]['account'],
          appname: accounts[i]['appname'],
          password: accounts[i]['password'],
          insertTime: accounts[i]['insertTime'],
          updateTime: accounts[i]['updateTime'],
          isHide: accounts[i]['isHide']);
    });
  }

  // 删除数据
  Future delete(int id) async {
    Database db = await getDataBase();
    return await db.rawQuery("Delete from $name where id = $id");
  }

  /// 隐藏
  /// int id
  /// String eventName top | unTop
  Future handleStickToTop(int id, String eventName) async {
    Database db = await getDataBase();

    int topCode = eventName == 'top' ? 1 : 0;

    return await db.rawQuery("UPDATE $name SET isTop = $topCode where id = $id");
  }

  /// 隐藏
  /// int id
  /// String eventName hide | unHide
  Future handleHide(int id, String eventName) async {
    Database db = await getDataBase();

    int topCode = eventName == 'hide' ? 1 : 0;

    return await db.rawQuery("UPDATE $name SET isHide = $topCode where id = $id");
  }

  /// 查找数据
 /// string name

}
