import 'package:flutter/material.dart';

class TodoCard {
  String message;
  TodoCard({
    this.message,
  });
}

class MyState extends ChangeNotifier {
  List<TodoCard> _list = [];

  List<TodoCard> get list => _list;

  void addCard(TodoCard card) {
    _list.add(card);
    notifyListeners();
  }

  void removeCard(TodoCard card) {
    _list.remove(card);
    notifyListeners();
  }
}
