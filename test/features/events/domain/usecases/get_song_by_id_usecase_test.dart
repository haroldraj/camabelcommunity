import 'package:camabelcommunity/core/error/failures.dart';
import 'package:camabelcommunity/features/events/domain/entities/song.dart';
import 'package:camabelcommunity/features/events/domain/enums/book_name.dart';
import 'package:camabelcommunity/features/events/domain/repositories/song_repository.dart';
import 'package:camabelcommunity/features/events/domain/usecases/get_song_by_id_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockSongRepository extends Mock implements SongRepository {}

void main() {
  late SongRepository repository;
  late GetSongByIdUsecase usecase;

  setUp(() {
    repository = MockSongRepository();
    usecase = GetSongByIdUsecase(repository);
  });

  group("GetSongByIdUsecase", () {
    test("should call repository.getSongById and return Right(Song)", () async {
      final song = Song(
        id: "id",
        title: "title",
        keywords: [],
        hasLyrics: true,
        book: BookName.hasina,
      );

      when(
        () => repository.getSongById("id"),
      ).thenAnswer((_) async => Right<Failure, Song>(song));

      final result = await usecase("id");

      expect(result, Right<Failure, Song>(song));
      verify(() => repository.getSongById("id")).called(1);
      verifyNoMoreInteractions(repository);
    });

    test(
      "should call repository.getSongById and return Left(Failure)",
      () async {
        final failure = Failure("message");

        when(
          () => repository.getSongById("id"),
        ).thenAnswer((_) async => Left<Failure, Song>(failure));

        final result = await usecase("id");

        expect(result, Left<Failure, Song>(failure));
        verify(() => repository.getSongById("id")).called(1);
        verifyNoMoreInteractions(repository);
      },
    );
  });
}
