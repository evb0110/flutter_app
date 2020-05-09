import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  Function _incrementCounter(inc) => () => setState(() => _counter += inc);
  void _counterToZero() => setState(() => _counter = 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  color: Colors.red,
                  icon: Icon(Icons.remove, size: 50.0),
                  onPressed: _incrementCounter(-1),
                ),
                IconButton(
                  color: Colors.green,
                  icon: Icon(Icons.add, size: 50.0),
                  onPressed: _incrementCounter(1),
                ),
                IconButton(
                  color: Colors.blue,
                  icon: Icon(Icons.adjust, size: 50.0),
                  onPressed: _counterToZero,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
