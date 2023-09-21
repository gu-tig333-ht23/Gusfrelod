import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'my_state.dart';
import 'todo_tile.dart';

class ViewMyList extends StatelessWidget {
  const ViewMyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyState>(
      builder: (context, value, child) => ListView.builder(
        itemCount: value.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            toDoItem: value.toDoList[index],
          );
        },
      ),
    );
  }
}