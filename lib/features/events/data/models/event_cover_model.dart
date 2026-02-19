import 'package:cloud_firestore/cloud_firestore.dart';

class EventCoverModel {
  final String source;
  final String? url;
  final String? path;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  EventCoverModel({
    required this.source,
    this.url,
    this.path,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      "source": source,
      "url": url,
      "path": path,
      "createdAt": FieldValue.serverTimestamp(),
      "updatedAt": FieldValue.serverTimestamp(),
    }..removeWhere((key, value) => value == null);
  }

  factory EventCoverModel.fromJson(Map<String, dynamic> json) {
    return EventCoverModel(
      source: json["source"],
      url: json["url"],
      path: json["path"],
      createdAt: (json["createdAt"] as Timestamp?)?.toDate(),
      updatedAt: (json["updatedAt"] as Timestamp?)?.toDate(),
    );
  }
}
