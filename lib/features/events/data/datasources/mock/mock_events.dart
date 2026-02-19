import 'package:camabelcommunity/features/events/data/datasources/mock/mock_event_covers.dart';
import 'package:camabelcommunity/features/events/domain/entities/event.dart';
import 'package:camabelcommunity/features/events/domain/enums/event_status.dart';
import 'package:camabelcommunity/features/events/domain/enums/event_type.dart';

final List<Event> mockEvents = List.generate(10, (index) {
  final i = index + 1;
  final eventId = "event_${i.toString().padLeft(3, '0')}";
  final date = DateTime(2026, 1, 10 + i); // Jan 11..Jan 20

  final type = (i % 4 == 0)
      ? EventType.meeting
      : (i % 3 == 0)
      ? EventType.youth
      : EventType.mass;

  final status = (i % 7 == 0) ? EventStatus.cancelled : EventStatus.published;

  final hasMassProgram =
      type == EventType.mass && status != EventStatus.cancelled;

  return Event(
    id: eventId,
    title: hasMassProgram
        ? "Messe de la communauté $i"
        : "Rencontre Camabel $i",
    headline: hasMassProgram
        ? "Un moment de prière et de partage"
        : "Organisation et échanges",
    date: date,
    locationName: "Bruxelles",
    locationAddress: "Rue Exemple $i, 1000 Bruxelles",
    locationLat: null,
    locationLong: null,
    type: type,
    status: status,
    cover: mockEventCovers[index],
    hasMassProgram: hasMassProgram,
    createdAt: DateTime(2026, 1, 1).add(Duration(days: i)),
    dayProgramId: "dayProgramId",
  );
});
