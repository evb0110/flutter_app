import 'package:flutter/material.dart';
import 'package:flutterapp/bibleBooks.dart';

import 'makeButtonWrap.dart';

class SelectionScreen extends StatelessWidget {
  final String value;
  SelectionScreen(this.value);

  @override
  Widget build(BuildContext context) {
    var list = bibleBooks.map((b) => b['book']).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Choose $value'),
      ),
      body: makeButtonWrap(context, list),
    );
  }
}
