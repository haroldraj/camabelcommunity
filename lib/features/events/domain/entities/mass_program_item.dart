import 'package:camabelcommunity/features/events/domain/entities/song_preview.dart';
import 'package:camabelcommunity/features/events/domain/enums/mass_part.dart';
import 'package:camabelcommunity/features/events/domain/enums/mass_item_type.dart';

class MassProgramItem {
  final String id;
  final int order;
  final MassItemType contentType;
  final MassPart massPart;
  final String? text;
  final SongPreview? songPreview;

  MassProgramItem({
    required this.id,
    required this.order,
    required this.contentType,
    required this.massPart,
    this.text,
    this.songPreview,
  });
}
