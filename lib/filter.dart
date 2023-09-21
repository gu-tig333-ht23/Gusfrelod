import 'package:flutter/material.dart';
import 'my_button.dart';

enum TaskFilter {
  All,
  Done,
  Undone,
}

class MyFilter extends StatelessWidget {
  final Function(TaskFilter) onFilterSelected;

  MyFilter({
    super.key,
    required this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Filter'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //filter all
          MyButton(text: "ALL", onPressed: () {
            onFilterSelected(TaskFilter.All);
          }),

          const SizedBox(height: 4),

          //filter done
          MyButton(text: "DONE", onPressed: () {
            onFilterSelected(TaskFilter.Done);

          }),

          const SizedBox(height: 4),

          //filter undone
          MyButton(text: "UNDONE", onPressed: () {
            onFilterSelected(TaskFilter.Undone);

          }),
        ],
      ),
      actions: <Widget>[
        const SizedBox(height: 12),
        MyButton(
          text: "Cancel",
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
} 