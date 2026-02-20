import 'package:camabelcommunity/core/error/failures.dart';
import 'package:camabelcommunity/core/usecase/usecase.dart';
import 'package:camabelcommunity/features/events/domain/entities/song.dart';
import 'package:camabelcommunity/features/events/domain/repositories/song_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetSongByIdUsecase implements Usecase<Song, String> {
  final SongRepository songRepository;

  GetSongByIdUsecase(this.songRepository);

  @override
  Future<Either<Failure, Song>> call(String id) async {
    return await songRepository.getSongById(id);
  }
}
