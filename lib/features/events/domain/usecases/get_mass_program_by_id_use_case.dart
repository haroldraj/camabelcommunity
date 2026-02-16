import 'package:camabelcommunity/core/error/failures.dart';
import 'package:camabelcommunity/core/usecase/usecase.dart';
import 'package:camabelcommunity/features/events/domain/entities/mass_program.dart';
import 'package:camabelcommunity/features/events/domain/repositories/mass_program_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetMassProgramByIdUseCase implements UseCase<MassProgram, String> {
  final MassProgramRepository massProgramRepository;

  GetMassProgramByIdUseCase(this.massProgramRepository);

  @override
  Future<Either<Failure, MassProgram>> call(String id) async {
    return await massProgramRepository.getMassProgramById(id);
  }
}
