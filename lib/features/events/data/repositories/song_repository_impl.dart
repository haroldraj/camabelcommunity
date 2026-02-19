import 'package:camabelcommunity/core/error/failures.dart';
import 'package:camabelcommunity/features/events/data/datasources/embedded_datasource/embedded_datasource.dart';
import 'package:camabelcommunity/features/events/data/datasources/firestore_datasource/song_firestore_datasource.dart';
import 'package:camabelcommunity/features/events/data/mappers/song_mapper.dart';
import 'package:camabelcommunity/features/events/domain/entities/song.dart';
import 'package:camabelcommunity/features/events/domain/repositories/song_repository.dart';
import 'package:fpdart/fpdart.dart';

class SongRepositoryImpl implements SongRepository {
  final EmbeddedDatasource embeddedDatasource;
  final SongFirestoreDatasource songFirestoreDatasource;

  SongRepositoryImpl(this.embeddedDatasource, this.songFirestoreDatasource);

  @override
  Future<Either<Failure, Song>> getSongById(String id) async {
    try {
      final song = await songFirestoreDatasource.getSongById(id);
      //await embeddedDatasource.getSongById(id);
      return right(SongMapper.toEntity(song));
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }
}
