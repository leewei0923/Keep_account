import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keep_account/pages/preSettingValuePage.dart';

class PreSettingCard extends StatelessWidget {
  double screenWidth;
  String title;
  String value;

  PreSettingCard({super.key,
    required this.screenWidth,
    required this.title,
    required this.value});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: screenWidth * 0.85,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: screenWidth * 0.6,
                  child: Text(
                    title,
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.6,
                  child: Text(
                    value,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 15),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(40, 0, 0, 0),
              child: const Icon(
                Icons.chevron_right_rounded,
                color: Colors.grey,
                size: 26,
              ),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                PreSettingValue(
                  thekey: 1,
                  title: title,
                  value: value,
                ),
          ),
        );
      },
    );
  }
}
