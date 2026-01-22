class DayProgramItemModel {
  final String id;
  final String title;
  final DateTime startAt;
  final String? description;
  final String type;
  final String? massProgramId;

  DayProgramItemModel({
    required this.id,
    required this.title,
    required this.startAt,
    required this.type,
    this.description,
    this.massProgramId,
  });
}
