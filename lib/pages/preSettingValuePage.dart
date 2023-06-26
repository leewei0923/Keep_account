import 'package:flutter/material.dart';

class PreSettingValue extends StatefulWidget {
  late int thekey;
  late String title;
  late String value;

  PreSettingValue({
    required this.thekey,
    required this.title,
    required this.value,
  });

  @override
  PreSettingValueState createState() => PreSettingValueState();
}

class PreSettingValueState extends State<PreSettingValue> {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
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
                this.widget.title,
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
        child: SelectableText(
          this.widget.value,
          style: const TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
            height: 60,
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: TextButton(
                      child: Text(
                        "删除",
                        style: TextStyle(
                            color: Colors.blueAccent.withOpacity(0.8),
                            fontSize: 16),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    child: Text(
                      "编辑",
                      style: TextStyle(
                          color: Colors.blueAccent.withOpacity(0.8),
                          fontSize: 16),
                    ),
                    onPressed: () => this
                        .scaffoldkey
                        .currentState
                        ?.showBottomSheet((ctx) => _buildBottomSheet(ctx)),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

Container _buildBottomSheet(BuildContext context) {
  return Container(
    height: 300,
    padding: const EdgeInsets.all(8.0),
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
            border: OutlineInputBorder(),
            icon: Icon(Icons.edit),
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
