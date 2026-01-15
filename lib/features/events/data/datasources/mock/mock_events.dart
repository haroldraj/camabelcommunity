import 'package:camabelcommunity/features/events/data/datasources/mock/build_mock_day_program_items.dart';
import 'package:camabelcommunity/features/events/data/datasources/mock/mock_event_covers.dart';
import 'package:camabelcommunity/features/events/data/datasources/mock/mock_mass_program_items.dart';
import 'package:camabelcommunity/features/events/data/datasources/mock/mock_mass_programs.dart';
import 'package:camabelcommunity/features/events/domain/entities/day_program_item.dart';
import 'package:camabelcommunity/features/events/domain/entities/event.dart';
import 'package:camabelcommunity/features/events/domain/entities/mass_program.dart';
import 'package:camabelcommunity/features/events/domain/entities/mass_program_item.dart';
import 'package:camabelcommunity/features/events/domain/enums/event_status.dart';
import 'package:camabelcommunity/features/events/domain/enums/event_type.dart';
import 'package:camabelcommunity/features/events/domain/enums/program_type.dart';

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

  final massProgram = hasMassProgram
      ? mockMassPrograms.firstWhere(
          (mp) => mp.eventId == eventId,
          orElse: () {
            // fallback if eventId mismatch
            return MassProgram(
              id: "mass_fallback_$eventId",
              eventId: eventId,
              title: "Programme de la messe - $eventId",
              massProgramItems: mockMassProgramItems
                  .map(
                    (e) => MassProgramItem(
                      id: "fb_${eventId}_${e.id}",
                      order: e.order,
                      contentType: e.contentType,
                      massPart: e.massPart,
                      text: e.text,
                      songPreview: e.songPreview,
                    ),
                  )
                  .toList(),
            );
          },
        )
      : null;

  final dayProgramItems = hasMassProgram
      ? buildMockDayProgramItems(baseDate: date, massProgram: massProgram!)
      : [
          DayProgramItem(
            title: "Accueil",
            startAt: DateTime(date.year, date.month, date.day, 18, 30),
            description: "Accueil des participants",
            type: ProgramType.dayTimeline,
            massProgram: null,
          ),
          DayProgramItem(
            title: "Réunion",
            startAt: DateTime(date.year, date.month, date.day, 19, 0),
            description: "Temps de partage et organisation",
            type: ProgramType.dayTimeline,
            massProgram: null,
          ),
          DayProgramItem(
            title: "Clôture",
            startAt: DateTime(date.year, date.month, date.day, 20, 30),
            description: "Fin de la rencontre",
            type: ProgramType.dayTimeline,
            massProgram: null,
          ),
          DayProgramItem(
            title: "Message",
            startAt: DateTime(date.year, date.month, date.day, 20, 35),
            description: "Annonce importante",
            type: ProgramType.dayTimeline,
            massProgram: null,
          ),
          DayProgramItem(
            title: "Rangement",
            startAt: DateTime(date.year, date.month, date.day, 20, 45),
            description: "Rangement de la salle",
            type: ProgramType.dayTimeline,
            massProgram: null,
          ),
          DayProgramItem(
            title: "Départ",
            startAt: DateTime(date.year, date.month, date.day, 21, 0),
            description: "Retour à la maison",
            type: ProgramType.dayTimeline,
            massProgram: null,
          ),
          DayProgramItem(
            title: "After",
            startAt: DateTime(date.year, date.month, date.day, 21, 10),
            description: "Discussion libre",
            type: ProgramType.dayTimeline,
            massProgram: null,
          ),
          DayProgramItem(
            title: "Point prière",
            startAt: DateTime(date.year, date.month, date.day, 21, 25),
            description: "Courte prière",
            type: ProgramType.dayTimeline,
            massProgram: null,
          ),
          DayProgramItem(
            title: "Infos prochaines dates",
            startAt: DateTime(date.year, date.month, date.day, 21, 35),
            description: "Dates importantes à venir",
            type: ProgramType.dayTimeline,
            massProgram: null,
          ),
          DayProgramItem(
            title: "Fin",
            startAt: DateTime(date.year, date.month, date.day, 21, 45),
            description: "Fin de l’événement",
            type: ProgramType.dayTimeline,
            massProgram: null,
          ),
        ];

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
    dayProgramItems: dayProgramItems,
    createdAt: DateTime(2026, 1, 1).add(Duration(days: i)),
  );
});
