import 'package:flutter/material.dart';
import 'package:todolist_app/model/task.dart';


final Color primaryColor = Colors.indigo.shade500;

List<Task> tasks = [
  for (var i = 0; i < 20; i++)
    Task(
      title: "Learn Flutter",
      desc: "Im going to learn flutter from BSO Android UIN SGD",
    )
];
