import 'package:flutter/material.dart';

class CheckBoxNotifier extends ChangeNotifier {
  bool _value = false;
  bool get value => _value;

  void changeValue(){
    _value = !_value;
    notifyListeners();
  }
}