import 'package:camabelcommunity/core/helpers/helpers.dart';
import 'package:camabelcommunity/features/events/data/models/day_program_item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DayProgramModel {
  final String id;
  final String label;
  final DateTime? date;
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

  DayProgramModel copywith({
    final String? id,
    final String? label,
    final DateTime? date,
    final List<DayProgramItemModel>? items,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) {
    return DayProgramModel(
      id: id ?? this.id,
      label: label ?? this.label,
      date: date ?? this.date,
      items: items ?? this.items,
    );
  }

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
      date: Helpers.parseDate(json["date"]),
      items: [],
      // items: (json["items"] as List)
      //     .map((item) => DayProgramItemModel.fromJson(item))
      //     .toList(),
      createdAt: Helpers.parseDate(json["createdAt"]),
      updatedAt: Helpers.parseDate(json["updatedAt"]),
    );
  }
}
