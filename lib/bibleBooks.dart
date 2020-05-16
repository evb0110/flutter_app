class BookInfo {
  final String book;
  final int count;
  BookInfo(this.book, this.count);
}

final List<BookInfo> bibleBooks = [
  {'book': 'Matthew', 'count': 28},
  {'book': 'Mark', 'count': 16},
  {'book': 'Luke', 'count': 24},
  {'book': 'John', 'count': 21},
  {'book': 'Acts', 'count': 28},
  {'book': 'Romans', 'count': 16},
  {'book': '1 Corinthians', 'count': 16},
  {'book': '2 Corinthians', 'count': 13},
  {'book': 'Galatians', 'count': 6},
  {'book': 'Ephesians', 'count': 6},
  {'book': 'Philippians', 'count': 4},
  {'book': 'Colossians', 'count': 4},
  {'book': '1 Thessalonians', 'count': 5},
  {'book': '2 Thessalonians', 'count': 3},
  {'book': '1 Timothy', 'count': 6},
  {'book': '2 Timothy', 'count': 4},
  {'book': 'Titus', 'count': 3},
  {'book': 'Philemon', 'count': 1},
  {'book': 'Hebrews', 'count': 13},
  {'book': 'James', 'count': 5},
  {'book': '1 Peter', 'count': 5},
  {'book': '2 Peter', 'count': 3},
  {'book': '1 John', 'count': 5},
  {'book': '2 John', 'count': 1},
  {'book': '3 John', 'count': 1},
  {'book': 'Jude', 'count': 1},
  {'book': 'Revelation', 'count': 22},
].map((el) => BookInfo(el['book'], el['count'])).toList();

final bibleBookCounts =
    bibleBooks.fold({}, (acc, el) => {}..addAll(acc)..addAll({el.book: el.count}));
