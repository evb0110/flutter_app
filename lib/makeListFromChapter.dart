import 'package:flutterapp/Chapter.dart';
import 'package:flutterapp/makePeshittaObject.dart';

List<Verse> makeListFromChapter(chapter) {
  var peshittaObject = makePeshittaObject();
  var chapterObject = peshittaObject[chapter];
  return chapterObject['text'].map<Verse>((line) {
    int number = int.parse(line['number']);
    String verse = line['verse'];
    return Verse(number, verse);
  }).toList();
}
