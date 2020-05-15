import 'package:flutter/material.dart';

class Verse extends StatelessWidget {
  final int number;
  final String text;
  bool isTitle;
  Verse(this.number, this.text) {
    isTitle = number == 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextBox(text, isTitle),
          NumberBox(number),
        ],
      ),
    );
  }
}

Widget TextBox(String text, isTitle) => Expanded(
      child: SafeArea(
        minimum: const EdgeInsets.only(left: 50.0),
        child: Text(
          text,
          textAlign: isTitle ? TextAlign.center : TextAlign.right,
          textScaleFactor: 2.5,
          style: TextStyle(
            fontFamily: 'SertoMardin',
            fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
            height: 1.3,
          ),
        ),
      ),
    );

Widget NumberBox(int number) {
  bool isTitle = number == 0;
  if (isTitle) return Container();
  return SizedBox(
    width: 25.0,
    child: Container(
      padding: EdgeInsets.only(top: 15.0),
      child: Align(
        child: Text(
          isTitle ? '' : '$number',
          textAlign: TextAlign.right,
          textScaleFactor: 1.2,
          style: TextStyle(color: Colors.blue),
        ),
        alignment: Alignment.topRight,
      ),
    ),
  );
}
