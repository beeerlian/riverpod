import 'package:flutter/material.dart';
import 'package:todolist_app/const/const.dart';
import 'package:todolist_app/ui/widgets/alert_dialog/alert_dialog.dart';
import 'package:todolist_app/ui/widgets/custom_widget/custom_widget.dart';
import 'package:todolist_app/ui/widgets/item/item.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  double iconSize = 24;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: ListView(
        children: [
          Container(
            color: primaryColor,
            padding:
                EdgeInsets.only(left: 29.3, top: 38, right: 29.3, bottom: 24),
            height: 178,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.android,
                        size: iconSize,
                        color: Colors.white,
                      ),
                    ),
                    myText("My Todolist", size: 16, bold: FontWeight.bold),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.sort,
                        size: iconSize,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        myText("Total Task", size: 16),
                        SizedBox(
                          height: 10,
                        ),
                        myText("24 Task", bold: FontWeight.w100)
                      ],
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            fixedSize:
                                MaterialStateProperty.all<Size>(Size(86, 36)),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))))),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => alert(context));
                        },
                        child: myText("Add New", size: 12, color: primaryColor))
                  
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.white),
            height: 88,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              height: 38,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color(0xFFBABFC7), width: 1)),
              child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 8),
                      focusedBorder: InputBorder.none,
                      hintText: "Search by task name...",
                      hintStyle: insideFieldTextStyle(size: 14),
                      enabledBorder: InputBorder.none,
                      suffixIcon: Icon(Icons.search))),
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [for (var i = 0; i < tasks.length; i++) Item(task : tasks[i])],
            ),
          )
        ],
      ),
    );
  }
}
