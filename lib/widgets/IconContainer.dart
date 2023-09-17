import 'package:flutter/material.dart';
import 'package:keep_account/common/appIcons.dart';
import 'package:keep_account/provider/change_icon_provider.dart';
import 'package:provider/provider.dart';

class IconContainer extends StatefulWidget {
  const IconContainer({Key? key, required this.width, required this.height})
      : super(key: key);
  final double width;
  final double height;

  @override
  IconContainerState createState() => IconContainerState();
}

/// 用于展示icon的列表
class IconContainerState extends State<IconContainer> {
  int curIndex = 0;

  void _onSwitch(int index) {
    setState(() {
      curIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> iconTitles = [
      '视频播放',
      '咨询阅读',
      '摄影美图',
      '社交通讯',
      '教育学习',
      '购物优惠',
      '金融理财',
      '实用工具',
      '便捷生活',
      '旅游出行',
      '交通导航'
    ];

    List<IconData> iconsList = [
      AppIcons.qq,
      AppIcons.wechat,
      AppIcons.alipay,
      AppIcons.baidu,
      AppIcons.bilibili,
      AppIcons.github,
      AppIcons.Google
    ];

    final changeIconModel = Provider.of<ChangeIconModel>(context);

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Container(
            height: 70,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                color: Colors.grey.shade200, // 设置边框颜色
                width: 1, // 设置边框宽度
              ),
            )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "分类图标",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.grey.shade600),
                ),
                Text(
                  "图标从下表选择",
                  style: TextStyle(fontSize: 15, color: Colors.grey.shade500),
                )
              ],
            ),
          ),
          Row(
            children: [
              Container(
                  width: widget.width * 0.3,
                  height: widget.height - 70,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                  ),
                  child: ListView.builder(
                    itemCount: iconTitles.length,
                    itemBuilder: (BuildContext context, int i) {
                      return GestureDetector(
                        onTap: () => _onSwitch(i),
                        child: Container(
                          alignment: Alignment.center,
                          width: widget.width * 0.3,
                          height: 50,
                          color:
                              i == curIndex ? Colors.white : Colors.transparent,
                          child: Text(iconTitles[i]),
                        ),
                      );
                    },
                  )),
              Container(
                  width: widget.width * 0.7,
                  height: widget.height - 70,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, //每行三列
                      childAspectRatio: 1.0, //显示区域宽高相等
                    ),
                    itemCount: iconsList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          changeIconModel.changeIcon(iconsList[index]);
                        },
                        child: Icon(iconsList[index]),
                      );
                    },
                  ))
            ],
          )
        ],
      ),
    );
  }
}
