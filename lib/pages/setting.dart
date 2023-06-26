import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:keep_account/widgets/menuItem.dart';

class SettingPage extends StatefulWidget {
  SettingPage();

  @override
  SettingPageState createState() => SettingPageState();
}

class SettingPageState extends State<SettingPage> {
  double screenWidth = window.physicalSize.width / window.devicePixelRatio;
  double screenHeight = window.physicalSize.height / window.devicePixelRatio;

  /*
  * 配置专区
  * */
  bool isVibration = false;

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
                "设置",
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
        decoration: const BoxDecoration(
          color: Color(0XFFF5F6F8),
        ),
        width: screenWidth,
        height: screenHeight,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
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
                    text: "按键震动",
                    anyWidget: Switch(
                        value: isVibration,
                        onChanged: (bool v) {
                          setState(() {
                            isVibration = v;
                          });
                        }),
                    onPress: () {},
                  ),
                  MenuItem(
                    text: "密码保护",
                    anyWidget: Icon(
                      Icons.chevron_right_rounded,
                      size: 30,
                      color: Colors.black.withOpacity(0.7),
                    ),
                    onPress: () {},
                  )
                ],
              ),
            ),
            //  数据导入导出
            Container(
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
                    text: "数据导入",
                    anyWidget: const Text(""),
                    onPress: () {},
                  ),
                  MenuItem(
                    text: "数据导出",
                    anyWidget: const Text(""),
                    onPress: () {},
                  ),
                  MenuItem(
                    text: "清除数据",
                    anyWidget: const Text(""),
                    onPress: () {},
                  ),
                ],
              ),
            ),

            //  其他设置
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              width: screenWidth * 0.9,
              alignment: Alignment.topLeft,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10), // 设置// 圆角
              ),
              child: Column(
                children: [
                  MenuItem(
                    text: "使用指南",
                    anyWidget: const Text(""),
                    onPress: () {},
                  ),
                  MenuItem(
                    text: "意见反馈",
                    anyWidget: const Text(""),
                    onPress: () {},
                  ),
                  MenuItem(
                    text: "隐私政策",
                    anyWidget: const Text(""),
                    onPress: () {},
                  ),
                  MenuItem(
                    text: "版本信息",
                    anyWidget: const Text("V1.0.0"),
                    onPress: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
