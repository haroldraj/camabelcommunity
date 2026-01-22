import 'package:camabelcommunity/features/events/data/data_sources/mock/mock_mass_program_items.dart';
import 'package:camabelcommunity/features/events/data/data_sources/mock/mock_song_previews.dart';
import 'package:camabelcommunity/features/events/domain/entities/mass_program.dart';
import 'package:camabelcommunity/features/events/domain/entities/mass_program_item.dart';
import 'package:camabelcommunity/features/events/domain/enums/mass_item_type.dart';
import 'package:camabelcommunity/features/events/domain/enums/mass_part.dart';

final List<MassProgram> mockMassPrograms = [
  MassProgram(
    id: "mass_001",
    eventId: "event_001",
    title: "Programme de la messe - Dimanche 18 Janvier 2026",
    massProgramItems: mockMassProgramItems,
  ),
  MassProgram(
    id: "mass_002",
    eventId: "event_002",
    title: "Programme de la messe - Dimanche 25 Janvier 2026",
    massProgramItems: [
      ...mockMassProgramItems.map((e) {
        if (e.id == "mpi_002") {
          return MassProgramItem(
            id: "mpi2_002",
            order: 2,
            contentType: MassItemType.song,
            massPart: MassPart.fidirana,
            songPreview: mockSongPreviews[1],
            text: null,
          );
        }
        return MassProgramItem(
          id: "mp2_${e.id}",
          order: e.order,
          contentType: e.contentType,
          massPart: e.massPart,
          text: e.text,
          songPreview: e.songPreview,
        );
      }),
    ],
  ),
  MassProgram(
    id: "mass_003",
    eventId: "event_003",
    title: "Programme de la messe - Fête spéciale",
    massProgramItems: [
      ...mockMassProgramItems.map((e) {
        if (e.contentType == MassItemType.song &&
            e.massPart == MassPart.komonio) {
          return MassProgramItem(
            id: "mpi3_009",
            order: e.order,
            contentType: MassItemType.song,
            massPart: MassPart.komonio,
            songPreview: mockSongPreviews[2],
            text: null,
          );
        }
        return MassProgramItem(
          id: "mp3_${e.id}",
          order: e.order,
          contentType: e.contentType,
          massPart: e.massPart,
          text: e.text,
          songPreview: e.songPreview,
        );
      }),
    ],
  ),
  MassProgram(
    id: "mass_004",
    eventId: "event_004",
    title: "Programme de la messe - Messe des jeunes",
    massProgramItems: [
      ...mockMassProgramItems.map((e) {
        if (e.contentType == MassItemType.song &&
            e.massPart == MassPart.fanirahana) {
          return MassProgramItem(
            id: "mpi4_010",
            order: e.order,
            contentType: MassItemType.song,
            massPart: MassPart.fanirahana,
            songPreview: mockSongPreviews[6],
            text: null,
          );
        }
        return MassProgramItem(
          id: "mp4_${e.id}",
          order: e.order,
          contentType: e.contentType,
          massPart: e.massPart,
          text: e.text,
          songPreview: e.songPreview,
        );
      }),
    ],
  ),
  MassProgram(
    id: "mass_005",
    eventId: "event_005",
    title: "Programme de la messe - Messe commémorative",
    massProgramItems: [
      ...mockMassProgramItems.map(
        (e) => MassProgramItem(
          id: "mp5_${e.id}",
          order: e.order,
          contentType: e.contentType,
          massPart: e.massPart,
          text: e.text,
          songPreview: e.songPreview,
        ),
      ),
    ],
  ),
  MassProgram(
    id: "mass_006",
    eventId: "event_006",
    title: "Programme de la messe - Temps ordinaire",
    massProgramItems: [
      ...mockMassProgramItems.map(
        (e) => MassProgramItem(
          id: "mp6_${e.id}",
          order: e.order,
          contentType: e.contentType,
          massPart: e.massPart,
          text: e.text,
          songPreview: e.songPreview,
        ),
      ),
    ],
  ),
  MassProgram(
    id: "mass_007",
    eventId: "event_007",
    title: "Programme de la messe - Messe en semaine",
    massProgramItems: [
      ...mockMassProgramItems.map((e) {
        if (e.contentType == MassItemType.song &&
            e.massPart == MassPart.salamo) {
          return MassProgramItem(
            id: "mpi7_006",
            order: e.order,
            contentType: MassItemType.song,
            massPart: MassPart.salamo,
            songPreview: mockSongPreviews[3],
            text: null,
          );
        }
        return MassProgramItem(
          id: "mp7_${e.id}",
          order: e.order,
          contentType: e.contentType,
          massPart: e.massPart,
          text: e.text,
          songPreview: e.songPreview,
        );
      }),
    ],
  ),
  MassProgram(
    id: "mass_008",
    eventId: "event_008",
    title: "Programme de la messe - Messe de la communauté",
    massProgramItems: [
      ...mockMassProgramItems.map((e) {
        if (e.contentType == MassItemType.song &&
            e.massPart == MassPart.voninahitra) {
          return MassProgramItem(
            id: "mpi8_004",
            order: e.order,
            contentType: MassItemType.song,
            massPart: MassPart.voninahitra,
            songPreview: mockSongPreviews[5],
            text: null,
          );
        }
        return MassProgramItem(
          id: "mp8_${e.id}",
          order: e.order,
          contentType: e.contentType,
          massPart: e.massPart,
          text: e.text,
          songPreview: e.songPreview,
        );
      }),
    ],
  ),
  MassProgram(
    id: "mass_009",
    eventId: "event_009",
    title: "Programme de la messe - Messe d’action de grâce",
    massProgramItems: [
      ...mockMassProgramItems.map((e) {
        if (e.contentType == MassItemType.song &&
            e.massPart == MassPart.fidirana) {
          return MassProgramItem(
            id: "mpi9_002",
            order: e.order,
            contentType: MassItemType.song,
            massPart: MassPart.fidirana,
            songPreview: mockSongPreviews[1],
            text: null,
          );
        }
        return MassProgramItem(
          id: "mp9_${e.id}",
          order: e.order,
          contentType: e.contentType,
          massPart: e.massPart,
          text: e.text,
          songPreview: e.songPreview,
        );
      }),
    ],
  ),
  MassProgram(
    id: "mass_010",
    eventId: "event_010",
    title: "Programme de la messe - Messe de clôture",
    massProgramItems: [
      ...mockMassProgramItems.map((e) {
        if (e.contentType == MassItemType.song &&
            e.massPart == MassPart.fanirahana) {
          return MassProgramItem(
            id: "mpi10_010",
            order: e.order,
            contentType: MassItemType.song,
            massPart: MassPart.fanirahana,
            songPreview: mockSongPreviews[6],
            text: null,
          );
        }
        return MassProgramItem(
          id: "mp10_${e.id}",
          order: e.order,
          contentType: e.contentType,
          massPart: e.massPart,
          text: e.text,
          songPreview: e.songPreview,
        );
      }),
    ],
  ),
];
