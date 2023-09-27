import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'my_button.dart';
import 'my_state.dart';


class MyFilter extends StatelessWidget {

  MyFilter({
    super.key,
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
            context.read<MyState>().setFilter('all');
            Navigator.of(context).pop();
          }),

          const SizedBox(height: 4),

          //filter done
          MyButton(text: "DONE", onPressed: () {
            context.read<MyState>().setFilter('done');
            Navigator.of(context).pop();
          }),

          const SizedBox(height: 4),

          //filter undone
          MyButton(text: "UNDONE", onPressed: () {
            context.read<MyState>().setFilter('undone');
            Navigator.of(context).pop();
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