import 'package:flutter/material.dart';
import 'package:test/pages/addtask.dart';
import 'package:test/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
   
}

class _HomePageState extends State<HomePage> {
  void _navigateToNextScreen(BuildContext context) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddTask()));

    }

//list of to do tasks 
List toDoList = [
["Leva livet", false],
["Krama Rebecka", false],
["Krama Amanda", false],
];

//Checkbox 
void checkBoxChanged(bool? value, int index) {
  setState(() {
    toDoList[index][1] = !toDoList[index][1];
  });

}

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 186, 201), 
      appBar: AppBar(
        title: const Text('TO DO', style: TextStyle(fontSize: 30)),
        backgroundColor: const Color.fromARGB(255, 224, 97, 139),
        actions: [
          IconButton(onPressed: () {showDialog(
              context: context,
              builder: (BuildContext context) => _buildPopupDialog(context),);},
           icon: Icon(Icons.more_vert,))
        ]


      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToNextScreen(context); //New screen
        },
        
        child: Icon(Icons.add),

      ),
      
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index] [0],
            taskCompleted: toDoList [index] [1],
            onChanged: (value) => checkBoxChanged(value, index),
            );
          },
         ),
        
      );
   
  }
}

//Pop up filter fönster
Widget _buildPopupDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('Filter:'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("All"),
        Text("Done"),
        Text("Undone")
      ],
    ),
    actions: <Widget>[
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Apply'),
      ),
    ],
  );
}