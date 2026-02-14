import 'package:camabelcommunity/features/events/data/datasources/embedded_datasource/embedded_datasource.dart';
import 'package:camabelcommunity/features/events/data/datasources/embedded_datasource/embedded_datasource_impl.dart';
import 'package:camabelcommunity/features/events/data/datasources/remote_datasource/event_remote_datasource.dart';
import 'package:camabelcommunity/features/events/data/datasources/remote_datasource/event_remote_datasource_impl.dart';
import 'package:camabelcommunity/features/events/data/repositories/day_program_repository_impl.dart';
import 'package:camabelcommunity/features/events/data/repositories/event_repository_impl.dart';
import 'package:camabelcommunity/features/events/domain/repositories/day_program_repository.dart';
import 'package:camabelcommunity/features/events/domain/repositories/event_repository.dart';
import 'package:camabelcommunity/features/events/domain/usecases/get_day_program_by_id_use_case.dart';
import 'package:camabelcommunity/features/events/domain/usecases/get_events_use_case.dart';
import 'package:camabelcommunity/features/events/presentation/bloc/day_programs/day_programs_bloc.dart';
import 'package:camabelcommunity/features/events/presentation/bloc/events/events_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/web.dart';

var sl = GetIt.instance;

Future<void> setup() async {
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  sl.registerLazySingleton<EmbeddedDatasource>(() => EmbeddedDatasourceImpl());

  sl.registerLazySingleton<EventRemoteDatasource>(
    () => EventRemoteDatasourceWithMockDataImpl(sl<FirebaseFirestore>()),
  );

  sl.registerLazySingleton<EventRepository>(
    () => EventRepositoryImpl(
      sl<EventRemoteDatasource>(),
      sl<EmbeddedDatasource>(),
    ),
  );

  sl.registerLazySingleton<DayProgramRepository>(
    () => DayProgramRepositoryImpl(sl<EmbeddedDatasource>()),
  );

  sl.registerLazySingleton<GetDayProgramByIdUseCase>(
    () => GetDayProgramByIdUseCase(sl<DayProgramRepository>()),
  );

  sl.registerLazySingleton<GetEventsUseCase>(
    () => GetEventsUseCase(sl<EventRepository>()),
  );

  sl.registerFactory<EventsBloc>(
    () => EventsBloc(getEvents: sl<GetEventsUseCase>()),
  );

  sl.registerFactory<DayProgramsBloc>(
    () => DayProgramsBloc(
      getDayProgramByIdUseCase: sl<GetDayProgramByIdUseCase>(),
    ),
  );

  Logger().i("Done injection");
}
