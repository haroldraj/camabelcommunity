import 'package:camabelcommunity/features/events/domain/entities/mass_program_item.dart';

class MassProgram {
  final String id;
  final String label;
  final DateTime date;
  final List<MassProgramItem> items;

  MassProgram({
    required this.id,
    required this.label,
    required this.date,
    required List<MassProgramItem> items,
  }) : items = List.unmodifiable(
         List<MassProgramItem>.of(items)..sort(_compareItems),
       );

  static int _compareItems(MassProgramItem a, MassProgramItem b) {
    return a.order.compareTo(b.order);
  }
}
