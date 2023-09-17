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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width / window.devicePixelRatio;
    double screenHeight = window.physicalSize.height / window.devicePixelRatio;

    final changeIconModel = Provider.of<ChangeIconModel>(context);

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
                onPressed: () {},
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
        body: Container(
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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
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
                                    style: TextStyle(color: Colors.blueAccent),
                                    // controller: _pwdController,
                                    decoration: InputDecoration(
                                        hintText: "您的账号",
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
                                        color: Colors.grey),
                                    child: changeIconModel?.currentIcon is String
                                        ? Text(changeIconModel?.currentIcon)
                                        : Icon(changeIconModel.currentIcon))
                              ],
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.85,
                            height: screenHeight * 0.07,
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
                                    // controller: _pwdController,
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
        ));
  }
}
