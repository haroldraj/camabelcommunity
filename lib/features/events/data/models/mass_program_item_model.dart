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
}
