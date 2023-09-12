import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CopyPaste{

  /// 复制内容
  static copy(String? text){
    Clipboard.setData(ClipboardData(text: text ?? ''));
    Fluttertoast.showToast(
        msg: "复制了 $text !",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        timeInSecForIosWeb: 1,
        fontSize: 16.0
    );
  }

  /// 获取内容
  static Future<String> paste() async{
    var clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
    return clipboardData?.text ?? '';
  }
}

