import 'package:flutter/material.dart';
import 'addtask.dart';
import 'filter.dart';
import 'view_list.dart';


class HomePage extends StatelessWidget {
 const HomePage({super.key});   


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 186, 201), 
      appBar: AppBar(
        title: const Text('TO DO', style: TextStyle(fontSize: 30)),
        backgroundColor: const Color.fromARGB(255, 224, 97, 139),
        actions: [
          IconButton(onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return MyFilter();
                  });
                  //Navigator.of(context).pop();
                },
                icon: Icon(Icons.more_vert,))
                ]),

      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) {
            return addTask();
          })
        ),//New screen
        
      child: const Icon(Icons.add),
      ),
      
      body: const ViewMyList(),
    );
}
}
  