import 'package:camabelcommunity/features/events/data/datasources/embedded_datasource/embedded_datasource.dart';
import 'package:camabelcommunity/features/events/data/datasources/embedded_datasource/embedded_datasource_impl.dart';
import 'package:camabelcommunity/features/events/data/datasources/firestore_datasource/event_firestore_datasource.dart';
import 'package:camabelcommunity/features/events/data/datasources/firestore_datasource/event_firestore_datasource_impl.dart';
import 'package:camabelcommunity/features/events/data/repositories/day_program_repository_impl.dart';
import 'package:camabelcommunity/features/events/data/repositories/event_repository_impl.dart';
import 'package:camabelcommunity/features/events/data/repositories/mass_program_repository_impl.dart';
import 'package:camabelcommunity/features/events/data/repositories/song_repository_impl.dart';
import 'package:camabelcommunity/features/events/domain/repositories/day_program_repository.dart';
import 'package:camabelcommunity/features/events/domain/repositories/event_repository.dart';
import 'package:camabelcommunity/features/events/domain/repositories/mass_program_repository.dart';
import 'package:camabelcommunity/features/events/domain/repositories/song_repository.dart';
import 'package:camabelcommunity/features/events/domain/usecases/get_all_upcoming_events_use_case.dart';
import 'package:camabelcommunity/features/events/domain/usecases/get_day_program_by_id_use_case.dart';
import 'package:camabelcommunity/features/events/domain/usecases/get_all_events_use_case.dart';
import 'package:camabelcommunity/features/events/domain/usecases/get_mass_program_by_id_use_case.dart';
import 'package:camabelcommunity/features/events/domain/usecases/get_song_by_id_use_case.dart';
import 'package:camabelcommunity/features/events/presentation/bloc/day_program/day_program_bloc.dart';
import 'package:camabelcommunity/features/events/presentation/bloc/events/events_bloc.dart';
import 'package:camabelcommunity/features/events/presentation/bloc/mass_program/mass_program_bloc.dart';
import 'package:camabelcommunity/features/events/presentation/bloc/song/song_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/web.dart';

var sl = GetIt.instance;

Future<void> setup() async {
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  sl.registerLazySingleton<EmbeddedDatasource>(() => EmbeddedDatasourceImpl());

  sl.registerLazySingleton<EventFirestoreDatasource>(
    () => EventFirestoreDatasourceImpl(sl<FirebaseFirestore>()),
  );

  sl.registerLazySingleton<EventRepository>(
    () => EventRepositoryImpl(
      sl<EventFirestoreDatasource>(),
      sl<EmbeddedDatasource>(),
    ),
  );

  sl.registerLazySingleton<DayProgramRepository>(
    () => DayProgramRepositoryImpl(sl<EmbeddedDatasource>()),
  );

  sl.registerLazySingleton<MassProgramRepository>(
    () => MassProgramRepositoryImpl(sl<EmbeddedDatasource>()),
  );

  sl.registerLazySingleton<SongRepository>(
    () => SongRepositoryImpl(sl<EmbeddedDatasource>()),
  );

  sl.registerLazySingleton<GetDayProgramByIdUseCase>(
    () => GetDayProgramByIdUseCase(sl<DayProgramRepository>()),
  );

  sl.registerLazySingleton<GetAllEventsUseCase>(
    () => GetAllEventsUseCase(sl<EventRepository>()),
  );

  sl.registerLazySingleton<GetAllUpcomingEventsUseCase>(
    () => GetAllUpcomingEventsUseCase(sl<EventRepository>()),
  );

  sl.registerLazySingleton<GetMassProgramByIdUseCase>(
    () => GetMassProgramByIdUseCase(sl<MassProgramRepository>()),
  );

  sl.registerLazySingleton<GetSongByIdUseCase>(
    () => GetSongByIdUseCase(sl<SongRepository>()),
  );

  sl.registerFactory<EventsBloc>(
    () => EventsBloc(
      getAllEvents: sl<GetAllEventsUseCase>(),
      getAllUpcomingEventsUseCase: sl<GetAllUpcomingEventsUseCase>(),
    ),
  );

  sl.registerFactory<DayProgramBloc>(
    () => DayProgramBloc(
      getDayProgramByIdUseCase: sl<GetDayProgramByIdUseCase>(),
    ),
  );

  sl.registerFactory<MassProgramBloc>(
    () => MassProgramBloc(
      getMassProgramByIdUseCase: sl<GetMassProgramByIdUseCase>(),
    ),
  );

  sl.registerFactory<SongBloc>(
    () => SongBloc(getSongByIdUseCase: sl<GetSongByIdUseCase>()),
  );

  Logger().i("Dependancies injection done.");
}
