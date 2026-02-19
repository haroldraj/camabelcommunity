import 'package:camabelcommunity/features/events/domain/enums/cover_source.dart';

class EventCover {
  final CoverSource source;
  final String? url;
  final String? path;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  EventCover({
    required this.source,
    this.url,
    this.path,
    this.createdAt,
    this.updatedAt,
  });
}
