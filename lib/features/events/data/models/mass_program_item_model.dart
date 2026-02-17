import 'package:camabelcommunity/features/events/data/models/song_preview_model.dart';

class MassProgramItemModel {
  final String id;
  final int order;
  final String contentType;
  final String massPart;
  final String? text;
  final SongPreviewModel? songPreview;

  MassProgramItemModel({
    required this.id,
    required this.order,
    required this.contentType,
    required this.massPart,
    this.text,
    this.songPreview,
  });

  Map<String, dynamic> toJson() {
    return {
      "order": order,
      "contentType": contentType,
      "massPart": massPart,
      "text": text,
      "songPreview": songPreview?.toJson(),
    }..removeWhere((key, value) => value == null);
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
      songPreview: json["songPreview"] == null
          ? null
          : SongPreviewModel.fromJson(json["songPreview"]),
      text: json["text"],
    );
  }
}
