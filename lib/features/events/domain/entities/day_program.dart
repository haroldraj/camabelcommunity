import 'package:camabelcommunity/features/events/domain/entities/day_program_item.dart';

class DayProgram {
  final String id;
  final String label;
  final List<DayProgramItem> items;

  DayProgram({required this.id, required this.label, required this.items});
}
