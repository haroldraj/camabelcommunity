import 'package:cloud_firestore/cloud_firestore.dart';

class SongModel {
  final String id;
  final String title;
  final String? book;
  final List<String> keywords;
  final int? page;
  final String? lyrics;
  final bool hasLyrics;
  final String? key;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  SongModel({
    required this.id,
    required this.title,
    required this.keywords,
    required this.hasLyrics,
    this.lyrics,
    this.page,
    this.book,
    this.key,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "book": book,
      "keywords": keywords,
      "page": page,
      "lyrics": lyrics,
      "hasLyrics": hasLyrics,
      "key": key,
      "createdAt": FieldValue.serverTimestamp(),
      "updatedAt": FieldValue.serverTimestamp(),
    }..removeWhere((key, value) => value == null);
  }

  factory SongModel.fromJson(Map<String, dynamic> json, {String? id}) {
    return SongModel(
      id: id ?? json["id"],
      title: json["title"],
      keywords: (json["keywords"] as List<dynamic>? ?? [])
          .map((keyword) => keyword.toString())
          .toList(),
      hasLyrics: json["hasLyrics"],
      page: json["page"],
      book: json["book"],
      key: json["key"],
      lyrics: json["lyrics"],
      createdAt: (json["createdAt"] as Timestamp?)?.toDate(),
      updatedAt: (json["updatedAt"] as Timestamp?)?.toDate(),
    );
  }
}
