import 'package:camabelcommunity/features/events/domain/enums/mass_part.dart';
import 'package:camabelcommunity/features/events/domain/enums/program_item_content_type.dart';

class ProgramItem {
  final String id;
  final int order;
  final ProgramItemContentType contentType;
  final MassPart? massPart;

  final String? songId;
  final String? songTitle;
  final String? book;
  final int? page;
  final bool hasLyrics;

  const ProgramItem({
    required this.id,
    required this.order,
    required this.contentType,
    this.massPart,
    this.songId,
    this.songTitle,
    this.book,
    this.page,
    this.hasLyrics = false,
  });
}
