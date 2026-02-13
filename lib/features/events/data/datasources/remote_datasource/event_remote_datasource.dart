import 'package:camabelcommunity/features/events/data/models/event_model.dart';

abstract interface class EventRemoteDatasource {
  Future<String> createEvent(EventModel event);
}
