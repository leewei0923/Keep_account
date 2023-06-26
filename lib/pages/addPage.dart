import 'dart:ui';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keep_account/databases/db_handler/add_account_handle.dart';
import 'package:keep_account/databases/db_provider.dart';
import 'package:keep_account/databases/models/account_model.dart';
import 'package:keep_account/utils/utils.dart';
import 'package:keep_account/pages/addPage.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPage createState() => _AddPage();
}

class _AddPage extends State<AddPage> {
  // 控制密码是否显示的标志位
  bool _obscureText = true;

  final _focusNode = FocusNode();
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  /*
    * 获取textfiformid数据
    * */

  final TextEditingController appNameControl = TextEditingController();
  final TextEditingController accountControl = TextEditingController();
  final TextEditingController passwordControl = TextEditingController();

  File? _imageFile;
  final _picker = ImagePicker();

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();

    appNameControl.dispose();
    accountControl.dispose();
    passwordControl.dispose();

    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _hasFocus = _focusNode.hasFocus;
    });
  }

  void _onGetTextFieldText() async {
    String appName = appNameControl.text;
    String appAccount = accountControl.text;
    String appPassword = passwordControl.text;

    AccountDBProvider db = AccountDBProvider();

    // 获取当前时间
    DateTime now = DateTime.now();
// 格式化时间
    String formatted =
        '${now.year}-${formTime(now.month)}-${formTime(now.day)} ${formTime(now.hour)}:${formTime(now.minute)}';

    AccountModel accountModel = AccountModel(
      icon: appName,
      appname: appName,
      account: appAccount,
      password: appPassword,
      insertTime: formatted,
      updateTime: formatted,
    );

    db.insert(accountModel);
  }

  /// 获取本地图片
  Future<void> pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  /// 用于判断是否使用自定义图片
  bool _isUsingCustomIcon = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width / window.devicePixelRatio;
    double screenHeigh = window.physicalSize.height / window.devicePixelRatio;

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
          child: Column(
            children: [
              Container(
                width: screenWidth * 0.8,
                margin: EdgeInsets.fromLTRB(
                    screenWidth * 0.1, 40, screenWidth * 0.1, 10),
                child: Row(
                  children: [
                    const Text("自定义图标："),
                    Switch(
                        value: _isUsingCustomIcon,
                        onChanged: (bool v) {
                          setState(() {
                            _isUsingCustomIcon = v;
                          });
                        })
                  ],
                ),
              ),
              //  改变icon
              Visibility(
                  visible: _isUsingCustomIcon,
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 40, 0, 10),
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1.0, color: Color(0xFF28B2A8)),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: _imageFile != null
                                ? Image.file(_imageFile!)
                                : Icon(Icons.photo),
                            color: Color(0xFF28B2A8),
                            iconSize: 60,
                            onPressed: () {
                              pickImageFromGallery();
                            },
                          ),
                        ),
                        const Text(
                          "添加图标",
                          style: TextStyle(color: Color(0xFF28B2A8)),
                        )
                      ],
                    ),
                  )),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 应用名称输入框
                  const Text(
                    "应用名称",
                    style: TextStyle(color: Colors.black54),
                  ),
                  Container(
                    width: screenWidth * 0.85,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      controller: appNameControl,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.app_registration),
                      ),
                    ),
                  ),

                  Text("账号", style: TextStyle(color: Colors.black54)),
                  // 账号输入框
                  Container(
                    width: screenWidth * 0.85,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      controller: accountControl,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                  ),

                  Text("密码", style: TextStyle(color: Colors.black54)),
                  // 密码输入框
                  Container(
                    width: screenWidth * 0.85,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      controller: passwordControl,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(_obscureText
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            (context as Element).markNeedsBuild();
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),

              Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: ElevatedButton(
                    child: Text("保存账号"),
                    onPressed: _onGetTextFieldText,
                  ))
            ],
          ),
        ));
  }
}
