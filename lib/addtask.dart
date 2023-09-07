import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
            decoration: const InputDecoration(
              hintText: 'What are you going to do?',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a new task';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  // Process data.
                }
              },
              child: const Text('+ ADD'),
            ),
          ),
        ],
      ),
    ));
  }
}
