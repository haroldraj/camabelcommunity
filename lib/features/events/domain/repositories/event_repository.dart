import 'package:camabelcommunity/features/events/domain/entities/event.dart';
import 'package:fpdart/fpdart.dart';
import 'package:camabelcommunity/core/error/failures.dart';

abstract interface class EventRepository {
  Future<Either<Failure, List<Event>>> getEvents();
  // Future<Event?> getEventById(String id);
}
