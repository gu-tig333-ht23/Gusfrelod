import 'package:flutter/material.dart';
import 'api.dart';

class ToDoItem {
  final String taskName;
  bool taskCompleted;
  final String? id;

  ToDoItem(
    this.taskName,{
    this.taskCompleted = false,
    this.id,
  });

factory ToDoItem.fromJson(Map<String, dynamic> json) {
    return ToDoItem(json['title'], 
    taskCompleted: json['done'], 
    id: json['id']);
  }

  Map<String, dynamic> toJson() {
    return {"title": taskName, 'done': taskCompleted};
  }

}

class MyState extends ChangeNotifier {
List <ToDoItem> _toDoList = [];

void fetchList() async {
  var toDoList = await InternetFetcher.fetchData();
    _toDoList = toDoList;
    notifyListeners();
  }

InternetFetcher apiMethod = InternetFetcher();


void checkBoxChanged(toDoItem) async {
  toDoItem.taskCompleted = !toDoItem.taskCompleted;
  await apiMethod.updateTask(toDoItem);
  fetchList();
}

void saveNewTask(title) async {
  ToDoItem newToDoItem = ToDoItem(title);
  await apiMethod.postTask(newToDoItem);
  fetchList();
}

void deleteTask(toDoItem) async {
  await apiMethod.removeTask(toDoItem);
  fetchList();
}


String selectedFilter = '';

String setFilter(String filter) {
  selectedFilter = filter;
  notifyListeners();
  return selectedFilter;
}

List<ToDoItem> get toDoList {
  switch (selectedFilter) {
    case 'all':
      return _toDoList.toList();
    case 'done':
      return _toDoList.where((element) => element.taskCompleted == true).toList();
    case 'undone':
      return _toDoList.where((element) => element.taskCompleted == false).toList();
    default:
      return _toDoList.toList();
    }
  }
}
