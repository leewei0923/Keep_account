import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:keep_account/databases/models/preset_model.dart';
import 'package:keep_account/pages/addPreSetting.dart';
import 'package:keep_account/widgets/preSettingCard.dart';

class PreSettingPage extends StatefulWidget {
  const PreSettingPage({super.key});

  @override
  PreSettingPageState createState() => PreSettingPageState();
}

class PreSettingPageState extends State<PreSettingPage> {
  final GlobalKey<ScaffoldState> settingScaffoldKey = GlobalKey<
      ScaffoldState>();

  late List<PresetModel> presetList = [];

  void onInitLoad() async {
    // final preset = PresetProvider()
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width / window.devicePixelRatio;
    double screenHeigh = window.physicalSize.height / window.devicePixelRatio;

    return Scaffold(
      key: settingScaffoldKey,
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
                "预先设置",
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
        width: screenWidth * 1,
        decoration: BoxDecoration(color: Colors.white70),
        child: Column(
          children: [
            SizedBox(
              width: screenWidth * 0.9,
              height: MediaQuery
                  .of(context)
                  .size
                  .height - 24 - 56 - 56,
              child: ListView.builder(
                  itemCount: 30,
                  itemBuilder: (BuildContext context, int index) {
                    return PreSettingCard(
                      screenWidth: screenWidth,
                      title: "手机号",
                      value: "17352952547",
                    );
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "添加预设内容",
        onPressed: () async {
          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AddPreSettingPage()
              ));
        },

        child: const Icon(Icons.add),
      ),);
  }
}

