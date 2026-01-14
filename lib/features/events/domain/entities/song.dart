class Song {
  final String id;
  final String title;
  final String? book;
  final List<String> keywords;
  final int? page;
  final String? lyrics;
  final bool hasLyrics;
  final String? key;

  Song({
    required this.id,
    required this.title,
    required this.keywords,
    required this.hasLyrics,
    this.lyrics,
    this.page,
    this.book,
    this.key,
  });
}
