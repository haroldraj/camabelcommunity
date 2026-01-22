import 'package:camabelcommunity/features/events/data/data_sources/mock/mock_song_previews.dart';
import 'package:camabelcommunity/features/events/domain/entities/mass_program_item.dart';
import 'package:camabelcommunity/features/events/domain/enums/mass_item_type.dart';
import 'package:camabelcommunity/features/events/domain/enums/mass_part.dart';

final List<MassProgramItem> mockMassProgramItems = [
  MassProgramItem(
    id: "mpi_001",
    order: 1,
    contentType: MassItemType.text,
    massPart: MassPart.fidirana,
    text: "Fandraisana sy fidirana ao am-piangonana",
    songPreview: null,
  ),
  MassProgramItem(
    id: "mpi_002",
    order: 2,
    contentType: MassItemType.song,
    massPart: MassPart.fidirana,
    text: null,
    songPreview: mockSongPreviews[0],
  ),
  MassProgramItem(
    id: "mpi_003",
    order: 3,
    contentType: MassItemType.text,
    massPart: MassPart.fifonana,
    text: "Fifonana sy fangatahana famelan-keloka",
    songPreview: null,
  ),
  MassProgramItem(
    id: "mpi_004",
    order: 4,
    contentType: MassItemType.song,
    massPart: MassPart.voninahitra,
    text: null,
    songPreview: mockSongPreviews[4],
  ),
  MassProgramItem(
    id: "mpi_005",
    order: 5,
    contentType: MassItemType.text,
    massPart: MassPart.vakitenyVoalohany,
    text: "Vakiteny voalohany",
    songPreview: null,
  ),
  MassProgramItem(
    id: "mpi_006",
    order: 6,
    contentType: MassItemType.song,
    massPart: MassPart.salamo,
    text: null,
    songPreview: mockSongPreviews[7],
  ),
  MassProgramItem(
    id: "mpi_007",
    order: 7,
    contentType: MassItemType.text,
    massPart: MassPart.vakitenyEvanjely,
    text: "Vakiteny Evanjely",
    songPreview: null,
  ),
  MassProgramItem(
    id: "mpi_008",
    order: 8,
    contentType: MassItemType.text,
    massPart: MassPart.ranombavaka,
    text: "Ranombavaka ho an’ny fiangonana sy ny fiaraha-monina",
    songPreview: null,
  ),
  MassProgramItem(
    id: "mpi_009",
    order: 9,
    contentType: MassItemType.song,
    massPart: MassPart.komonio,
    text: null,
    songPreview: mockSongPreviews[9],
  ),
  MassProgramItem(
    id: "mpi_010",
    order: 10,
    contentType: MassItemType.song,
    massPart: MassPart.fanirahana,
    text: null,
    songPreview: mockSongPreviews[8],
  ),
];
