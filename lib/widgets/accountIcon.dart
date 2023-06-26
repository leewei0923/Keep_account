import 'package:flutter/material.dart';
import 'package:keep_account/utils/iconMap.dart';

class AccountIcon extends StatelessWidget {
  final String iconName;

  const AccountIcon({Key? key, required this.iconName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (iconMap.containsKey(iconName)) {
      IconData iconData = iconMap[iconName] ?? Icons.error;
      return Icon(iconData);
    } else {
      return Center(
        child: Text(
          iconName.substring(0, 1),
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      );
    }
  }
}
