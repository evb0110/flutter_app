import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

makeButtonWrap(context, list) {
  return Wrap(
    children: list
        .map<Container>(
          (value) => Container(
            margin: EdgeInsets.only(left: 10.0),
            child: RaisedButton(
              onPressed: () => Navigator.pop(context, '$value'),
              child: Text('$value'),
            ),
          ),
        )
        .toList(),
  );
}
