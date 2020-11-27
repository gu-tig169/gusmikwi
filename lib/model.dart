import 'package:flutter/material.dart';

class TodoCard {
  String message;
  bool isDone;

  TodoCard({
    this.message,
    this.isDone = false,
  });
}

class MyState extends ChangeNotifier {
  List<TodoCard> _list = [TodoCard(message: 'Hej')];

  List<TodoCard> donelista;
  List<TodoCard> notdonelista;

  String _filterBy = 'All';

  List<TodoCard> get list => _list;

  String get filterBy => _filterBy;

  void addCard(TodoCard card) {
    _list.add(card);
    //List <TodoCard> Api.addCard(card);
    notifyListeners();
  }

  void removeCard(TodoCard card) {
    _list.remove(card);
    notifyListeners();
  }

  void setFilterBy(String filterBy) {
    this._filterBy = filterBy;
  }

  List<TodoCard> filteredList(String listfilter) {
    if (listfilter == "Done") {
      return _list.where((card) => card.isDone == true).toList();
    } else if (listfilter == "Undone") {
      return _list.where((card) => card.isDone == false).toList();
    }

    return _list;
  }

  void removeItem(TodoCard item) {
    _list.remove(item);
    notifyListeners();
  }
}
