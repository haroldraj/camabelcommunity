class MassProgramModel {
  final String id;
  final String eventId;
  final String title;

  MassProgramModel({
    required this.id,
    required this.eventId,
    required this.title,
  });

  Map<String, dynamic> toJson() {
    return {"eventId": eventId, "title": title};
  }

  factory MassProgramModel.fromJson(Map<String, dynamic> json, {String? id}) {
    return MassProgramModel(
      id: id ?? json["id"],
      eventId: json["eventId"],
      title: json["title"],
    );
  }
}
