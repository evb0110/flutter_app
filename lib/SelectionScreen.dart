import 'package:flutter/material.dart';

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose chapter'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              // Close the screen and return "Yep!" as the result.
              Navigator.pop(context, 'Chapter 1');
            },
            child: Text('Chapter 1'),
          ),
          RaisedButton(
            onPressed: () {
              // Close the screen and return "Nope!" as the result.
              Navigator.pop(context, 'Chapter 2');
            },
            child: Text('Chapter 2'),
          ),
        ],
      ),
    );
  }
}
