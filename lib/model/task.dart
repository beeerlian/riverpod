import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist_app/provider/check_box_provider.dart';

class Task extends ChangeNotifier {
  Task({required this.title, required this.desc}) {
    checkBoxValueProvider =
        ChangeNotifierProvider((ref) => this.checkBoxNotifier);
  }

  int? id;
  String title;
  String desc;
  CheckBoxNotifier checkBoxNotifier = CheckBoxNotifier();
  late final checkBoxValueProvider;
}

class MyTask {
  int? id;
  String title;
  String description;
  bool? isDone;
  CheckBoxNotifier checkBoxNotifier = CheckBoxNotifier();
  late final checkBoxValueProvider;

  MyTask(
      {this.id,
      required this.title,
      required this.description,
      this.isDone}) {
    checkBoxValueProvider =
        ChangeNotifierProvider((ref) => this.checkBoxNotifier);
  }

  factory MyTask.fromMap(Map<String, dynamic> myTask) => MyTask(
      id: myTask['id'],
      title: myTask['title'],
      description: myTask['description'],
      isDone: myTask['isDone'] == 1 ? true : false);

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "isDone": isDone == true ? 1 : 0
      };
}

MyTask taskFromMap(String json) {
  final jsonData = jsonDecode(json);
  return MyTask.fromMap(jsonData);
}

String taskToMap(MyTask task) {
  final jsonData = task.toMap();
  return jsonEncode(jsonData);
}
