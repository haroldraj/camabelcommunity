import 'package:camabelcommunity/core/error/failures.dart';
import 'package:camabelcommunity/features/events/domain/entities/mass_program.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class MassProgramRepository {
  Future<Either<Failure, MassProgram>> getMassProgramById(String id);
}
