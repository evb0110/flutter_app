import 'package:flutter/material.dart';
import 'package:flutterapp/bibleBooks.dart';

import 'makeButtonWrap.dart';

class SelectionScreen extends StatelessWidget {
  final String book;
  final String entity;
  SelectionScreen(this.book, this.entity);

  @override
  Widget build(BuildContext context) {
    var list = bibleBooks.map((b) => b['book']).toList();

    if (entity == 'chapter') {
      int count =
          bibleBooks.firstWhere((element) => element['book'] == book)['count'];
      list = List<int>.generate(count, (index) => index + 1);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Choose $entity'),
      ),
      body: makeButtonWrap(context, list),
    );
  }
}
