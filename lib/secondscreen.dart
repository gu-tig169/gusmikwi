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
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            _textField(myController),
            _addButton(myController, context),
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
              hintText: 'Write something',
              hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 5.0),
              ),
              labelText: 'What do you want to do?',
              labelStyle: TextStyle(color: Colors.grey, fontSize: 25)),
        ),
      ],
    );
  }

  Widget _addButton(myController, context) {
    return IconButton(
        iconSize: 30.0,
        icon: Icon(Icons.add),
        onPressed: () {
          Provider.of<MyState>(context, listen: false)
              .addCard(TodoCard(message: myController.text));
          Navigator.pop(context);
        });
  }
}
