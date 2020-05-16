import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/makeListFromChapter.dart';
import 'package:flutterapp/util.dart';

import 'SelectionScreen.dart';
import 'Verse.dart';

class Chapter extends StatefulWidget {
  String book;
  int number;
  Chapter(this.book, this.number);

  @override
  _ChapterState createState() => _ChapterState();
}

class _ChapterState extends State<Chapter> {
  final chooseButtonColor = Colors.blue;
  final chooseButtonTextStyle = TextStyle(color: Colors.lightGreenAccent, fontSize: 18.0);
  String book;
  int chapter;

  @override
  void initState() {
    book = widget.book;
    chapter = widget.number;
  }

  void selectEntity(BuildContext context, entityType) async {
    final chosen = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SelectionScreen(book, entityType),
      ),
    );
    if (chosen == null) return;

    final String entity = chosen['entity'];
    final String value = chosen['value'];

    if (entity == 'chapter') {
      setState(() => chapter = int.parse(value));
    } else if (book != value) {
      setState(() {
        book = value;
        chapter = 1;
      });
    }
  }

  RaisedButton makeChooserButton(context, entityType) => RaisedButton(
        child: Text(capitalize(entityType), style: chooseButtonTextStyle),
        onPressed: () => selectEntity(context, entityType),
        color: chooseButtonColor,
      );

  Text makeTitle() => Text(
        '$book $chapter',
        textScaleFactor: 1.1,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      );

  @override
  Widget build(BuildContext context) {
    final String chapterString = makeChapterString(book, chapter);
    final List<Verse> list = makeListFromChapter(chapterString);

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          makeChooserButton(context, 'book'),
          makeChooserButton(context, 'chapter'),
        ],
        title: makeTitle(),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 10.0),
        child: ListView(children: list),
      ),
    );
  }
}
