import 'package:camabelcommunity/core/error/failures.dart';
import 'package:camabelcommunity/features/events/domain/entities/song.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class SongRepository {
  Future<Either<Failure, Song>> getSongById(String id);
}
