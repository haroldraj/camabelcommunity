import 'package:camabelcommunity/core/error/failures.dart';
import 'package:camabelcommunity/features/events/data/datasources/embedded_datasource/embedded_datasource.dart';
import 'package:camabelcommunity/features/events/domain/entities/day_program.dart';
import 'package:camabelcommunity/features/events/domain/repositories/day_program_repository.dart';
import 'package:fpdart/src/either.dart';

class DayProgramRepositoryImpl implements DayProgramRepository {
  final EmbeddedDatasource embeddedDatasource;

  DayProgramRepositoryImpl(this.embeddedDatasource);

  @override
  Future<Either<Failure, DayProgram>> getDayProgramById(String id) async {
    try {
      
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
