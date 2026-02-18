import 'package:camabelcommunity/features/events/data/models/mass_program_item_model.dart';

class MassProgramModel {
  final String id;
  final String label;
  final DateTime date;
  final List<MassProgramItemModel> items;

  MassProgramModel({
    required this.id,
    required this.label,
    required this.items,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      "label": label,
      "date": date.toIso8601String(),
      //  "items": items.map((item) => item.toJson()).toList(),
    }..removeWhere((key, value) => value == null);
  }

  factory MassProgramModel.fromJson(Map<String, dynamic> json, {String? id}) {
    return MassProgramModel(
      id: id ?? json["id"],
      label: json["label"],
      date: DateTime.parse(json["date"]),
      items: (json["items"] as List)
          .map((item) => MassProgramItemModel.fromJson(item))
          .toList(),
    );
  }
}
