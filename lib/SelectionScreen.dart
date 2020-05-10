import 'package:flutter/material.dart';

class SelectionScreen extends StatelessWidget {
  final String value;
  SelectionScreen(this.value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose $value'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              // Close the screen and return "Yep!" as the result.
              Navigator.pop(context, '$value 1');
            },
            child: Text('$value 1'),
          ),
          RaisedButton(
            onPressed: () {
              // Close the screen and return "Nope!" as the result.
              Navigator.pop(context, '$value 2');
            },
            child: Text('$value 2'),
          ),
        ],
      ),
    );
  }
}
