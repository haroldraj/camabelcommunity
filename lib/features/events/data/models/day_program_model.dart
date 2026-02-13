import 'package:camabelcommunity/features/events/data/models/day_program_item_model.dart';

class DayProgramModel {
  final String id;
  final String label;
  final List<DayProgramItemModel> items;

  DayProgramModel({required this.id, required this.label, required this.items});

  Map<String, dynamic> toJson() {
    return {
      "label": label,
      "items": items.map((item) => item.toJson()).toList(),
    };
  }

  factory DayProgramModel.fromJson(Map<String, dynamic> json, {String? id}) {
    return DayProgramModel(
      id: id ?? json["id"],
      label: json["label"],
      items: (json["items"] as List<dynamic>)
          .map((item) => DayProgramItemModel.fromJson(item))
          .toList(),
    );
  }
}
