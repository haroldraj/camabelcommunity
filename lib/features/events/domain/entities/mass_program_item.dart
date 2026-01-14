import 'package:camabelcommunity/features/events/domain/enums/mass_part.dart';
import 'package:camabelcommunity/features/events/domain/enums/mass_item_type.dart';

class MassProgramItem {
  final String id;
  final int order;
  final MassItemType contentType;
  final MassPart? massPart;

  final String? text;

  final String? songId;
  final String? songTitle;
  final String? book;
  final int? page;
  final bool hasLyrics;

  const MassProgramItem({
    required this.id,
    required this.order,
    required this.contentType,
    this.massPart,
    this.text,
    this.songId,
    this.songTitle,
    this.book,
    this.page,
    this.hasLyrics = false,
  });
}
