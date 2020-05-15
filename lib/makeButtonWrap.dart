import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

makeButtonWrap(context, list, entity) {
  return Wrap(
    children: list
        .map<Container>(
          (value) => Container(
            margin: EdgeInsets.only(left: 10.0),
            child: RaisedButton(
              onPressed: () =>
                  Navigator.pop(context, {'entity': entity, 'value': '$value'}),
              child: Text('$value'),
            ),
          ),
        )
        .toList(),
  );
}
