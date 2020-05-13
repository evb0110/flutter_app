import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/makeListFromChapter.dart';

import 'SelectionScreen.dart';

class Chapter extends StatefulWidget {
  @override
  _ChapterState createState() => _ChapterState();
}

class _ChapterState extends State<Chapter> {
  final chooseButtonColor = Colors.blue;
  final buttonTextStyle = TextStyle(color: Colors.white, fontSize: 20.0);
  String value = 'Matthew';

  Future<String> nextRoute(BuildContext context, entityType) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectionScreen(entityType)),
    );
    setState(() {
      if (result != null) value = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    var chapter = 'mark_1';
    var list = makeListFromChapter(chapter);

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          RaisedButton(
            child: Text(
              'Book',
              style: buttonTextStyle,
            ),
            onPressed: () => nextRoute(context, 'book'),
            color: chooseButtonColor,
          ),
          RaisedButton(
            child: Text(
              'Chapter',
              style: buttonTextStyle,
            ),
            onPressed: () => nextRoute(context, 'chapter'),
            color: chooseButtonColor,
          ),
        ],
        title: Text(value,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.lightGreenAccent)),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        child: Center(
            child: ListView(
          children: list,
//          children: List<int>.generate(40, (i) => i + 100)
//              .map((v) => Verse(v, syrdata))
//              .toList(),
        )),
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
            child: Text(
              text,
              textAlign: TextAlign.right,
              textScaleFactor: 2.5,
              style: TextStyle(fontFamily: 'SertoMardin'),
            ),
          ),
          SizedBox(
            width: 29.0,
            child: Align(
              child: Text('$number', textAlign: TextAlign.right),
              alignment: Alignment.topRight,
            ),
          ),
        ],
      ),
    );
  }
}
