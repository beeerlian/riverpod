import 'dart:io';

import 'package:path_provider/path_provider.dart' ;
import 'package:sqflite/sqflite.dart';
import 'package:todolist_app/model/task.dart';

class DatabaseProvider {
  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database as dynamic;
    } else {
      _database = await initializingDB();
      return _database as dynamic;
    }
  }

  

  initializingDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = documentsDirectory.path + "myTaskDB.db";
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE MyTask ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "title TEXT,"
          "description TEXT,"
          "isDone INTEGER"
          ")");
    });
  }

  addTask(MyTask task)async{
    Database db = await database;
    var response = db.insert("MyTask", task.toMap());
    print("success");
    return response;
  }

 Future<List<MyTask>> getAllTask() async {
    final db = await database;
    var response = await db.query("MyTask");
    List<MyTask> tasks = response.isNotEmpty? response.map((taskJson) => MyTask.fromMap(taskJson)).toList() : [];
    return tasks;
  }
}
