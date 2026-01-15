import 'package:camabelcommunity/features/events/domain/entities/day_program_item.dart';
import 'package:camabelcommunity/features/events/domain/entities/mass_program.dart';
import 'package:camabelcommunity/features/events/domain/enums/program_type.dart';

List<DayProgramItem> buildMockDayProgramItems({
  required DateTime baseDate,
  required MassProgram massProgram,
}) {
  return [
    DayProgramItem(
      title: "Accueil",
      startAt: DateTime(baseDate.year, baseDate.month, baseDate.day, 12, 30),
      description: "Accueil des arrivants",
      type: ProgramType.dayTimeline,
      massProgram: null,
    ),
    DayProgramItem(
      title: "Repas",
      startAt: DateTime(baseDate.year, baseDate.month, baseDate.day, 13, 0),
      description: "Repas fraternel auberge Espagnol",
      type: ProgramType.dayTimeline,
      massProgram: null,
    ),
    DayProgramItem(
      title: "Répétition de chants",
      startAt: DateTime(baseDate.year, baseDate.month, baseDate.day, 14, 30),
      description: "Répétition des chants de la messe",
      type: ProgramType.dayTimeline,
      massProgram: null,
    ),
    DayProgramItem(
      title: "Célébration Eucharistique",
      startAt: DateTime(baseDate.year, baseDate.month, baseDate.day, 15, 0),
      description: "Début de la célébration Eucharistique",
      type: ProgramType.massProgram,
      massProgram: massProgram,
    ),
    DayProgramItem(
      title: "Annonces",
      startAt: DateTime(baseDate.year, baseDate.month, baseDate.day, 16, 10),
      description: "Annonces pour la communauté",
      type: ProgramType.dayTimeline,
      massProgram: null,
    ),
    DayProgramItem(
      title: "Photo de groupe",
      startAt: DateTime(baseDate.year, baseDate.month, baseDate.day, 16, 20),
      description: "Photo souvenir",
      type: ProgramType.dayTimeline,
      massProgram: null,
    ),
    DayProgramItem(
      title: "Goûter",
      startAt: DateTime(baseDate.year, baseDate.month, baseDate.day, 16, 40),
      description: "Partage et convivialité",
      type: ProgramType.dayTimeline,
      massProgram: null,
    ),
    DayProgramItem(
      title: "Rangement",
      startAt: DateTime(baseDate.year, baseDate.month, baseDate.day, 17, 10),
      description: "Rangement de la salle",
      type: ProgramType.dayTimeline,
      massProgram: null,
    ),
    DayProgramItem(
      title: "Rencontre",
      startAt: DateTime(baseDate.year, baseDate.month, baseDate.day, 17, 30),
      description: "Discussion et échanges",
      type: ProgramType.dayTimeline,
      massProgram: null,
    ),
    DayProgramItem(
      title: "Clôture",
      startAt: DateTime(baseDate.year, baseDate.month, baseDate.day, 18, 0),
      description: "Fin de l’événement",
      type: ProgramType.dayTimeline,
      massProgram: null,
    ),
  ];
}
