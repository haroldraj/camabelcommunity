import 'package:camabelcommunity/features/events/data/data_sources/mock/mock_events.dart';
import 'package:camabelcommunity/features/events/domain/entities/event.dart';
import 'package:camabelcommunity/features/events/domain/repositories/event_repository.dart';

class EventRepositoryImpl implements EventRepository {
  @override
  Future<Event?> getEventById(String id) async {
    // TODO: implement getEventById
    throw UnimplementedError();
  }

  @override
  Future<List<Event>> getEvents() async {
    // TODO: implement getEvents
    //throw UnimplementedError();
    return mockEvents;
  }
}
