import 'package:camabelcommunity/core/error/exceptions.dart';
import 'package:camabelcommunity/core/error/failures.dart';
import 'package:camabelcommunity/features/events/data/datasources/embedded_datasource/embedded_datasource.dart';
import 'package:camabelcommunity/features/events/data/datasources/mock/mock_events.dart';
import 'package:camabelcommunity/features/events/data/datasources/remote_datasource/event_remote_datasource.dart';
import 'package:camabelcommunity/features/events/data/mappers/event_mapper.dart';
import 'package:camabelcommunity/features/events/data/models/event_model.dart';
import 'package:camabelcommunity/features/events/domain/entities/event.dart';
import 'package:camabelcommunity/features/events/domain/repositories/event_repository.dart';
import 'package:fpdart/fpdart.dart';

class EventRepositoryImpl implements EventRepository {
  final EventRemoteDatasource eventRemoteDatasource;
  final EmbeddedDatasource embeddedDatasource;

  EventRepositoryImpl(this.eventRemoteDatasource, this.embeddedDatasource);

  @override
  Future<Either<Failure, List<Event>>> getEvents() async {
    try {
      await Future.delayed(Duration(seconds: 1));
      return right(mockEvents);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> createEvent(Event event) {
    // TODO: implement createEvent
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Event>>> getAllEventsFromJson() async {
    try {
      final List<EventModel> events = await embeddedDatasource.getAllEvents();

      return right(events.map((e) => EventMapper.toEntity(e)).toList());
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
