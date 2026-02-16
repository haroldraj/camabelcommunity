import 'package:camabelcommunity/features/events/data/datasources/mock/mock_mass_program_items.dart';
import 'package:camabelcommunity/features/events/data/datasources/mock/mock_song_previews.dart';
import 'package:camabelcommunity/features/events/domain/entities/mass_program.dart';
import 'package:camabelcommunity/features/events/domain/entities/mass_program_item.dart';
import 'package:camabelcommunity/features/events/domain/enums/mass_item_type.dart';
import 'package:camabelcommunity/features/events/domain/enums/mass_part.dart';

final List<MassProgram> mockMassPrograms = [
  MassProgram(
    id: "mass_001",
    label: "Programme de la messe - Dimanche 18 Janvier 2026",
    items: mockMassProgramItems,
  ),
  MassProgram(
    id: "mass_002",
    label: "Programme de la messe - Dimanche 25 Janvier 2026",
    items: [
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
    label: "Programme de la messe - Fête spéciale",
    items: [
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
    label: "Programme de la messe - Messe des jeunes",
    items: [
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
    label: "Programme de la messe - Messe commémorative",
    items: [
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
    label: "Programme de la messe - Temps ordinaire",
    items: [
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
    label: "Programme de la messe - Messe en semaine",
    items: [
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
    label: "Programme de la messe - Messe de la communauté",
    items: [
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
    label: "Programme de la messe - Messe d’action de grâce",
    items: [
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
    label: "Programme de la messe - Messe de clôture",
    items: [
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
