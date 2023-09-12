import 'package:flutter/material.dart';

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                "我的",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: Center(child: Text("")),
    );
  }
}
