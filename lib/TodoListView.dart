import 'package:flutter/material.dart';
import 'package:myapp/secondscreen.dart';
import 'package:provider/provider.dart';
import 'model.dart';

class TodoListView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('TIG169 TODO'),
        actions: <Widget>[
          PopupMenuButton(
              onSelected: (value) {
                Provider.of<MyState>(context, listen: false).setFilterBy(value);
              },
              itemBuilder: (context) => [
                    PopupMenuItem(child: Text('All'), value: 'All'),
                    PopupMenuItem(child: Text('Undone'), value: 'Undone'),
                    PopupMenuItem(child: Text('Done'), value: 'Done'),
                  ]),
        ],
      ),
      body: Consumer<MyState>(
        builder: (context, state, child) =>
            TodoList(_filterList(state.list, state.filterBy)),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SecondScreen()));
          }),
    );
  }

  List<TodoCard> _filterList(list, filterBy) {
    if (filterBy == 'All') return list;
    if (filterBy == 'Undone') return list;
    if (filterBy == 'Done') return list;

    //return list.where((item) => item.color == Colors.all).toList();
    return null;
  }
}

class TodoList extends StatefulWidget {
  final List<TodoCard> list;
  TodoList(this.list);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  bool checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: (context, index) => _todoItem(
              widget.list[index],
              context,
            ));

    // children: list.map((card) => _todoItem(context, card)).toList());
  }

  Widget _todoItem(TodoCard card, context) {
    return ListTile(
      leading: Checkbox(
          value: card.isDone,
          onChanged: (bool value) {
            setState(() {
              card.isDone = value;
            });
          }),
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
}
