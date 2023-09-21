import 'package:flutter/material.dart';
import 'addtask.dart';
import 'filter.dart';
import 'todo_tile.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
   
}

class _HomePageState extends State<HomePage> {
  TaskFilter currentFilter = TaskFilter.All; //starts with "All" tasks


  // Navigate to next screen and receive new tasks
  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => addTask()))
        .then((value) {
      if(value != null && value.isNotEmpty) {
        toDoList.add((ToDoItem(taskName: value, taskCompleted: false)));
        setState(() {}); // Update homepage
    }});
  }
  List <ToDoItem>toDoList = [];

//switch för att filtrera tasks
List<ToDoItem> filterTasks() {
  switch (currentFilter) {
    case TaskFilter.All:
      return toDoList;
    case TaskFilter.Done:
      return toDoList.where((task) => task.taskCompleted).toList();
    case TaskFilter.Undone:
      return toDoList.where((task) => !task.taskCompleted).toList();
  }
}


//Checkbox 
void checkBoxChanged(bool? value, int index) {
  setState(() {
    toDoList[index].taskCompleted = value ?? false;
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
              builder: (context) {
                return MyFilter(onFilterSelected: (filter) {
                  setState(() {
                    currentFilter = filter;
                  });
                  Navigator.of(context).pop();
                });
              });
          },
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
        itemCount: filterTasks().length,
        itemBuilder: (context, index) {
          final filteredTasks = filterTasks();
          return ToDoTile(
            toDoItem: filteredTasks[index],
            onChanged: (bool? newValue) {
              checkBoxChanged(newValue, toDoList.indexOf(filteredTasks[index]));
            },
            onDelete: () {
              if (index >= 0 && index < filteredTasks.length) {
                setState(() {
                  toDoList.removeAt(toDoList.indexOf(filteredTasks[index]));
                });
              }
            }
           
            );
          },
         ), 
        
      );
  }
}