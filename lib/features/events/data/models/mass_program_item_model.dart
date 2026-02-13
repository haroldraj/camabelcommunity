class MassProgramItemModel {
  final String id;
  final int order;
  final String contentType;
  final String massPart;
  final String? text;
  final String? songId;

  MassProgramItemModel({
    required this.id,
    required this.order,
    required this.contentType,
    required this.massPart,
    this.text,
    this.songId,
  });

  Map<String, dynamic> toJson() {
    return {
      "order": order,
      "contentType": contentType,
      "massPart": massPart,
      "text": text,
      "songId": songId,
    };
  }

  factory MassProgramItemModel.fromJson(
    Map<String, dynamic> json, {
    String? id,
  }) {
    return MassProgramItemModel(
      id: id ?? json["id"],
      order: json["order"],
      contentType: json["contentType"],
      massPart: json["massPart"],
    );
  }
}
