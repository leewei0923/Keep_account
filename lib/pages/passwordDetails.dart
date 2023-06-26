import 'package:flutter/material.dart';

class PasswordDetails extends StatelessWidget {

  late final String account;
  late final String password;
  late final String appname;

  PasswordDetails({
    required this.appname,
    required this.password,
    required this.account,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appname),
      ),
      body: Center(
        child: Text("账号是：$account 密码是：$password "),
      ),
    );
  }
}