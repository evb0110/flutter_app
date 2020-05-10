import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'SelectionScreen.dart';

class Chapter extends StatefulWidget {
  @override
  _ChapterState createState() => _ChapterState();
}

class _ChapterState extends State<Chapter> {
  final String entityType = 'Book';
  final String partType = 'Chapter';
  final chooseButtonColor = Colors.lightBlue;
  String value = 'Book';

  Future<String> nextRoute(BuildContext context) async {
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
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          RaisedButton(
            child: Text('Choose $entityType'),
            onPressed: () => nextRoute(context),
            color: chooseButtonColor,
          ),
          RaisedButton(
            child: Text('Choose $partType'),
            onPressed: () => nextRoute(context),
            color: chooseButtonColor,
          ),
        ],
        title: Text(value),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        child: Center(
            child: ListView(
          children: List<int>.generate(40, (i) => i + 100)
              .map((v) => Verse(v,
                  'ܡܢ ܟܠܗܝܢ ܗܠܝܢ ܣܓܼܝܬ ܚܟܡܬܐ ܘܥܼܫܢܬ ܗܝܡܢܘܬܐ܂ ܡܢ ܠܩܘܕܡܝܢ ' * 3))
              .toList(),
        )),
      ),
    );
  }
}

class Verse extends StatelessWidget {
  int number;
  String text;
  Verse(this.number, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(child: Text(text, textAlign: TextAlign.right)),
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
