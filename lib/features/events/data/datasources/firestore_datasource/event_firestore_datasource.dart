import 'package:camabelcommunity/features/events/data/models/event_model.dart';

abstract interface class EventFirestoreDatasource {
  Future<String> createEvent(EventModel event);
  Future<List<EventModel>> getAllUpcomingEvents();
}
