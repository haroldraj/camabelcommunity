import 'package:camabelcommunity/features/events/domain/entities/mass_program.dart';
import 'package:camabelcommunity/features/events/domain/enums/program_type.dart';

class DayProgramItem {
  final String title;
  final DateTime startAt;
  final String? description;
  final ProgramType type;
  final MassProgram? massProgram;

  DayProgramItem({
    required this.title,
    required this.startAt,
    required this.type,
    this.description,
    this.massProgram,
  });
}
