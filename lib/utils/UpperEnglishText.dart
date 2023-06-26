String UpperFirstWordEnglish(String string) {

  String str = "";

  if(isChinese(string)) {
    return string;
  } else if(isEnglish(string)) {
    if (string.isEmpty) {
      return string;
    }
    str = string[0].toUpperCase() + string.substring(1);
  }

  return str;

}

bool isChinese(String char) {
  return char.codeUnitAt(0) >= 0x4E00 && char.codeUnitAt(0) <= 0x9FA5;
}

bool isEnglish(String char) {
  int codeUnit = char.codeUnitAt(0);
  return (codeUnit >= 0x0041 && codeUnit <= 0x005A) || (codeUnit >= 0x0061 && codeUnit <= 0x007A);
}