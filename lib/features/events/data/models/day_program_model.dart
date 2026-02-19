import 'package:camabelcommunity/features/events/data/models/day_program_item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DayProgramModel {
  final String id;
  final String label;
  final DateTime date;
  final List<DayProgramItemModel> items;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  DayProgramModel({
    required this.id,
    required this.label,
    required this.date,
    required this.items,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      "label": label,
      "date": date,
      "createdAt": FieldValue.serverTimestamp(),
      "updatedAt": FieldValue.serverTimestamp(),
      // "items": items.map((item) => item.toJson()).toList(),
    }..removeWhere((key, value) => value == null);
  }

  factory DayProgramModel.fromJson(Map<String, dynamic> json, {String? id}) {
    return DayProgramModel(
      id: id ?? json["id"],
      label: json["label"],
      date: DateTime.parse(json["date"]),
      items: (json["items"] as List)
          .map((item) => DayProgramItemModel.fromJson(item))
          .toList(),
      createdAt: (json["createdAt"] as Timestamp?)?.toDate(),
      updatedAt: (json["updatedAt"] as Timestamp?)?.toDate(),
    );
  }
}
