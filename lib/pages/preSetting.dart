import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:keep_account/databases/db_handler/handle_preset.dart';
import 'package:keep_account/databases/models/preset_model.dart';
import 'package:keep_account/widgets/preSettingCard.dart';

class PreSettingPage extends StatefulWidget {
  const PreSettingPage({super.key});

  @override
  PreSettingPageState createState() => PreSettingPageState();
}

class PreSettingPageState extends State<PreSettingPage> {
  final GlobalKey<ScaffoldState> settingScaffoldKey = GlobalKey<ScaffoldState>();

  late List<PresetModel> presetList =  [];

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
          onPressed: () =>
              settingScaffoldKey.currentState?.showBottomSheet((context) =>
                  _buildBottomSheet(context)),
          child: Icon(Icons.add),
    ),);
  }
}

Container _buildBottomSheet(BuildContext context) {
  return Container(
    height: 300,
    padding: const EdgeInsets.all(2.0),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.blue, width: 2.0),
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: ListView(
      children: <Widget>[
        const ListTile(title: Text('编辑内容')),
        const TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            icon: Icon(Icons.title),
          ),
        ),
        const TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            icon: Icon(Icons.numbers),
          ),
        ),
        Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.save,
                  color: Colors.white,
                ),
                label: const Text(
                  '保存',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      return Colors.blue; // 按钮默认的颜色
                    },
                  ),
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                label: const Text(
                  '关闭',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      return Colors.red.withOpacity(0.8); // 按钮默认的颜色
                    },
                  ),
                ),
                onPressed: () => Navigator.pop(context),
              ),
            )
          ],
        ),
      ],
    ),
  );
}
