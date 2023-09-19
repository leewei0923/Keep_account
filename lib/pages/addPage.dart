import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:keep_account/provider/change_icon_provider.dart';
import 'package:keep_account/widgets/IconContainer.dart';
import 'package:provider/provider.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPage createState() => _AddPage();
}

class _AddPage extends State<AddPage> {
  GlobalKey _addInfoKey = GlobalKey<FormState>();

  TextEditingController accountC = TextEditingController();
  TextEditingController pwdC = TextEditingController();
  TextEditingController appNameC = TextEditingController();
  TextEditingController notesC = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    accountC.dispose();
    pwdC.dispose();
    appNameC.dispose();
    notesC.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width / window.devicePixelRatio;
    double screenHeight = window.physicalSize.height / window.devicePixelRatio;



    final changeIconModel = Provider.of<ChangeIconModel>(context);

    coverIconWithText() {
      String v = appNameC.value.text;
      changeIconModel.changeIcon( v.length > 2 ? v.substring(0, 2) : v);
    }

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
                "添加账号密码",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                print("值啊:${accountC.value.text}");
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
            Navigator.pop(context, "addPage");
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
                    key: _addInfoKey,
                    child: Column(
                      children: [
                        // 应用名称
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
                                width: screenWidth * 0.1,
                                child: const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "应用:",
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
                                  controller: appNameC,
                                  style: TextStyle(color: Colors.blueAccent),
                                  // controller: _pwdController,
                                  decoration: InputDecoration(
                                      hintText: "应用名称",
                                      border: InputBorder.none),
                                  // 校验用户名
                                  validator: (v) {
                                    return v!.trim().isNotEmpty
                                        ? null
                                        : "应用名称不能为空";
                                  },
                                ),
                              ),
                              GestureDetector(
                                  onTap: coverIconWithText,
                                  child: Container(
                                    width: screenWidth * 0.1,
                                    height: screenWidth * 0.1,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: screenWidth * 0.025),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle, // 设置形状为圆形
                                        color: Colors.grey.shade300,),
                                    child: Center(
                                        child: changeIconModel?.currentIcon
                                                is String
                                            ? Text(changeIconModel?.currentIcon)
                                            : Icon(
                                                changeIconModel.currentIcon)),
                                  ))
                            ],
                          ),
                        ),

                        // 账号
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
                                width: screenWidth * 0.1,
                                child: const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "账号:",
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
                                  controller: accountC,
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
                              Container(
                                  width: screenWidth * 0.1,
                                  height: screenWidth * 0.1,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.025),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle, // 设置形状为圆形
                                  ),
                                  child: Icon(Icons.account_circle))
                            ],
                          ),
                        ),

                        // 密码
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
                                width: screenWidth * 0.1,
                                child: const Align(
                                  child: Text(
                                    "密码:",
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                              ),
                              SizedBox(
                                width: screenWidth * 0.60,
                                child: TextFormField(
                                  textAlign: TextAlign.right,
                                  controller: pwdC,
                                  decoration: const InputDecoration(
                                      hintText: "请输入您的密码",
                                      border: InputBorder.none),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.025),
                                width: screenWidth * 0.1,
                                child: IconButton(
                                  icon: Icon(Icons.remove_red_eye_rounded),
                                  onPressed: () {},
                                ),
                              )
                            ],
                          ),
                        ),

                        // 备注
                        SizedBox(
                          width: screenWidth * 0.85,
                          height: screenHeight * 0.07,
                          child: Row(
                            children: [
                              SizedBox(
                                width: screenWidth * 0.1,
                                child: const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "备注:",
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
                                  controller: notesC,
                                  style: TextStyle(color: Colors.blueAccent),
                                  decoration: InputDecoration(
                                      hintText: "备注内容",
                                      border: InputBorder.none),
                                ),
                              ),
                              Container(
                                  width: screenWidth * 0.1,
                                  height: screenWidth * 0.1,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.025),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle, // 设置形状为圆形
                                  ),
                                  child: Icon(Icons.note))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            IconContainer(
              width: screenWidth * 0.95,
              height: screenHeight * 0.6,
            )
          ],
        ),
      )),
    );
  }
}
