import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:keep_account/widgets/menuItem.dart';

class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  MinePageState createState() => MinePageState();
}

class MinePageState extends State<MinePage> {
  double screenWidth = window.physicalSize.width / window.devicePixelRatio;
  double screenHeight = window.physicalSize.height / window.devicePixelRatio;

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
              child: const Text(
                "我的",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              padding: EdgeInsets.symmetric(vertical: 10),
              width: screenWidth * 0.9,
              alignment: Alignment.topLeft,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10), // 设置圆角
              ),
              child: Column(
                children: [
                  MenuItem(
                    text: "账号",
                    anyWidget: Text("@leewei0923"),
                    onPress: () {},
                  ),
                  MenuItem(
                    text: "昵称",
                    anyWidget: Text("leewei"),
                    onPress: () {},
                  ),
                  MenuItem(
                    text: "注册日期",
                    anyWidget: Text("2023-09-20"),
                    onPress: () {},
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              padding: EdgeInsets.symmetric(vertical: 10),
              width: screenWidth * 0.9,
              alignment: Alignment.topLeft,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10), // 设置圆角
              ),
              child: Column(
                children: [
                  MenuItem(
                    text: "修改密码",
                    anyWidget: Icon(
                      Icons.chevron_right_rounded,
                      size: 30,
                      color: Colors.black.withOpacity(0.7),
                    ),
                    onPress: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
