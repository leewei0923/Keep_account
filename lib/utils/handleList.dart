import 'package:keep_account/databases/models/account_model.dart';

class HandleList {
  removeOne(int id, List<AccountModel> list) {
    List<AccountModel> newList = <AccountModel>[];
    for (int i = 0; i < list.length; i++) {
      if (list[i].id != id) {
        newList.add(list[i]);
      }
    }
    return newList;
  }

}
