import 'package:camabelcommunity/features/events/data/models/day_program_model.dart';

abstract interface class DayProgramFirestoreDatasource {
  Future<DayProgramModel> getDayProgamById(String id);
}
