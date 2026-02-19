import 'package:camabelcommunity/core/helpers/helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DayProgramItemModel {
  final String id;
  final String title;
  final DateTime? startAt;
  final String? description;
  final String type;
  final String? massProgramId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  DayProgramItemModel({
    required this.id,
    required this.title,
    required this.startAt,
    required this.type,
    this.description,
    this.massProgramId,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "startAt": startAt,
      "description": description,
      "type": type,
      "massProgramId": massProgramId,
      "createdAt": FieldValue.serverTimestamp(),
      "updatedAt": FieldValue.serverTimestamp(),
    }..removeWhere((key, value) => value == null);
  }

  factory DayProgramItemModel.fromJson(
    Map<String, dynamic> json, {
    String? id,
  }) {
    return DayProgramItemModel(
      id: id ?? json["id"],
      title: json["title"],
      startAt: Helpers.parseDate(json["startAt"]),
      description: json["description"],
      type: json["type"],
      massProgramId: json["massProgramId"],
      createdAt: Helpers.parseDate(json["createdAt"]),
      updatedAt: Helpers.parseDate(json["updatedAt"]),
    );
  }
}
