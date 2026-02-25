import 'package:camabelcommunity/features/events/domain/entities/event.dart';
import 'package:fpdart/fpdart.dart';
import 'package:camabelcommunity/core/error/failures.dart';

abstract interface class EventRepository {
  Future<Either<Failure, List<Event>>> getAllEvents();
  Future<Either<Failure, String>> createEvent(Event event);
  // Future<Event?> getEventById(String id);
  Future<Either<Failure, List<Event>>> getAllEventsFromJson();
  Future<Either<Failure, List<Event>>> getAllUpcomingEvents();
  Future<Either<Failure, List<Event>>> getAllPastEvents();
}
