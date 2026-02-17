class SongPreviewModel {
  final String id;
  final String title;
  final String? book;
  final int? page;
  final bool hasLyrics;
  final String? key;

  SongPreviewModel({
    required this.id,
    required this.title,
    required this.hasLyrics,
    this.page,
    this.book,
    this.key,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "book": book,
      "page": page,
      "hasLyrics": hasLyrics,
      "key": key,
    }..removeWhere((key, value) => value == null);
  }

  factory SongPreviewModel.fromJson(Map<String, dynamic> json, {String? id}) {
    return SongPreviewModel(
      id: id ?? json["id"],
      title: json["title"],
      hasLyrics: json["hasLyrics"],
      page: json["page"],
      book: json["book"],
      key: json["key"],
    );
  }
}
