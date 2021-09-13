import 'package:flutter/material.dart';
import 'package:todolist_app/const/data.dart';
import 'package:todolist_app/ui/widgets/custom_widget/custom_button.dart';
import 'package:todolist_app/ui/widgets/custom_widget/custom_textfield.dart';
import 'package:todolist_app/ui/widgets/custom_widget/custom_widget.dart';

import '../../home.dart';

Widget alert(BuildContext context,
        {required String judul, required String tombolLabel,required Widget onAccept }) =>
    AlertDialog(
      title:
          myText(judul, color: Colors.black, size: 16, bold: FontWeight.w600),
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
                customButton("cancel", color: Color(0xFF82868B), onPressed: () {
                  Navigator.pop(context);
                }),
                SizedBox(
                  width: 8,
                ),
                customButton(tombolLabel, color: primaryColor, onPressed: () {
                  showDialog(context: context, builder: (context)=> onAccept);
                }),
              ],
            )
          ],
        ),
      ),
    );

Widget confirmationAlert(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;

  return AlertDialog(
    content: SizedBox(
      height: screenHeight / 6,
      width: screenWidth / 1.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.warning_rounded,
            color: Colors.red,
            size: 70,
          ),
          myText("Are you sure want to delete this task?", color: Colors.red),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              customButton("Cancel", color: Color(0xFF82868B), onPressed: () {
                Navigator.pop(context);
              }),
              customButton("Yes, deleted it", color: Colors.red, onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Home()));
              })
            ],
          )
        ],
      ),
    ),
  );
}

Widget onDoneAlert(BuildContext context,{required Widget icon,required Widget message, required List<Widget> action}) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;

  return AlertDialog(
    content: SizedBox(
      height: screenHeight / 6,
      width: screenWidth / 1.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          icon,
          message,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: action,
          )
        ],
      ),
    ),
  );
}
