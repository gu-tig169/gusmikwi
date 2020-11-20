import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './model.dart';

class SecondScreen extends StatefulWidget {
  final TodoCard card;

  SecondScreen(this.card);

  @override
  State<StatefulWidget> createState() {
    return SecondScreenViewState();
  }
}

class SecondScreenViewState extends State<SecondScreen> {
  String message;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text('TIG169 TODO'),
          actions: [
            IconButton(
              iconSize: 30.0,
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.pop(context, TodoCard(message: message));
              },
            )
          ]),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(children: [
          _textField(),
          //_addButton(),
        ]),
      ),
    );
  }
}

class TodoList extends StatelessWidget {
  final List<TodoCard> list;

  TodoList(this.list);

  Widget build(BuildContext context) {
    return ListView(
        children: list.map((card) => _todoItem(context, card)).toList());
  }
}

Widget _todoItem(context, card) {
  return ListTile(
    title: Text(card.message),
    trailing: IconButton(
      icon: Icon(Icons.delete),
      onPressed: () {
        var state = Provider.of<MyState>(context, listen: false);
        state.removeCard(card);
      },
    ),
  );
}

Widget _textField() {
  return TextField(
      decoration: InputDecoration(
          hintText: 'Skriv något här... tex bada',
          hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 5.0),
          ),
          labelText: 'Vad vill du göra?',
          labelStyle: TextStyle(color: Colors.grey, fontSize: 25)));
}

//Widget _addButton() {
// return IconButton(iconSize: 30.0, icon: Icon(Icons.add), onPressed: () {});
//}
