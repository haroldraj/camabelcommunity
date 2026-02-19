import 'package:camabelcommunity/features/events/data/models/mass_program_model.dart';

abstract interface class MassProgramFirestoreDatasource {
  Future<MassProgramModel> getMassProgramById(String id);
}
