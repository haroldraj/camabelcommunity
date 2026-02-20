import 'package:camabelcommunity/core/error/failures.dart';
import 'package:camabelcommunity/features/events/domain/entities/day_program.dart';
import 'package:camabelcommunity/features/events/domain/entities/day_program_item.dart';
import 'package:camabelcommunity/features/events/domain/repositories/day_program_repository.dart';
import 'package:camabelcommunity/features/events/domain/usecases/get_day_program_by_id_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockDayProgramReporitory extends Mock implements DayProgramRepository {}

void main() {
  late DayProgramRepository repository;
  late GetDayProgramByIdUsecase usecase;

  setUp(() {
    repository = MockDayProgramReporitory();
    usecase = GetDayProgramByIdUsecase(repository);
  });

  group("GeDayProgramById", () {
    test(
      "should call repository.getDayProgramById and return Right(DayProgram)",
      () async {
        final dayProgram = DayProgram(
          id: "id",
          label: "label",
          date: DateTime.now(),
          items: <DayProgramItem>[],
        );

        when(
          () => repository.getDayProgramById("id"),
        ).thenAnswer((_) async => Right<Failure, DayProgram>(dayProgram));

        final result = await usecase("id");

        expect(result, Right<Failure, DayProgram>(dayProgram));
        verify(() => repository.getDayProgramById("id")).called(1);
        verifyNoMoreInteractions(repository);
      },
    );
    test(
      "should call repository.getDayProgramById and return Left(Failure)",
      () async {
        final failure = Failure("message");

        when(
          () => repository.getDayProgramById("id"),
        ).thenAnswer((_) async => Left<Failure, DayProgram>(failure));

        final result = await usecase("id");

        expect(result, Left<Failure, DayProgram>(failure));
        verify(() => repository.getDayProgramById("id")).called(1);
        verifyNoMoreInteractions(repository);
      },
    );
  });
}
