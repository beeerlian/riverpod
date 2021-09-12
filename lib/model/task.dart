
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist_app/provider/check_box_provider.dart';

class Task extends ChangeNotifier {
  Task({required this.title, required this.desc}) {
    checkBoxValueProvider =
        ChangeNotifierProvider((ref) => this.checkBoxNotifier);
  }

  String title;
  String desc;
  CheckBoxNotifier checkBoxNotifier = CheckBoxNotifier();
  late final checkBoxValueProvider;
}

