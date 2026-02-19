import 'package:camabelcommunity/features/events/domain/entities/mass_program_item.dart';

class MassProgram {
  final String id;
  final String label;
  final DateTime date;
  final List<MassProgramItem> items;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  MassProgram({
    required this.id,
    required this.label,
    required this.date,
    required List<MassProgramItem> items,
    this.createdAt,
    this.updatedAt,
  }) : items = List.unmodifiable(
         List<MassProgramItem>.of(items)..sort(_compareItems),
       );

  static int _compareItems(MassProgramItem a, MassProgramItem b) {
    return a.order.compareTo(b.order);
  }
}
