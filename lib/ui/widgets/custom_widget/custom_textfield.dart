import 'package:flutter/material.dart';
import 'package:todolist_app/ui/widgets/custom_widget/custom_widget.dart';

Widget SearchBarCustom(
  String text, {
  EdgeInsetsGeometry padding = EdgeInsets.zero,
  EdgeInsetsGeometry contentPadding = EdgeInsets.zero,
  TextStyle? style,
  int maxLines = 1,
}) {
  return Container(
    padding: padding,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xFFBABFC7), width: 1)),
    child: TextField(
        style: insideFieldTextStyle(),
        maxLines: maxLines,
        decoration: InputDecoration(
          contentPadding: contentPadding,
          focusedBorder: InputBorder.none,
          hintText: text,
          hintStyle: style == null ? insideFieldTextStyle() : style,
          enabledBorder: InputBorder.none,
        )),
  );
}
