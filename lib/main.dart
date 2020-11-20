import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './model.dart';
import 'SecondScreen.dart';

void main() {
  var state = MyState();

  runApp(
    ChangeNotifierProvider(
      create: (context) => state,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TIG169',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text(
            'TIG169 TODO',
          )),
      body: Consumer<MyState>(
        builder: (context, state, child) => TodoList(state.list),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          var newCard = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SecondScreen(TodoCard())));
          //if (newCard != null) {
          Provider.of<MyState>(context, listen: false).addCard(newCard);
          //}
        },
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

  Widget _todoItem(context, card) {
    return ListTile(
      leading: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(color: Colors.grey),
      ),
      title: Text(card.message),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          var state = Provider.of<MyState>(context);
          state.removeCard(card);
        },
      ),
    );
  }
}
