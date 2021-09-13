import 'package:flutter/material.dart';

TextStyle insideFieldTextStyle({double size = 12}) {
  return TextStyle(
      fontSize: size, color: Color(0xFF82868B), fontWeight: FontWeight.w300);
}

Text myText(String data,
    {double size = 14,
    Color color = Colors.white,
    FontWeight bold = FontWeight.normal}) {
  return Text(
    data,
    style: TextStyle(fontSize: size, color: color, fontWeight: bold),
  );
}



