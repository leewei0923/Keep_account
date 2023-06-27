import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keep_account/utils/iconMap.dart';
import 'package:keep_account/widgets/accountIcon.dart';

class PasswordDetails extends StatelessWidget {
  late final String account;
  late final String password;
  late final String appname;

  PasswordDetails({
    required this.appname,
    required this.password,
    required this.account,
  });

  double screenWidth = window.physicalSize.width / window.devicePixelRatio;
  double screenHeight = window.physicalSize.height / window.devicePixelRatio;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: 140,
          margin: const EdgeInsets.fromLTRB(40, 0, 0, 0),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                // color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      blurRadius: 10,
                      offset: const Offset(0, 10),
                      blurStyle: BlurStyle.inner,
                      spreadRadius: -6),
                ],
              ),
              child: Text(
                appname,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              width: screenWidth * 0.9,
              height: screenWidth * 0.55,
              decoration: BoxDecoration(
                  color: Colors.blue.shade400,
                  borderRadius: BorderRadius.circular(10)),
              child: Stack(
                children: [
                  // SizedBox(
                  //   width: screenWidth * 0.9,
                  //   height: screenWidth * 0.55,
                  //   child: const Image(
                  //     fit: BoxFit.cover,
                  //     image: AssetImage("assets/images/other/bg.jpg"),
                  //   ),
                  // ),
                  // 毛玻璃效果
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                    child: Container(
                      color: Colors.white.withOpacity(0.0),
                      width: screenWidth * 0.9,
                      height: screenWidth * 0.55,
                    ),
                  ),
                  Positioned(
                      top: 25,
                      right: 25,
                      child: Text(
                        appname,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                  Positioned(
                      top: 100,
                      left: 20,
                      child: Text(
                        account,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Color(0xFF353535),
                            fontWeight: FontWeight.w500),
                      )),
                  Positioned(
                      bottom: 50,
                      left: 20,
                      child: Text(
                        "密码：$password",
                        style: const TextStyle(
                            fontSize: 15, color: Color(0xFF2d2d2d)),
                      )),
                  Positioned(
                    bottom: 20,
                    right: 25,
                    child: (iconMap[appname] is Widget)
                        ? FaIcon(iconMap[appname], color: Colors.white,)
                        : AccountIcon(iconName: appname),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
