import 'package:camabelcommunity/features/events/data/repositories/event_repository_impl.dart';
import 'package:camabelcommunity/features/events/domain/repositories/event_repository.dart';
import 'package:camabelcommunity/features/events/domain/usecases/get_events.dart';
import 'package:camabelcommunity/features/events/presentation/bloc/events_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/web.dart';

var sl = GetIt.instance;

Future<void> setup() async {
  sl.registerLazySingleton<EventRepository>(() => EventRepositoryImpl());

  sl.registerLazySingleton<GetEvents>(() => GetEvents(sl<EventRepository>()));

  sl.registerFactory<EventsBloc>(() => EventsBloc(getEvents: sl<GetEvents>()));
  Logger().i("Done injection");
}
