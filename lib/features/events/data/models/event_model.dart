import 'package:camabelcommunity/features/events/data/models/event_cover_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String dayProgramId;

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
    required this.dayProgramId,
    this.headline,
    this.locationLat,
    this.locationLong,
    this.createdAt,
    this.updatedAt,
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
      "date": date,
      "status": status,
      "cover": cover.toJson(),
      "hasMassProgram": hasMassProgram,
      "dayProgramId": dayProgramId,
      "createdAt": FieldValue.serverTimestamp(),
      "updatedAt": FieldValue.serverTimestamp(),
    }..removeWhere((key, value) => value == null);
  }

  factory EventModel.fromJson(Map<String, dynamic> json, {String? id}) {
    return EventModel(
      id: id ?? json["id"],
      title: json["title"],
      date: DateTime.parse(json["date"]),
      locationName: json["locationName"],
      locationAddress: json["locationAddress"],
      locationLat: json["locationLat"],
      locationLong: json["locationLong"],
      type: json["type"],
      status: json["status"],
      cover: EventCoverModel.fromJson(json["cover"]),
      hasMassProgram: json["hasMassProgram"],
      dayProgramId: json["dayProgramId"],
      createdAt: (json["createdAt"] as Timestamp?)?.toDate(),
      updatedAt: (json["updatedAt"] as Timestamp?)?.toDate(),
    );
  }
}
