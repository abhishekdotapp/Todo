import 'package:flutter/material.dart';
import 'package:myapp/utils/todo_tile.dart';
import 'package:myapp/utils/dialog_box.dart'

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void check() {
    print('hwllo');
  }
  final _controller = TextEditingController();
  void checkBoxClicked(bool? value, int index) {
    setState(() {
      todolist[index][1] = !todolist[index][1];
    });
  }

  void saveNewTask(){
    setState((){
      todoList.add([_controller.text,false]);
      _controller.clear();
    })
    Navigator.of(context).pop();
  }

  void createNewTask(){
    showDialog(context: context, builder: (context){
      return DialogBox(controller: _controller, onSave: saveNewTask, onCancel: () => Navigator.of(context).pop());
    },);
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
