import 'package:camabelcommunity/features/events/data/models/song_preview_model.dart';
import 'package:camabelcommunity/features/events/domain/entities/song_preview.dart';
import 'package:camabelcommunity/features/events/domain/enums/book_name.dart';

class SongPreviewMapper {
  static SongPreview? toEntity(SongPreviewModel? songPreviewModel) {
    return songPreviewModel == null
        ? null
        : SongPreview(
            id: songPreviewModel.id,
            title: songPreviewModel.title,
            hasLyrics: songPreviewModel.hasLyrics,
            book: BookName.values.firstWhere(
              (bookName) => bookName.name == songPreviewModel.book,
            ),
            key: songPreviewModel.key,
            page: songPreviewModel.page,
          );
  }

  static SongPreviewModel? toModel(SongPreview? songPreview) {
    return songPreview == null
        ? null
        : SongPreviewModel(
            id: songPreview.id,
            title: songPreview.title,
            hasLyrics: songPreview.hasLyrics,
            book: songPreview.book.name,
            key: songPreview.key,
            page: songPreview.page,
          );
  }
}
