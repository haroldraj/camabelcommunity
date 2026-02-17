class DayProgramItemModel {
  final String id;
  final String title;
  final DateTime startAt;
  final String? description;
  final String type;
  final String? massProgramId;

  DayProgramItemModel({
    required this.id,
    required this.title,
    required this.startAt,
    required this.type,
    this.description,
    this.massProgramId,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "startAt": startAt.toIso8601String(),
      "description": description,
      "type": type,
      "massProgramId": massProgramId,
    }..removeWhere((key, value) => value == null);
  }

  factory DayProgramItemModel.fromJson(
    Map<String, dynamic> json, {
    String? id,
  }) {
    return DayProgramItemModel(
      id: id ?? json["id"],
      title: json["title"],
      startAt: DateTime.parse(json["startAt"]).toLocal(),
      description: json["description"],
      type: json["type"],
      massProgramId: json["massProgramId"],
    );
  }
}
