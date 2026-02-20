import 'package:camabelcommunity/core/error/failures.dart';
import 'package:camabelcommunity/features/events/domain/entities/mass_program.dart';
import 'package:camabelcommunity/features/events/domain/entities/mass_program_item.dart';
import 'package:camabelcommunity/features/events/domain/repositories/mass_program_repository.dart';
import 'package:camabelcommunity/features/events/domain/usecases/get_mass_program_by_id_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockMassProgramRepository extends Mock implements MassProgramRepository {}

void main() {
  late MassProgramRepository repository;
  late GetMassProgramByIdUsecase usecase;

  setUp(() {
    repository = MockMassProgramRepository();
    usecase = GetMassProgramByIdUsecase(repository);
  });

  group("GetMassProgramById", () {
    test(
      "should call repository.getMassProgramById and return Right(MassProgram)",
      () async {
        final massProgram = MassProgram(
          id: "id",
          label: " label",
          date: DateTime.now(),
          items: <MassProgramItem>[],
        );

        when(
          () => repository.getMassProgramById("id"),
        ).thenAnswer((_) async => Right<Failure, MassProgram>(massProgram));

        final result = await usecase("id");

        expect(result, Right<Failure, MassProgram>(massProgram));
        verify(() => repository.getMassProgramById("id")).called(1);
        verifyNoMoreInteractions(repository);
      },
    );
    test(
      "should call repository.getMassProgramById and return Left(Failure)",
      () async {
        final failure = Failure("message");

        when(
          () => repository.getMassProgramById("id"),
        ).thenAnswer((_) async => Left<Failure, MassProgram>(failure));

        final result = await usecase("id");

        expect(result, Left<Failure, MassProgram>(failure));
        verify(() => repository.getMassProgramById("id")).called(1);
        verifyNoMoreInteractions(repository);
      },
    );
  });
}
