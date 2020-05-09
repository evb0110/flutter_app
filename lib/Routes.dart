import 'package:flutter/material.dart';
import 'package:flutterapp/Chapter.dart';

import 'SelectionScreen.dart';

class FirstRoute extends StatelessWidget {
  Future<String> nextRoute(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectionScreen()),
    );
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Chapter();
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
