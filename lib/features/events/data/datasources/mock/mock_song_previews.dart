import 'package:camabelcommunity/features/events/domain/entities/song_preview.dart';
import 'package:camabelcommunity/features/events/domain/enums/book_name.dart';

final List<SongPreview> mockSongPreviews = [
  SongPreview(
    id: "song_001",
    title: "Ry Tompo ô",
    book: BookName.hasina,
    page: 120,
    hasLyrics: false,
  ),
  SongPreview(
    id: "song_002",
    title: "Misaotra Anao Izahay",
    book: BookName.hasina,
    page: 45,
    hasLyrics: true,
  ),
  SongPreview(
    id: "song_003",
    title: "Fanahy Masina",
    book: BookName.hasina,
    page: 210,
    hasLyrics: false,
  ),
  SongPreview(
    id: "song_004",
    title: "Hira Fiderana",
    book: BookName.noBook,
    page: null,
    hasLyrics: true,
  ),
  SongPreview(
    id: "song_005",
    title: "Tompo ô Mamelà",
    book: BookName.hasina,
    page: 88,
    hasLyrics: true,
  ),
  SongPreview(
    id: "song_006",
    title: "Andriamanitra Ray",
    book: BookName.hasina,
    page: 12,
    hasLyrics: false,
  ),
  SongPreview(
    id: "song_007",
    title: "Mifalia",
    book: BookName.noBook,
    page: null,
    hasLyrics: true,
  ),
  SongPreview(
    id: "song_008",
    title: "Hira Fampiraisana",
    book: BookName.hasina,
    page: 302,
    hasLyrics: false,
  ),
  SongPreview(
    id: "song_009",
    title: "Hira Famaranana",
    book: BookName.noBook,
    page: null,
    hasLyrics: true,
  ),
  SongPreview(
    id: "song_010",
    title: "Aoka ho iray",
    book: BookName.hasina,
    page: 155,
    hasLyrics: true,
  ),
];
