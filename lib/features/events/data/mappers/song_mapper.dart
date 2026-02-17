import 'package:camabelcommunity/features/events/data/models/song_model.dart';
import 'package:camabelcommunity/features/events/domain/entities/song.dart';
import 'package:camabelcommunity/features/events/domain/enums/book_name.dart';

class SongMapper {
  static Song toEntity(SongModel songModel) {
    return Song(
      id: songModel.id,
      title: songModel.title,
      hasLyrics: songModel.hasLyrics,
      book: BookName.values.firstWhere(
        (bookName) => bookName.name == songModel.book,
      ),
      key: songModel.key,
      page: songModel.page,
      keywords: songModel.keywords,
      lyrics: songModel.lyrics,
    );
  }

  static SongModel toModel(Song song) {
    return SongModel(
      id: song.id,
      title: song.title,
      hasLyrics: song.hasLyrics,
      book: song.book.name,
      key: song.key,
      page: song.page,
      keywords: song.keywords,
      lyrics: song.lyrics,
    );
  }
}
