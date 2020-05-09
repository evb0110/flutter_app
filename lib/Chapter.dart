import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'SelectionScreen.dart';

class Chapter extends StatefulWidget {
  @override
  _ChapterState createState() => _ChapterState();
}

class _ChapterState extends State<Chapter> {
  String value;

  @override
  void initState() => value = 'Starting Chapter';

  Future<String> nextRoute(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectionScreen()),
    );
    setState(() {
      if (result) value = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(value),
          leading: GestureDetector(
            onTap: () => nextRoute(context),
            child: Icon(Icons.select_all),
          )),
      body: Container(
        padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
        child: Center(
            child: ListView(
          children: List<int>.generate(40, (i) => i + 1)
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
