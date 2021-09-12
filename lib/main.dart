import 'package:flutter/material.dart';
import 'package:todolist_app/const/data.dart';
import 'package:todolist_app/ui/home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        theme: ThemeData(
            // primaryColor: primaryColor,
            iconTheme: IconThemeData(color: primaryColor)),
        home: Home(),
      ),
    );
  }
}
