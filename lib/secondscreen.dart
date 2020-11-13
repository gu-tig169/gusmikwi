import 'package:flutter/material.dart';
import 'package:myapp/main.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TIG169 Todo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Vad ska du göra?'),
            TextField(),
            _iconRow(),
          ],
        ),
      ),
    );
  }
}

Widget _iconRow() {
  return Row(
    children: [
      Center(child: Icon(Icons.add_box_outlined)),
      Text('Add'),
    ],
  );
}
