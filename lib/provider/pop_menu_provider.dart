import 'package:flutter/foundation.dart';

class PopMenuProvider extends ChangeNotifier {
  String _currentMenu = "";
  int _currentAccountId = 0;

  String get currentMenu => _currentMenu;
  int get currentAccountId => _currentAccountId;

  void changeMenu(String str, int id) {
    _currentMenu = str;
    _currentAccountId = id;
    notifyListeners();
  }
}
