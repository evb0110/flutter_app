import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/makeChapterString.dart';
import 'package:flutterapp/makeListFromChapter.dart';

import 'SelectionScreen.dart';

class Chapter extends StatefulWidget {
  @override
  _ChapterState createState() => _ChapterState();
}

class _ChapterState extends State<Chapter> {
  final chooseButtonColor = Colors.blue;
  final buttonTextStyle =
      TextStyle(color: Colors.lightGreenAccent, fontSize: 20.0);
  String book = 'Matthew';
  int chapter = 1;

  void nextRoute(BuildContext context, entityType) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SelectionScreen(book, entityType)),
    );
    print(result);

    setState(() {
      if (result == null) return;
      if (result.length < 3) {
        chapter = int.parse(result);
      } else {
        if (book != result) {
          book = result;
          chapter = 1;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var chapterString = makeChapterString(book, chapter);
    var list = makeListFromChapter(chapterString);

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          RaisedButton(
            child: Text('Book', style: buttonTextStyle, textScaleFactor: 0.9),
            onPressed: () => nextRoute(context, 'book'),
            color: chooseButtonColor,
          ),
          RaisedButton(
            child:
                Text('Chapter', style: buttonTextStyle, textScaleFactor: 0.9),
            onPressed: () => nextRoute(context, 'chapter'),
            color: chooseButtonColor,
          ),
        ],
        title: Text('$book $chapter',
            textScaleFactor: 1.1,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        child: Center(child: ListView(children: list)),
      ),
    );
  }
}

class Verse extends StatelessWidget {
  final int number;
  final String text;
  Verse(this.number, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
              child: SafeArea(
            minimum: const EdgeInsets.only(left: 20.0),
            child: Text(
              text,
              textAlign: TextAlign.right,
              textScaleFactor: 2.5,
              style: TextStyle(fontFamily: 'SertoMardin', height: 1.3),
            ),
          )),
          SizedBox(
            width: 29.0,
            child: Container(
                padding: EdgeInsets.only(top: 15.0),
                child: Align(
                  child: Text(
                    number == 0 ? '' : '$number',
                    textAlign: TextAlign.right,
                    textScaleFactor: 1.2,
                    style: TextStyle(color: Colors.blue),
                  ),
                  alignment: Alignment.topRight,
                )),
          ),
        ],
      ),
    );
  }
}
