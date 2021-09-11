import 'package:flutter/material.dart';
import 'package:todolist_app/const/const.dart';
import 'package:todolist_app/ui/widgets/custom_widget/custom_button.dart';
import 'package:todolist_app/ui/widgets/custom_widget/custom_textfield.dart';
import 'package:todolist_app/ui/widgets/custom_widget/custom_widget.dart';

import '../../home.dart';

Widget alert(BuildContext context)=> AlertDialog(
  title: myText("Add New Task",
      color: Colors.black, size: 16, bold: FontWeight.w600),
  content: SizedBox(
    width: 364,
    height: 402,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        myText("Task Name",
            color: Colors.black, size: 12, bold: FontWeight.w600),
        SearchBarCustom("Task Name", padding: EdgeInsets.all(8)),
        myText("Task Detail",
            color: Colors.black, size: 12, bold: FontWeight.w600),
        SearchBarCustom("Task Detail",
            maxLines: 10, padding: EdgeInsets.all(8)),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            customButton("cancel", color: Color(0xFF82868B), onPressed: () {Navigator.pop(context);}),
            SizedBox(
              width: 8,
            ),
            customButton("Add", color: primaryColor, onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
            }),
          ],
        )
      ],
    ),
  ),
);
