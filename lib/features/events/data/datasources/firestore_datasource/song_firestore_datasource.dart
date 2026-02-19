import 'package:camabelcommunity/features/events/data/models/song_model.dart';

abstract interface class SongFirestoreDatasource {
  Future<SongModel> getSongById(String id);
}
