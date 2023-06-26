import 'package:flutter/material.dart';

class MenuItem extends StatefulWidget {
  late String text;
  late Widget? anyWidget;
  late Function? onPress;


  MenuItem(
      {super.key,
      required this.text,
      this.anyWidget,
      this.onPress});

  @override
  MenuItemState createState() => MenuItemState();
}

class MenuItemState extends State<MenuItem> {
  late String textString;
  late Widget anyWidget;
  late Function onPress;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    textString = widget.text;
    anyWidget = widget.anyWidget!;
    onPress = widget.onPress!;

    return Material(
      child: Ink(
        color: Colors.white,
        child: InkWell(
          onTap: () => {onPress()},
          child: Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      textString,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Expanded(flex: 0, child: anyWidget)
                ]),
          ),
        ),
      ),
    );
  }
}
