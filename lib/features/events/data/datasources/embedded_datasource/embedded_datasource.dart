import 'package:camabelcommunity/features/events/data/models/day_program_model.dart';
import 'package:camabelcommunity/features/events/data/models/event_model.dart';
import 'package:camabelcommunity/features/events/data/models/mass_program_model.dart';
import 'package:camabelcommunity/features/events/data/models/song_model.dart';

abstract interface class EmbeddedDatasource {
  Future<List<EventModel>> getAllEvents();
  Future<List<DayProgramModel>> getAllDayPrograms();
  Future<List<SongModel>> getAllSongs();
  Future<List<MassProgramModel>> getAllMassPrograms();
  Future<DayProgramModel> getDayProgramById(String id);
  Future<MassProgramModel> getMassProgramById(String id);
  Future<SongModel> getSongById(String id);
  Future<List<EventModel>> getAllUpcomingEvents();
}
