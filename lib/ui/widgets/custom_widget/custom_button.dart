import 'package:flutter/material.dart';
import 'package:todolist_app/ui/widgets/custom_widget/custom_widget.dart';

Widget customButton(String data,
        {required Function() onPressed,
        Color color = Colors.blue,
        double width = 86,
        double height = 36}) =>
    ElevatedButton(
        style: ButtonStyle(
            fixedSize: MaterialStateProperty.all<Size>(Size(width, height)),
            backgroundColor: MaterialStateProperty.all<Color>(color),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))))),
        onPressed: onPressed,
        child: myText(
          data,
          size: 12,
        ));
