import 'package:camabelcommunity/features/events/data/datasources/embedded_datasource/embedded_datasource.dart';
import 'package:camabelcommunity/features/events/data/datasources/firestore_datasource/mass_program_firestore_datasource.dart';
import 'package:camabelcommunity/features/events/data/models/mass_program_item_model.dart';
import 'package:camabelcommunity/features/events/data/models/mass_program_model.dart';
import 'package:camabelcommunity/features/events/data/repositories/mass_program_repository_impl.dart';
import 'package:camabelcommunity/features/events/domain/entities/mass_program_item.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockFirestoreDatasource extends Mock
    implements MassProgramFirestoreDatasource {}

class MockEmbeddedDatasource extends Mock implements EmbeddedDatasource {}

void main() {
  late EmbeddedDatasource embeddedDatasource;
  late MassProgramFirestoreDatasource firestoreDatasource;
  late MassProgramRepositoryImpl repository;

  setUp(() {
    embeddedDatasource = MockEmbeddedDatasource();
    firestoreDatasource = MockFirestoreDatasource();
    repository = MassProgramRepositoryImpl(
      embeddedDatasource,
      firestoreDatasource,
    );
  });

  group("MassProgramRepositoryImpl", () {
    test("should return Right MassProgam when datasource succeeds", () async {
      final massProgramModel = MassProgramModel(
        id: "id",
        label: "label",
        items: <MassProgramItemModel>[],
        date: DateTime(2026),
      );

      when(
        () => firestoreDatasource.getMassProgramById("id"),
      ).thenAnswer((_) async => massProgramModel);

      final result = await repository.getMassProgramById("id");

      expect(result.isRight(), true);

      result.match((_) => fail("message"), (massProgram) {
        expect(massProgram.id, "id");
        expect(massProgram.label, "label");
        expect(massProgram.date, DateTime(2026));
        expect(massProgram.items, <MassProgramItem>[]);
      });

      verify(() => firestoreDatasource.getMassProgramById("id")).called(1);
      verifyNoMoreInteractions(firestoreDatasource);
    });

    test(
      "should return Left Failure when datasource throws exception",
      () async {
        when(
          () => firestoreDatasource.getMassProgramById("id"),
        ).thenThrow(Exception("Exception"));
        final result = await repository.getMassProgramById("id");

        expect(result.isLeft(), true);
        verify(() => firestoreDatasource.getMassProgramById("id")).called(1);
        verifyNoMoreInteractions(firestoreDatasource);
      },
    );
  });
}
