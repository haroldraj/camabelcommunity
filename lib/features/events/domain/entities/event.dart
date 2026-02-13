import 'package:camabelcommunity/features/events/domain/entities/day_program_item.dart';
import 'package:camabelcommunity/features/events/domain/entities/event_cover.dart';
import 'package:camabelcommunity/features/events/domain/enums/event_status.dart';
import 'package:camabelcommunity/features/events/domain/enums/event_type.dart';

class Event {
  final String id;
  final String title;
  final String locationName;
  final String locationAddress;
  final String? locationLat;
  final String? locationLong;
  final String? headline;
  final EventType type;
  final DateTime date;
  final EventStatus status;
  final EventCover cover;
  final bool hasMassProgram;
  final DateTime createdAt;
  final String dayProgramId;

  Event({
    required this.id,
    required this.title,
    required this.date,
    required this.locationName,
    required this.locationAddress,
    required this.type,
    required this.status,
    required this.cover,
    required this.hasMassProgram,
    required this.createdAt,
    required this.dayProgramId,
    this.headline,
    this.locationLat,
    this.locationLong,
  });
}
