import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String taskname;
  final bool taskComplete;
  Function(bool?)? onChanged;
  TodoTile({
    super.key,
    required this.taskname,
    required this.taskComplete,
    required this.onChanged,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:25.0,right:25.0,top:25.0),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Checkbox(value: taskComplete, onChanged: onChanged, activeColor:Colors.black,),
            Text(taskname,
            style: TextStyle(
              decoration: !taskComplete ? TextDecoration.none : TextDecoration.lineThrough,
            ),),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.blue[400],
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
