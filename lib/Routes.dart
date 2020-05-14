import 'package:flutter/material.dart';
import 'package:flutterapp/Chapter.dart';

import 'SelectionScreen.dart';

class MainRoute extends StatelessWidget {
  Future<String> nextRoute(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectionScreen('', 'Chapter')),
    );
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Chapter();
  }
}
