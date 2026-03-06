import 'package:camabelcommunity/features/events/data/datasources/embedded_datasource/embedded_datasource.dart';
import 'package:camabelcommunity/features/events/data/datasources/firestore_datasource/day_program_firestore_datasource.dart';
import 'package:camabelcommunity/features/events/data/models/day_program_item_model.dart';
import 'package:camabelcommunity/features/events/data/models/day_program_model.dart';
import 'package:camabelcommunity/features/events/data/repositories/day_program_repository_impl.dart';
import 'package:camabelcommunity/features/events/domain/entities/day_program_item.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFirestoreDatasource extends Mock
    implements DayProgramFirestoreDatasource {}

class MockEmbeddedDatasource extends Mock implements EmbeddedDatasource {}

void main() {
  late MockFirestoreDatasource firestoreDatasource;
  late MockEmbeddedDatasource embeddedDatasource;
  late DayProgramRepositoryImpl repositoryImpl;

  setUp(() {
    firestoreDatasource = MockFirestoreDatasource();
    embeddedDatasource = MockEmbeddedDatasource();
    repositoryImpl = DayProgramRepositoryImpl(
      embeddedDatasource,
      firestoreDatasource,
    );
  });

  group("DayProgramRepositoryImpl", () {
    test("should return Right DayPgram when datasource succeeds", () async {
      final dayProgramModel = DayProgramModel(
        id: "id",
        label: "label",
        date: DateTime(2026),
        items: <DayProgramItemModel>[],
      );

      when(
        () => firestoreDatasource.getDayProgramById("id"),
      ).thenAnswer((_) async => dayProgramModel);

      final result = await repositoryImpl.getDayProgramById("id");

      expect(result.isRight(), true);

      result.match((_) => fail("message"), (dayProgram) {
        expect(dayProgram.id, "id");
        expect(dayProgram.label, "label");
        expect(dayProgram.date, DateTime(2026));
        expect(dayProgram.items, <DayProgramItem>[]);
      });

      verify(() => firestoreDatasource.getDayProgramById("id")).called(1);
      verifyNoMoreInteractions(firestoreDatasource);
    });
    test("should return Failure when datasource throws exception", () async {
      when(
        () => firestoreDatasource.getDayProgramById("id"),
      ).thenThrow(Exception("Exception"));

      final result = await repositoryImpl.getDayProgramById("id");

      expect(result.isLeft(), true);
      verify(() => firestoreDatasource.getDayProgramById("id")).called(1);
      verifyNoMoreInteractions(firestoreDatasource);
    });
  });
}
