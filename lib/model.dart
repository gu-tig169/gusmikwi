import 'package:flutter/material.dart';
import './Api.dart';

class TodoCard {
  String message;
  bool isDone;
  String id;

  TodoCard({this.message, this.isDone = false, this.id});

  static Map<String, dynamic> toJson(TodoCard card) {
    return {
      'title': card.message,
      'done': card.isDone,
    };
  }

  static TodoCard fromJson(Map<String, dynamic> json) {
    return TodoCard(
      message: json['title'],
      isDone: json['done'],
      id: json['id'],
    );
  }
}

class MyState extends ChangeNotifier {
  List<TodoCard> _list = [];

  String _filterBy = 'All';

  List<TodoCard> get list => _list;

  String get filterBy => _filterBy;

  Future getTodoCardList() async {
    List<TodoCard> list = await Api.getTodoCards();
    _list = list;
    notifyListeners();
  }

  void addCard(TodoCard card) async {
    await Api.addTodoCard(card);
    await getTodoCardList();
  }

  void removeCard(TodoCard card) async {
    await Api.deleteCard(card.id);
    await getTodoCardList();
  }

  void setCheckbox(TodoCard card, newValue) async {
    card.isDone = newValue;
    await Api.updateTodoCheckValue(card);
    await getTodoCardList();
  }

  void setFilterBy(String filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }
}
