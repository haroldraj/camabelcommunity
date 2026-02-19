import 'package:camabelcommunity/features/events/domain/enums/program_type.dart';

class DayProgramItem {
  final String id;
  final String title;
  final DateTime? startAt;
  final String? description;
  final ProgramType type;
  final String? massProgramId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  DayProgramItem({
    required this.id,
    required this.title,
    required this.startAt,
    required this.type,
    this.description,
    this.massProgramId,
    this.createdAt,
    this.updatedAt,
  });
}
