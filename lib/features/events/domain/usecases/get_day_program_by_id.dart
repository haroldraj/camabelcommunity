import 'package:camabelcommunity/core/error/failures.dart';
import 'package:camabelcommunity/core/usecase/usecase.dart';
import 'package:camabelcommunity/features/events/domain/entities/day_program.dart';
import 'package:camabelcommunity/features/events/domain/repositories/day_program_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetDayProgramById implements UseCase<DayProgram, String> {
  final DayProgramRepository dayProgramRepository;

  GetDayProgramById(this.dayProgramRepository);

  @override
  Future<Either<Failure, DayProgram>> call(String id) async {
    return await dayProgramRepository.getDayProgramById(id);
  }
}
