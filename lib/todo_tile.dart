import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'my_state.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final ToDoItem toDoItem;

  ToDoTile({
    super.key,
    required this.toDoItem,
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
            GestureDetector(
              onTap: () {
                context.read<MyState>().checkBoxChanged(toDoItem);
              },
              child: !toDoItem.taskCompleted
              ? const Icon(
                Icons.check_box_outline_blank,
                color: Colors.black,
              )

              : const Icon(
                Icons.check_box,
                color: Colors.pink,
              ),
            ),
      
            //Task name
            Expanded(
              child: Padding(padding: const EdgeInsets.all(8.0),
              child: Text(
              toDoItem.taskName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                decoration: toDoItem.taskCompleted 
                ? TextDecoration.lineThrough
                : TextDecoration.none,
              ),
            )
            ),
            ),
            //closebutton to delete task
            IconButton(onPressed: () {
              context.read<MyState>().deleteTask(toDoItem);
            },
            icon: Icon(Icons.close))
          ],
        ),
      ),
    );
  }
}