import 'model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const API_URL = "https://todoapp-api-vldfm.ondigitalocean.app";
const API_KEY = "3c58a081-1a63-452c-a3a3-4f4051c6a0d2";

class Api {
  static Future addTodoCard(TodoCard todoCard) async {
    var json = jsonEncode(TodoCard.toJson(todoCard));

    print(json);

    await http.post(
      '$API_URL/todos?key=$API_KEY',
      body: json,
      headers: {'Content-Type': 'application/json'},
    );
  }

  static Future<List<TodoCard>> getTodoCards() async {
    var response = await http.get('$API_URL/todos?key=$API_KEY');
    String bodyString = response.body;
    print(response.body);
    var json = jsonDecode(bodyString);
    print(json);

    return json.map<TodoCard>((data) {
      return TodoCard.fromJson(data);
    }).toList();
  }

  static Future deleteCard(String id) async {
    await http.delete('$API_URL/todos/$id?key=$API_KEY');
  }

  static Future updateTodoCheckValue(TodoCard todoCard) async {
    var json = jsonEncode(TodoCard.toJson(todoCard));
    String id = todoCard.id;
    await http.put(
      '$API_URL/todos/$id?key=$API_KEY',
      body: json,
      headers: {'Content-Type': 'application/json'},
    );
  }
}
