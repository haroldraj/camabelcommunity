import 'package:camabelcommunity/features/events/data/models/event_cover_model.dart';

class EventModel {
  final String id;
  final String title;
  final String locationName;
  final String locationAddress;
  final String? locationLat;
  final String? locationLong;
  final String? headline;
  final String type;
  final DateTime date;
  final String status;
  final EventCoverModel cover;
  final bool hasMassProgram;
  final DateTime createdAt;

  EventModel({
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
    this.headline,
    this.locationLat,
    this.locationLong,
  });
}
