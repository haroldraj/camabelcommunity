import 'package:camabelcommunity/features/events/domain/enums/book_name.dart';

class SongPreview {
  final String id;
  final String title;
  final BookName book;
  final int? page;
  final bool hasLyrics;
  final String? key;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  SongPreview({
    required this.id,
    required this.title,
    required this.hasLyrics,
    required this.book,
    this.page,
    this.key,
    this.createdAt,
    this.updatedAt,
  });
}
