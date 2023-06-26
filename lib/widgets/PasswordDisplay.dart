import 'package:flutter/material.dart';

class PasswordDisplay extends StatefulWidget {
  final String password;
  double width;
  double height;

  PasswordDisplay(
      {required this.password, required this.width, required this.height});

  @override
  _PasswordDisplayState createState() => _PasswordDisplayState();
}

class _PasswordDisplayState extends State<PasswordDisplay> {
  final TextEditingController _controller = TextEditingController();
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _controller.text = widget.password;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.width,
        height: widget.height,
        child: TextFormField(
          controller: _controller,
          obscureText: _obscureText,
          readOnly: true,

          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                size: 18,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
          ),
        ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}