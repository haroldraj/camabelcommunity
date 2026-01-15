class SongPreview {
  final String id;
  final String title;
  final String? book;
  final int? page;
  final bool hasLyrics;

  SongPreview({
    required this.id,
    required this.title,
    required this.hasLyrics,
    this.book,
    this.page,
  });
}
