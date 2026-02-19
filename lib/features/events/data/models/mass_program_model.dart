import 'package:camabelcommunity/core/helpers/helpers.dart';
import 'package:camabelcommunity/features/events/data/models/mass_program_item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MassProgramModel {
  final String id;
  final String label;
  final DateTime? date;
  final List<MassProgramItemModel> items;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  MassProgramModel({
    required this.id,
    required this.label,
    required this.items,
    required this.date,
    this.createdAt,
    this.updatedAt,
  });

  MassProgramModel copywith({
    final String? id,
    final String? label,
    final DateTime? date,
    final List<MassProgramItemModel>? items,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) {
    return MassProgramModel(
      id: id ?? this.id,
      label: label ?? this.label,
      items: items ?? this.items,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "label": label,
      "date": date,
      "createdAt": FieldValue.serverTimestamp(),
      "updatedAt": FieldValue.serverTimestamp(),
      //  "items": items.map((item) => item.toJson()).toList(),
    }..removeWhere((key, value) => value == null);
  }

  factory MassProgramModel.fromJson(Map<String, dynamic> json, {String? id}) {
    return MassProgramModel(
      id: id ?? json["id"],
      label: json["label"],
      date: Helpers.parseDate(json["date"]),
      items: [],
      // items: (json["items"] as List)
      //     .map((item) => MassProgramItemModel.fromJson(item))
      //     .toList(),
      createdAt: Helpers.parseDate(json["createdAt"]),
      updatedAt: Helpers.parseDate(json["updatedAt"]),
    );
  }
}
