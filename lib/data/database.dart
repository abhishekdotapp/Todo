import 'package:hive_flutter/hive_flutter.dart';

class todoDatabase {
  List todoList = [];
  final _myBox = Hive.box('myBox');

  void createInitialData() {
    todoList = [
      ["practise dsa", false],
      ["learn flutter", false],
    ];
  }

  void loadData() {
    todoList = _myBox.get("TODOLIST");
  }

  void updateDatabase() {
    _myBox.put("TODOLIST", todoList);
  }
}
