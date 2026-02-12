class EventCoverModel {
  final String id;
  final String source;
  final String? url;
  final String? path;

  EventCoverModel({
    required this.id,
    required this.source,
    this.url,
    this.path,
  });

  Map<String, dynamic> toJson() {
    return {"id": id, "source": source, "url": url, "path": path};
  }

  factory EventCoverModel.fromJson(String id, Map<String, dynamic> json) {
    return EventCoverModel(
      id: id,
      source: json["source"],
      url: json["url"],
      path: json["path"],
    );
  }
}
