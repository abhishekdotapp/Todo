import 'package:flutter/material.dart';
import 'package:myapp/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void check() {
    print('hwllo');
  }

  void checkBoxClicked(bool? value, int index) {
    setState(() {
      todolist[index][1] = !todolist[index][1];
    });
  }

  List todolist = [
    ["do dsa problem", true],
    ["learn flutter", false],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("ToDo",
            style: TextStyle(
              color: Colors.white,
            )),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: check,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: todolist.length,
        itemBuilder: (context, index) {
          return TodoTile(
              taskname: todolist[index][0],
              taskComplete: todolist[index][1],
              onChanged: (value) => checkBoxClicked(value, index));
        },
      ),
    );
  }
}
