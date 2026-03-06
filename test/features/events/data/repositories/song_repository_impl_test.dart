import 'package:camabelcommunity/features/events/data/datasources/embedded_datasource/embedded_datasource.dart';
import 'package:camabelcommunity/features/events/data/datasources/firestore_datasource/song_firestore_datasource.dart';
import 'package:camabelcommunity/features/events/data/models/song_model.dart';
import 'package:camabelcommunity/features/events/data/repositories/song_repository_impl.dart';
import 'package:camabelcommunity/features/events/domain/enums/book_name.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFirestoreDatasource extends Mock implements SongFirestoreDatasource {}

class MockEmbeddedDatasource extends Mock implements EmbeddedDatasource {}

void main() {
  late SongFirestoreDatasource songFirestoreDatasource;
  late SongRepositoryImpl songRepositoryImpl;
  late EmbeddedDatasource embeddedDatasource;

  setUp(() {
    songFirestoreDatasource = MockFirestoreDatasource();
    embeddedDatasource = MockEmbeddedDatasource();
    songRepositoryImpl = SongRepositoryImpl(
      embeddedDatasource,
      songFirestoreDatasource,
    );
  });

  group("SongRepositoryImpl", () {
    test("should return Right Song when datasource succeeds", () async {
      final songModel = SongModel(
        id: "id",
        title: "title",
        keywords: ["keywords"],
        hasLyrics: true,
        book: "noBook",
      );

      when(
        () => songFirestoreDatasource.getSongById("id"),
      ).thenAnswer((_) async => songModel);

      final result = await songRepositoryImpl.getSongById("id");

      expect(result.isRight(), true);

      result.match((_) => fail("message"), (song) {
        expect(song.id, "id");
        expect(song.title, "title");
        expect(song.keywords, ["keywords"]);
        expect(song.hasLyrics, true);
        expect(song.book, BookName.noBook);
      });

      verify(() => songFirestoreDatasource.getSongById("id")).called(1);
      verifyNoMoreInteractions(songFirestoreDatasource);
    });
    test(
      "should return Left Failure when datasource throw exception",
      () async {
        when(
          () => songFirestoreDatasource.getSongById("id"),
        ).thenThrow(Exception("Exception"));

        final result = await songRepositoryImpl.getSongById("id");

        expect(result.isLeft(), true);
        verify(() => songFirestoreDatasource.getSongById("id")).called(1);
        verifyNoMoreInteractions(songFirestoreDatasource);
      },
    );
  });
}
