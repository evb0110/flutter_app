import 'package:flutter/material.dart';
import 'package:flutterapp/bibleBooks.dart';

import 'makeButtonWrap.dart';

class SelectionScreen extends StatelessWidget {
  final String book;
  final String entity;

  SelectionScreen(this.book, this.entity);

  @override
  Widget build(BuildContext context) {
    List<String> list;

    if (entity == 'chapter') {
      int count = bibleBookCounts[book];
      list = List<String>.generate(count, (index) => (index + 1).toString());
    } else {
      list = bibleBooks.map<String>((b) => b.book).toList();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Choose $entity'),
      ),
      body: makeButtonWrap(context, list, entity),
    );
  }
}
