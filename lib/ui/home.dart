import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist_app/const/data.dart';
import 'package:todolist_app/model/task.dart';
import 'package:todolist_app/provider/db_provider.dart';
import 'package:todolist_app/ui/widgets/alert_dialog/alert_dialog.dart';
import 'package:todolist_app/ui/widgets/custom_widget/custom_widget.dart';
import 'package:todolist_app/ui/widgets/item/item.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  double iconSize = 24;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: primaryColor,
        body: ListView(
          children: [
            Container(
              color: primaryColor,
              padding:
                  EdgeInsets.only(left: 29.3, top: 20, right: 29.3, bottom: 20),
              height: 160,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        onPressed: () {
                          showMenu(
                              context: context,
                              position: RelativeRect.fromLTRB(300, 100, 5, 0),
                              items: [
                                PopupMenuItem(
                                    child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    myText("Sort By",
                                        size: 16,
                                        bold: FontWeight.bold,
                                        color: Colors.black),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Divider(
                                      height: 2,
                                      color: Colors.grey.shade700,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.circle,
                                          color: primaryColor,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        myText("Finished", color: Colors.black),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.circle,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        myText("Unfinished",
                                            color: Colors.black),
                                      ],
                                    )
                                  ],
                                )),
                              ]);
                        },
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
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8))))),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => alert(context,
                                  tombolLabel: "Add",
                                  judul: "Add New Task", onAccept: () {
                                DatabaseProvider.db.addTask(MyTask(
                                    title: "Learn Flutter",
                                    description:
                                        "Im going to learn flutter from BSO Android UIN SGD",
                                    isDone: false));
                                showDialog(
                                  context: context,
                                  builder: (context) => onDoneAlert(
                                    context,
                                    icon: Icon(
                                      Icons.done_outline_sharp,
                                      color: Colors.green,
                                      size: 60,
                                    ),
                                    message: myText("Task Successfully Added",
                                        color: Colors.green),
                                    action: [
                                      TextButton(
                                        child: myText("Continue",
                                            color: Colors.green),
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Home(),
                                            ),
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                );
                              }),
                            );
                          },
                          child:
                              myText("Add New", size: 12, color: primaryColor))
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
              constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 160 - 88),
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: FutureBuilder<List<MyTask>>(
                  future: DatabaseProvider.db.getAllTask(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      print("snapshot connection loading");
                      return CircularProgressIndicator();
                    }
                    if (snapshot.hasData) {
                      print("snapshot has data");
                      return Column(
                        children: snapshot.data!
                            .map((task) => Item(
                                  task: task,
                                ))
                            .toList(),
                      );
                    } else {
                      print("snapshot null");
                      return Center(
                        child: ElevatedButton(
                            onPressed: () {
                              DatabaseProvider.db.addTask(MyTask(
                                  id: snapshot.hasData
                                      ? snapshot.data!.length + 1
                                      : 1,
                                  title: "Learn Flutter",
                                  description:
                                      "Im going to learn flutter from BSO Android UIN SGD",
                                  isDone: false));
                            },
                            child: myText("Add")),
                      );
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
