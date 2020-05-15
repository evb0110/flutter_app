import 'package:flutter/material.dart';

import 'Chapter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Peshitta',
        home: Chapter(),
      );
}
