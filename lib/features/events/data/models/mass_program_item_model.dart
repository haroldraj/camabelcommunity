import 'package:camabelcommunity/features/events/data/models/song_preview_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MassProgramItemModel {
  final String id;
  final int order;
  final String contentType;
  final String massPart;
  final String? text;
  final SongPreviewModel? songPreview;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  MassProgramItemModel({
    required this.id,
    required this.order,
    required this.contentType,
    required this.massPart,
    this.text,
    this.songPreview,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      "order": order,
      "contentType": contentType,
      "massPart": massPart,
      "text": text,
      "songPreview": songPreview?.toJson(),
      "createdAt": FieldValue.serverTimestamp(),
      "updatedAt": FieldValue.serverTimestamp(),
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
      createdAt: (json["createdAt"] as Timestamp?)?.toDate(),
      updatedAt: (json["updatedAt"] as Timestamp?)?.toDate(),
    );
  }
}
