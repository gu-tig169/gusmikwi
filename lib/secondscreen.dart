import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './model.dart';

class SecondScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SecondScreenViewState();
  }
}

class SecondScreenViewState extends State<SecondScreen> {
  String message;

  final myController = TextEditingController();
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text('TIG169 TODO'),
          actions: [
            IconButton(
              iconSize: 30.0,
              icon: Icon(Icons.add),
              onPressed: () {
                Provider.of<MyState>(context, listen: false)
                    .addCard(TodoCard(message: myController.text));
                Navigator.pop(context);
              },
            )
          ]),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            _textField(myController),
          ],
        ),
      ),
    );
  }

  Widget _textField(context) {
    return Column(
      children: [
        TextField(
          controller: myController,
          decoration: InputDecoration(
              hintText: 'Skriv något',
              hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 5.0),
              ),
              labelText: 'Vad vill du göra?',
              labelStyle: TextStyle(color: Colors.grey, fontSize: 25)),
        ),
      ],
    );
  }
}

//Widget _addButton() {
//return IconButton(iconSize: 30.0, icon: Icon(Icons.add), onPressed: () {});}
