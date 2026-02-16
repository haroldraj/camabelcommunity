import 'package:camabelcommunity/features/events/data/models/mass_program_item_model.dart';

class MassProgramModel {
  final String id;
  final String label;
  final List<MassProgramItemModel> items;

  MassProgramModel({
    required this.id,
    required this.label,
    required this.items,
  });

  Map<String, dynamic> toJson() {
    return {
      "label": label,
      "items": items.map((item) => item.toJson()).toList(),
    };
  }

  factory MassProgramModel.fromJson(Map<String, dynamic> json, {String? id}) {
    return MassProgramModel(
      id: id ?? json["id"],
      label: json["label"],
      items: (json["items"] as List)
          .map((item) => MassProgramItemModel.fromJson(item))
          .toList(),
    );
  }
}
