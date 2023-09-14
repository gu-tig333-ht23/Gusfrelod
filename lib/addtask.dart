import 'package:flutter/material.dart';
import 'my_button.dart';


class addTask extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color.fromARGB(255, 230, 186, 201), 

  appBar: AppBar(
    title: const Text('ADD NEW TASK', style: TextStyle(fontSize: 30)),
    backgroundColor: const Color.fromARGB(255, 224, 97, 139)),
  body: const NewTask(),
  );

}
}

class NewTask extends StatefulWidget {
  const NewTask({super.key});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final _controller = TextEditingController();


void saveNewTask(val) {
    setState(() {
      Navigator.of(context).pop(_controller.text);
    });
      }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25, bottom: 500),
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),

  
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: 'What are you going to do?',
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: MyButton(
              text: "+ ADD",
              onPressed: () {
                String enteredText = _controller.text;
                    saveNewTask(enteredText);
                  },
                    
                ),
                ),],
      ),
    ));
                
                }
              }