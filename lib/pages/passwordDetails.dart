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
          title: Container(
            width: 140,
            margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  // color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        blurRadius: 10,
                        offset: Offset(0, 10),
                        blurStyle: BlurStyle.inner,
                        spreadRadius: -6),
                  ],
                ),
                child: Text(
                  appname,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  overflow: TextOverflow.ellipsis,
                ),
              ),

            ),
          ),
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
      ),
      body: Center(
        child: Text("账号是：$account 密码是：$password "),
      ),
    );
  }
}