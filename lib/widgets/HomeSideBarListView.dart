import 'package:flutter/material.dart';
import 'package:keep_account/main.dart';
import 'package:keep_account/pages/allAccountPage.dart';
import 'package:keep_account/pages/mine.dart';
import 'package:keep_account/pages/setting.dart';
import 'package:keep_account/pages/preSetting.dart';

Widget genIconAndTextButton(
    BuildContext context, IconData icon, String name, dynamic router) {
  Icon iconWidget = Icon(icon);
  Text textWidget = Text(
    name,
    style: TextStyle(
      color: Colors.grey,
    ),
  );

  return Container(
    margin: const EdgeInsets.fromLTRB(40, 10, 0, 0),
    alignment: Alignment.centerLeft,
    child: TextButton.icon(
      icon: iconWidget,
      label: textWidget,
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => router)),
      style: ButtonStyle(
        iconColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.red; // 按钮按下时的颜色
            }
            return Colors.grey; // 按钮默认的颜色
          },
        ),
      ),
    ),
  );
}

// List<Widget> iconButtonList = [
//   genIconAndTextButton(Icons.home, "首页", () {
//
//   }),
//   genIconAndTextButton(Icons.settings_backup_restore_sharp, "预先设置", () {}),
//   genIconAndTextButton(Icons.settings, "应用设置", () {}),
//   genIconAndTextButton(Icons.exit_to_app, "退出", () {}),
// ];

class HomeSideBarListType {
  final IconData icon;
  final String label;
  final dynamic router;

  HomeSideBarListType(
      {required this.icon, required this.label, required this.router});
}

List<HomeSideBarListType> HomeSideBarLists = [
  HomeSideBarListType(icon: Icons.home, label: "首页", router: MyApp()),
  HomeSideBarListType(icon: Icons.account_box, label: "账号列表", router: AllAccountPage()),
  HomeSideBarListType(
      icon: Icons.settings_backup_restore_sharp,
      label: "预先设置",
      router: PreSettingPage()),
  HomeSideBarListType(icon: Icons.settings, label: "应用设置", router: SettingPage()),
  HomeSideBarListType(icon: Icons.person_rounded, label: "我的", router: MinePage()),
];
