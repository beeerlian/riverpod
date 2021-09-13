import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist_app/const/data.dart';
import 'package:todolist_app/model/task.dart';
import 'package:todolist_app/ui/home.dart';
import 'package:todolist_app/ui/widgets/alert_dialog/alert_dialog.dart';
import 'package:todolist_app/ui/widgets/custom_widget/custom_widget.dart';

class Item extends ConsumerWidget {
  Item({Key? key, required this.task}) : super(key: key);
  Task task;
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final checkBoxvalue = watch(task.checkBoxValueProvider);
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      height: 84,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 64,
                  width: 3,
                  color: checkBoxvalue.value ? primaryColor : Colors.grey,
                ),
                SizedBox(
                  width: 8,
                ),
                Checkbox(
                    activeColor: primaryColor,
                    value: checkBoxvalue.value,
                    onChanged: (val) {
                      context.read(task.checkBoxValueProvider).changeValue();
                    }),
                Container(
                  width: MediaQuery.of(context).size.width / 1.8,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      myText("Learn Flutter",
                          color: Colors.black, bold: FontWeight.w700),
                      Text(
                        "I'm going to learn flutter from udemy course, I'm going to learn flutter from udemy course",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: insideFieldTextStyle(),
                      )
                    ],
                  ),
                ),
              ],
            ),
            PopupMenuButton(
                padding: EdgeInsets.zero,
                child: Icon(Icons.menu),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => alert(
                              context,
                              judul: "Edit Task",
                              tombolLabel: "Add Changes",
                              onAccept: onDoneAlert(
                                context,
                                icon: Icon(
                                  Icons.done_outline_sharp,
                                  color: Colors.yellow,
                                  size: 60,
                                ),
                                message: myText("Task Successfully Edited",
                                    color: Colors.yellow),
                                action: [
                                  TextButton(
                                    child: myText("Continue", color: Colors.yellow),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Home(),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Icon(Icons.edit),
                            SizedBox(
                              width: 8,
                            ),
                            myText("Edit", color: Colors.black),
                          ],
                        ),
                      ),
                    ),
                    PopupMenuItem(
                        child: InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => confirmationAlert(context));
                      },
                      child: Row(
                        children: [
                          Icon(Icons.delete),
                          SizedBox(
                            width: 8,
                          ),
                          myText("Delete", color: Colors.black),
                        ],
                      ),
                    ))
                  ];
                }),
          ],
        ),
      ),
    );
  }
}
