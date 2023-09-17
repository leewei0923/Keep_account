import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ChangeIconModel extends ChangeNotifier {
  dynamic _icon = "";

  dynamic get currentIcon => _icon;

  void changeIcon(dynamic icon) {
    _icon = icon;
    notifyListeners();
  }
}
