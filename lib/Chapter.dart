import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/makeListFromChapter.dart';
import 'package:flutterapp/util.dart';

import 'SelectionScreen.dart';

class Chapter extends StatefulWidget {
  @override
  _ChapterState createState() => _ChapterState();
}

class _ChapterState extends State<Chapter> {
  final chooseButtonColor = Colors.blue;
  final chooseButtonTextStyle =
      TextStyle(color: Colors.lightGreenAccent, fontSize: 18.0);
  String book = 'Matthew';
  int chapter = 1;

  void selectEntity(BuildContext context, entityType) async {
    final chosen = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SelectionScreen(book, entityType),
      ),
    );
    if (chosen == null) return;

    String entity = chosen['entity'];
    String value = chosen['value'];

    setState(() {
      if (entity == 'chapter') {
        chapter = int.parse(value);
      } else if (book != value) {
        book = value;
        chapter = 1;
      }
    });
  }

  RaisedButton makeChooserButton(context, entityType) => RaisedButton(
        child: Text(capitalize(entityType), style: chooseButtonTextStyle),
        onPressed: () => selectEntity(context, entityType),
        color: chooseButtonColor,
      );

  @override
  Widget build(BuildContext context) {
    var chapterString = makeChapterString(book, chapter);
    var list = makeListFromChapter(chapterString);

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          makeChooserButton(context, 'book'),
          makeChooserButton(context, 'chapter'),
        ],
        title: Text(
          '$book $chapter',
          textScaleFactor: 1.1,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 10.0),
        child: ListView(children: list),
      ),
    );
  }
}
