import 'package:camabelcommunity/core/error/failures.dart';
import 'package:camabelcommunity/features/events/data/datasources/embedded_datasource/embedded_datasource.dart';
import 'package:camabelcommunity/features/events/data/datasources/firestore_datasource/mass_program_firestore_datasource.dart';
import 'package:camabelcommunity/features/events/data/mappers/mass_program_mapper.dart';
import 'package:camabelcommunity/features/events/domain/entities/mass_program.dart';
import 'package:camabelcommunity/features/events/domain/repositories/mass_program_repository.dart';
import 'package:fpdart/fpdart.dart';

class MassProgramRepositoryImpl implements MassProgramRepository {
  final EmbeddedDatasource embeddedDatasource;
  final MassProgramFirestoreDatasource massProgramFirestoreDatasource;

  MassProgramRepositoryImpl(
    this.embeddedDatasource,
    this.massProgramFirestoreDatasource,
  );

  @override
  Future<Either<Failure, MassProgram>> getMassProgramById(String id) async {
    try {
      final massProgram = await massProgramFirestoreDatasource
          .getMassProgramById(id);
      //await embeddedDatasource.getMassProgramById(id);
      return right(MassProgramMapper.toEntity(massProgram));
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }
}
