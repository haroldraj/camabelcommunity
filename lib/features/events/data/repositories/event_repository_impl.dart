import 'package:camabelcommunity/features/events/domain/entities/event.dart';
import 'package:camabelcommunity/features/events/domain/repositories/event_repository.dart';

class EventRepositoryImpl implements EventRepository {
  @override
  Future<Event?> getEventById(String id) {
    // TODO: implement getEventById
    throw UnimplementedError();
  }

  @override
  Future<List<Event>> getEvents() {
    // TODO: implement getEvents
    throw UnimplementedError();
  }
}
