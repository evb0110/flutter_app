import 'package:flutterapp/Chapter.dart';
import 'package:flutterapp/makePeshittaObject.dart';

List<Verse> makeListFromChapter(chapter) {
  var peshittaObject = makePeshittaObject();
  var chapterObject = peshittaObject[chapter];
  var head = Verse(0, chapterObject['head']);
  var verses = chapterObject['text'].map<Verse>((line) {
    int number = int.parse(line['number']);
    String verse = line['verse'];
    return Verse(number, verse);
  }).toList();
  verses.insert(0, head);
  return verses;
}
