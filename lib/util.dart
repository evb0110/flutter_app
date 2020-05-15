String capitalize(String s) =>
    s[0].toUpperCase() + s.substring(1).toLowerCase();

String makeChapterString(String book, int chapter) {
  String bookPart = book.toLowerCase().split(' ').join('_');
  return '${bookPart}_$chapter';
}
