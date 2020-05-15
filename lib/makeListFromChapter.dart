import 'package:flutterapp/peshittaObject.dart';

import 'Verse.dart';

List<Verse> makeListFromChapter(chapter) {
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
