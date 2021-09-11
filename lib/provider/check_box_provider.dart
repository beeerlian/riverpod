import 'package:flutter/material.dart';
import 'package:todolist_app/const/const.dart';

class CheckBoxNotifier extends ChangeNotifier {
  bool _value = false;
  bool get value => _value;

  void changeValue(){
    _value = !_value;
    notifyListeners();
  }
}