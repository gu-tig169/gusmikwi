import 'package:flutter/material.dart';
import 'package:myapp/secondscreen.dart';
//import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 40),
              _appBar(),
              _checkboxRow('Dricka vatten'),
              _checkboxRow('Äta mat'),
              _checkboxRow('Yoga'),
              _checkboxRow('Basket'),
              _checkboxRow('Klättring'),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(18.0),
          child: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.blueGrey,
            //backgroundColor: Colors.blueGrey[400],
            onPressed: () {
              print("flytknapp funkar");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondScreen()));
            },
          ),
        ));
  }

  Widget _appBar() {
    return Container(
        height: 53,
        decoration: BoxDecoration(color: Colors.blue),
        child: Center(
          child: Text(
            'TIG169 TODO',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ));
  }

  Widget _checkboxRow(String mm) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              value: false,
              onChanged: (val) {},
            ),
            Text(
              mm,
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
            Icon(Icons.clear_outlined),
          ],
        ),
      ],
    );
  }
}
