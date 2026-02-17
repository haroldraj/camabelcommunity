class EventCoverModel {
  final String source;
  final String? url;
  final String? path;

  EventCoverModel({required this.source, this.url, this.path});

  Map<String, dynamic> toJson() {
    return {"source": source, "url": url, "path": path}
      ..removeWhere((key, value) => value == null);
  }

  factory EventCoverModel.fromJson(Map<String, dynamic> json) {
    return EventCoverModel(
      source: json["source"],
      url: json["url"],
      path: json["path"],
    );
  }
}
