import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Chapter extends StatefulWidget {
  @override
  _ChapterState createState() => _ChapterState();
}

class _ChapterState extends State<Chapter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
        child: Center(
            child: ListView(
          children: List<int>.generate(100, (i) => i + 1)
              .map((v) => Verse(
                  v, 'ܡܢ ܟܠܗܝܢ ܗܠܝܢ ܣܓܼܝܬ ܚܟܡܬܐ ܘܥܼܫܢܬ ܗܝܡܢܘܬܐ܂ ܡܢ ܠܩܘܕܡܝܢ '))
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
            width: 25.0,
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
