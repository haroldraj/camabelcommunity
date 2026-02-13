class SongModel {
  final String id;
  final String title;
  final String? book;
  final List<String> keywords;
  final int? page;
  final String? lyrics;
  final bool hasLyrics;
  final String? key;

  SongModel({
    required this.id,
    required this.title,
    required this.keywords,
    required this.hasLyrics,
    this.lyrics,
    this.page,
    this.book,
    this.key,
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
    };
  }

  factory SongModel.fromJson(Map<String, dynamic> json, {String? id}) {
    return SongModel(
      id: id ?? json["id"],
      title: json["title"],
      keywords: json["keywords"],
      hasLyrics: json["hasLyrics"],
    );
  }
}
