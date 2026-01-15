import 'package:camabelcommunity/features/events/domain/entities/mass_program_item.dart';

class MassProgram {
  final String id;
  final String eventId;
  final String title;
  final List<MassProgramItem> massProgramItems;

  MassProgram({
    required this.id,
    required this.eventId,
    required this.title,
    required this.massProgramItems,
  });
}
