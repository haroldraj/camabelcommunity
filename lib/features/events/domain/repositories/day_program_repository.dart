import 'package:camabelcommunity/core/error/failures.dart';
import 'package:camabelcommunity/features/events/domain/entities/day_program.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class DayProgramRepository {
  Future<Either<Failure, DayProgram>> getDayProgramById(String id);
}
