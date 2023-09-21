import 'package:flutter/material.dart';

class ToDoItem {
  String taskName;
  bool taskCompleted;

  ToDoItem({
    required this.taskName,
    required this.taskCompleted,
  });
}


// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final ToDoItem toDoItem;
  Function(bool?)? onChanged;
  Function()? onDelete;

  ToDoTile({
    super.key, 
    required this.toDoItem,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [

            //Checkbox 
            Checkbox(
              value: toDoItem.taskCompleted, 
              onChanged: onChanged,
              ),

            //Task name
            Expanded(child: Text(
              toDoItem.taskName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                decoration: toDoItem.taskCompleted 
                ? TextDecoration.lineThrough
                : TextDecoration.none,
              ),
            )),
            //closebutton to delete task
            IconButton(onPressed: () {
                onDelete!();
            },
            icon: Icon(Icons.close))
          ],
        ),
      ),
    );
  }
}