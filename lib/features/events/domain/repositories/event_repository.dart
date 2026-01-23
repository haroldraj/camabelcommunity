import 'package:camabelcommunity/features/events/domain/entities/event.dart';

abstract interface class EventRepository {
  Future<List<Event>> getEvents();
  Future<Event?> getEventById(String id);
}
