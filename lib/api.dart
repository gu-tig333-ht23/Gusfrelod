import 'package:http/http.dart' as http;
import 'dart:convert';
import 'my_state.dart';


class InternetFetcher {

  static String ENDPOINT = 'https://todoapp-api.apps.k8s.gu.se';
  static String myKey = 'ea03adfc-e011-4cb4-80c6-1d7790dc4498';

static Future<List<ToDoItem>> fetchData() async {
  Uri url = Uri.parse('$ENDPOINT/todos?key=$myKey');

  http.Response response = await http.get(url);
  String body = response.body;


  List<dynamic> jsonResponse = jsonDecode(body);
  List<ToDoItem> toDoItem= 
  jsonResponse.map((json) => ToDoItem.fromJson(json)).toList();

  return toDoItem;
}


Future<void> postTask(ToDoItem toDoItem) async {
  await http.post(Uri.parse('$ENDPOINT/todos?key=$myKey'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(toDoItem.toJson()));
}

Future<void> removeTask(toDoItem) async {
  var id = toDoItem.id;
  await http.delete(Uri.parse('$ENDPOINT/todos/$id?key=$myKey'));
}

Future<void> updateTask(ToDoItem toDoItem) async {
  var id = toDoItem.id;
  await http.put(Uri.parse('$ENDPOINT/todos/$id?key=$myKey'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(toDoItem.toJson()));
}
}