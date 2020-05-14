makeChapterString(String book, int chapter) {
  String bookPart = book.toLowerCase().split(' ').join('_');
  return '${bookPart}_$chapter';
}
