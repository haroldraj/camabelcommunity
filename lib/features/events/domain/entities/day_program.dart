import 'package:camabelcommunity/features/events/domain/entities/day_program_item.dart';

class DayProgram {
  final String id;
  final String label;
  final DateTime? date;
  final List<DayProgramItem> items;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  DayProgram({
    required this.id,
    required this.label,
    required this.date,
    required List<DayProgramItem> items,
    this.createdAt,
    this.updatedAt,
  }) : items = List.unmodifiable(
         (List<DayProgramItem>.of(items))..sort(_compareItems),
       );

  static int _compareItems(DayProgramItem a, DayProgramItem b) {
    return a.startAt!.compareTo(b.startAt!);
  }
}
