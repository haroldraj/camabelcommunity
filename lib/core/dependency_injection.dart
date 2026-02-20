import 'package:camabelcommunity/features/events/data/datasources/embedded_datasource/embedded_datasource.dart';
import 'package:camabelcommunity/features/events/data/datasources/embedded_datasource/embedded_datasource_impl.dart';
import 'package:camabelcommunity/features/events/data/datasources/firestore_datasource/day_program_firestore_datasource.dart';
import 'package:camabelcommunity/features/events/data/datasources/firestore_datasource/day_program_firestore_datasource_impl.dart';
import 'package:camabelcommunity/features/events/data/datasources/firestore_datasource/event_firestore_datasource.dart';
import 'package:camabelcommunity/features/events/data/datasources/firestore_datasource/event_firestore_datasource_impl.dart';
import 'package:camabelcommunity/features/events/data/datasources/firestore_datasource/mass_program_firestore_datasource.dart';
import 'package:camabelcommunity/features/events/data/datasources/firestore_datasource/mass_program_firestore_datasource_impl.dart';
import 'package:camabelcommunity/features/events/data/datasources/firestore_datasource/song_firestore_datasource.dart';
import 'package:camabelcommunity/features/events/data/datasources/firestore_datasource/song_firestore_datasource_impl.dart';
import 'package:camabelcommunity/features/events/data/repositories/day_program_repository_impl.dart';
import 'package:camabelcommunity/features/events/data/repositories/event_repository_impl.dart';
import 'package:camabelcommunity/features/events/data/repositories/mass_program_repository_impl.dart';
import 'package:camabelcommunity/features/events/data/repositories/song_repository_impl.dart';
import 'package:camabelcommunity/features/events/domain/repositories/day_program_repository.dart';
import 'package:camabelcommunity/features/events/domain/repositories/event_repository.dart';
import 'package:camabelcommunity/features/events/domain/repositories/mass_program_repository.dart';
import 'package:camabelcommunity/features/events/domain/repositories/song_repository.dart';
import 'package:camabelcommunity/features/events/domain/usecases/get_all_upcoming_events_usecase.dart';
import 'package:camabelcommunity/features/events/domain/usecases/get_day_program_by_id_usecase.dart';
import 'package:camabelcommunity/features/events/domain/usecases/get_all_events_usecase.dart';
import 'package:camabelcommunity/features/events/domain/usecases/get_mass_program_by_id_usecase.dart';
import 'package:camabelcommunity/features/events/domain/usecases/get_song_by_id_usecase.dart';
import 'package:camabelcommunity/features/events/presentation/bloc/day_program/day_program_bloc.dart';
import 'package:camabelcommunity/features/events/presentation/bloc/events/events_bloc.dart';
import 'package:camabelcommunity/features/events/presentation/bloc/mass_program/mass_program_bloc.dart';
import 'package:camabelcommunity/features/events/presentation/bloc/song/song_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/web.dart';

var sl = GetIt.instance;

Future<void> setup() async {
  //Firebase Firestore
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  //Datasources
  sl.registerLazySingleton<EmbeddedDatasource>(() => EmbeddedDatasourceImpl());

  sl.registerLazySingleton<SongFirestoreDatasource>(
    () => SongFirestoreDatasourceImpl(sl<FirebaseFirestore>()),
  );

    sl.registerLazySingleton<DayProgramFirestoreDatasource>(
    () => DayProgramFirestoreDatasourceImpl(sl<FirebaseFirestore>()),
  );

    sl.registerLazySingleton<MassProgramFirestoreDatasource>(
    () => MassProgramFirestoreDatasourceImpl(sl<FirebaseFirestore>()),
  );

  sl.registerLazySingleton<EventFirestoreDatasource>(
    () => EventFirestoreDatasourceImpl(sl<FirebaseFirestore>()),
  );

  //Repositories
  sl.registerLazySingleton<EventRepository>(
    () => EventRepositoryImpl(
      sl<EventFirestoreDatasource>(),
      sl<EmbeddedDatasource>(),
    ),
  );

  sl.registerLazySingleton<DayProgramRepository>(
    () => DayProgramRepositoryImpl(
      sl<EmbeddedDatasource>(),
      sl<DayProgramFirestoreDatasource>(),
    ),
  );

  sl.registerLazySingleton<MassProgramRepository>(
    () => MassProgramRepositoryImpl(
      sl<EmbeddedDatasource>(),
      sl<MassProgramFirestoreDatasource>(),
    ),
  );

  sl.registerLazySingleton<SongRepository>(
    () => SongRepositoryImpl(
      sl<EmbeddedDatasource>(),
      sl<SongFirestoreDatasource>(),
    ),
  );

  //Usecases
  sl.registerLazySingleton<GetDayProgramByIdUsecase>(
    () => GetDayProgramByIdUsecase(sl<DayProgramRepository>()),
  );

  sl.registerLazySingleton<GetAllEventsUsecase>(
    () => GetAllEventsUsecase(sl<EventRepository>()),
  );

  sl.registerLazySingleton<GetAllUpcomingEventsUsecase>(
    () => GetAllUpcomingEventsUsecase(sl<EventRepository>()),
  );

  sl.registerLazySingleton<GetMassProgramByIdUsecase>(
    () => GetMassProgramByIdUsecase(sl<MassProgramRepository>()),
  );

  sl.registerLazySingleton<GetSongByIdUsecase>(
    () => GetSongByIdUsecase(sl<SongRepository>()),
  );


  //Blocs
  sl.registerFactory<EventsBloc>(
    () => EventsBloc(
      getAllEvents: sl<GetAllEventsUsecase>(),
      getAllUpcomingEventsUseCase: sl<GetAllUpcomingEventsUsecase>(),
    ),
  );

  sl.registerFactory<DayProgramBloc>(
    () => DayProgramBloc(
      getDayProgramByIdUseCase: sl<GetDayProgramByIdUsecase>(),
    ),
  );

  sl.registerFactory<MassProgramBloc>(
    () => MassProgramBloc(
      getMassProgramByIdUseCase: sl<GetMassProgramByIdUsecase>(),
    ),
  );

  sl.registerFactory<SongBloc>(
    () => SongBloc(getSongByIdUseCase: sl<GetSongByIdUsecase>()),
  );

  Logger().i("Dependancies injection done.");
}
