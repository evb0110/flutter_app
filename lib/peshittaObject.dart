import 'package:flutterapp/peshitta.dart';

var peshittaObject = makePeshittaObject();

makePeshittaObject() {
  List<String> chapters = peshitta.split('=====\n').toList();
  var chaptersObject = chapters
      .map((ch) => ch.split('\n'))
      .where((c) => c.length > 3)
      .map((lines) {
    var chap = lines[0];
    var head = lines[1];
    var text = lines
        .sublist(2)
        .map((l) {
          var parts = l.split(' ').toList();
          var number = parts[0];
          var verse = parts.sublist(1).join(' ');
          return {'number': number, 'verse': verse};
        })
        .where((l) => l['number'].length > 0)
        .toList();
    return {
      chap: {'head': head, 'text': text}
    };
  }).toList();

  return chaptersObject.fold({}, (acc, val) {
    var newAcc = {};
    newAcc.addAll(acc);
    newAcc.addAll(val);
    return newAcc;
  });
}
