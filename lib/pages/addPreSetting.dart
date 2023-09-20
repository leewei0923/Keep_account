import 'dart:ui';
import 'package:flutter/material.dart';

class AddPreSettingPage extends StatefulWidget {
  @override
  _AddPreSettingPage createState() => _AddPreSettingPage();
}

class _AddPreSettingPage extends State<AddPreSettingPage> {
  GlobalKey _preSetting = GlobalKey<FormState>();

  TextEditingController preNameC = TextEditingController();
  TextEditingController preValueC = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    preValueC.dispose();
    preNameC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width / window.devicePixelRatio;
    double screenHeight = window.physicalSize.height / window.devicePixelRatio;


    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                "添加预设信息",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                print("值啊:${preNameC.value.text}");
              },
              child: const Text(
                "保存",
                style: TextStyle(color: Colors.black),
              ))
        ],
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, "preSetting");
          },
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(color: Colors.grey.shade200),
        child: Column(
          children: [
            Container(
              width: screenWidth * 0.95,
              margin: const EdgeInsets.symmetric(vertical: 20),
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "填写账号密码信息",
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ),
                  Form(
                    key: _preSetting,
                    child: Column(
                      children: [
                        // 预设名称
                        Container(
                          width: screenWidth * 0.85,
                          height: screenHeight * 0.07,
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(
                              color: Colors.grey.shade200, // 设置边框颜色
                              width: 1, // 设置边框宽度
                            ),
                          )),
                          child: Row(
                            children: [
                              SizedBox(
                                width: screenWidth * 0.2,
                                child: const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "预设名称:",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: screenWidth * 0.60,
                                child: TextFormField(
                                  cursorColor: Colors.blueAccent,
                                  cursorHeight: 30,
                                  textAlign: TextAlign.right,
                                  controller: preNameC,
                                  style: TextStyle(color: Colors.blueAccent),
                                  // controller: _pwdController,
                                  decoration: InputDecoration(
                                      hintText: "应用名称",
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // 预设值
                        Container(
                          width: screenWidth * 0.85,
                          height: screenHeight * 0.07,
                          child: Row(
                            children: [
                              SizedBox(
                                width: screenWidth * 0.2,
                                child: const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "预设值:",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: screenWidth * 0.60,
                                child: TextFormField(
                                  cursorColor: Colors.blueAccent,
                                  cursorHeight: 30,
                                  textAlign: TextAlign.right,
                                  controller: preValueC,
                                  style: TextStyle(color: Colors.blueAccent),
                                  // controller: _pwdController,
                                  decoration: InputDecoration(
                                      hintText: "您的账号",
                                      border: InputBorder.none),
                                  // 校验用户名
                                  validator: (v) {
                                    return v!.trim().isNotEmpty
                                        ? null
                                        : "用户名不能为空";
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
