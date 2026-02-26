import 'package:camabelcommunity/core/error/failures.dart';
import 'package:camabelcommunity/features/events/data/datasources/embedded_datasource/embedded_datasource.dart';
import 'package:camabelcommunity/features/events/data/datasources/firestore_datasource/day_program_firestore_datasource.dart';
import 'package:camabelcommunity/features/events/data/mappers/day_program_mapper.dart';
import 'package:camabelcommunity/features/events/data/models/day_program_model.dart';
import 'package:camabelcommunity/features/events/domain/entities/day_program.dart';
import 'package:camabelcommunity/features/events/domain/repositories/day_program_repository.dart';
import 'package:fpdart/fpdart.dart';

class DayProgramRepositoryImpl implements DayProgramRepository {
  final EmbeddedDatasource embeddedDatasource;
  final DayProgramFirestoreDatasource dayProgramFirestoreDatasource;

  DayProgramRepositoryImpl(
    this.embeddedDatasource,
    this.dayProgramFirestoreDatasource,
  );

  @override
  Future<Either<Failure, DayProgram>> getDayProgramById(String id) async {
    try {
      // final DayProgramModel dayProgram = await dayProgramFirestoreDatasource
      //     .getDayProgamById(id);
      final DayProgramModel dayProgram = await embeddedDatasource
          .getDayProgramById(id);

      return right(DayProgramMapper.toEntity(dayProgram));
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }
}
