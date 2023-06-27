import 'package:flutter/material.dart';
import 'package:keep_account/pages/passwordDetails.dart';
import 'package:keep_account/provider/pop_menu_provider.dart';
import 'package:keep_account/utils/UpperEnglishText.dart';
import 'package:keep_account/utils/colors.dart';
import 'package:keep_account/widgets/PasswordDisplay.dart';
import 'package:keep_account/widgets/accountIcon.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';

/**
 * 密码信息盒
 * icon
 */
class PasswordInfoBox extends StatefulWidget {
  String icon;
  String appName;
  String account;
  String password;
  double width;
  double height;
  int id;

  PasswordInfoBox(
      {required this.id,
      required this.account,
      required this.appName,
      required this.password,
      required this.icon,
      required this.width,
      required this.height,
      super.key});

  @override
  _PasswordInfoBox createState() => _PasswordInfoBox();
}

class _PasswordInfoBox extends State<PasswordInfoBox> {
  late String iconStr;
  late String accountStr;
  late String password;
  late String appNameStr;
  late int accountId;

  bool isSelected = false; // 长按该item变色

  @override
  void initState() {
    super.initState();
    iconStr = widget.icon;
    accountStr = widget.account;
    password = widget.password;
    appNameStr = widget.appName;
    accountId = widget.id;
  }

  @override
  Widget build(BuildContext context) {
    PopMenuProvider menuProvider = Provider.of<PopMenuProvider>(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PasswordDetails(
                appname: appNameStr,
                account: accountStr,
                password: password),
          ),
        );
      },
      onLongPressStart: (LongPressStartDetails details) async {
        // 检查设备是否支持震动
        // 检查设备是否支持震动
        // bool? canVibrate = await Vibration?.hasCustomVibrationsSupport();
        Vibration.vibrate(duration: 50);

        final overlay =
            Overlay.of(context)?.context.findRenderObject() as RenderBox;

        setState(() {
          isSelected = true;
        });

        final RelativeRect position = RelativeRect.fromRect(
          Rect.fromPoints(
            details.globalPosition,
            details.globalPosition,
          ),
          Offset.zero & overlay.size,
        );
        showMenu(
          context: context,
          position: position,
          items: <PopupMenuEntry>[
            const PopupMenuItem(
              value: 'onTop',
              child: Text('置顶'),
            ),
            const PopupMenuItem(
              value: 'onHide',
              child: Text('不显示'),
            ),
            const PopupMenuItem(
              value: 'onDelete',
              child: Text('删除'),
            ),
          ],
        ).then((value) {
          menuProvider.changeMenu(value, accountId);
        });
      },
      child: Container(
        width: widget.width,
        height: 120,
        decoration: BoxDecoration(
          // color: isSelected ? CustomColors.bg300: CustomColors.bg300,
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Container(
                width: 45,
                height: 45,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                decoration: BoxDecoration(
                    border: Border.all(width: 3.0, color: Colors.white),
                    shape: BoxShape.circle,
                    color: Colors.white),
                child: AccountIcon(iconName: iconStr,)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  UpperFirstWordEnglish(appNameStr),
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF5E5F63)),
                ),
                Text(
                  accountStr,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF939395)),
                ),
                // 脱敏密码
                PasswordDisplay(
                    password: password, width: widget.width * 0.5, height: 30)
              ],
            )
          ],
        ),
      ),
    );
  }
}
