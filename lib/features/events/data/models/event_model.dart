import 'package:camabelcommunity/features/events/data/models/event_cover_model.dart';
import 'package:logger/web.dart';

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
  final String dayProgramId;
  final String? massProgramId;

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
    required this.dayProgramId,
    required this.massProgramId,
    this.headline,
    this.locationLat,
    this.locationLong,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "locationName": locationName,
      "locationAddress": locationAddress,
      "locationLat": locationLat,
      "locationLong": locationLong,
      "headline": headline,
      "type": type,
      "date": date.toIso8601String(),
      "status": status,
      "cover": cover.toJson(),
      "hasMassProgram": hasMassProgram,
      "createdAt": createdAt.toIso8601String(),
      "dayProgramId": dayProgramId,
      "massProgramId": massProgramId,
    };
  }

  factory EventModel.fromJson(Map<String, dynamic> json, {String? id}) {
    Logger().i(json);
    return EventModel(
      id: id ?? json["id"],
      title: json["title"],
      date: DateTime.parse(json["date"]).toLocal(),
      locationName: json["locationName"],
      locationAddress: json["locationAddress"],
      locationLat: json["locationLat"],
      locationLong: json["locationLong"],
      type: json["type"],
      status: json["status"],
      cover: EventCoverModel.fromJson(json["cover"]),
      hasMassProgram: json["hasMassProgram"],
      createdAt: DateTime.parse(json["createdAt"]).toLocal(),
      dayProgramId: json["dayProgramId"],
      massProgramId: json["massProgramId"],
    );
  }
}
