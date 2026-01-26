import 'package:camabelcommunity/core/error/exceptions.dart';
import 'package:camabelcommunity/core/error/failures.dart';
import 'package:camabelcommunity/features/events/data/data_sources/mock/mock_events.dart';
import 'package:camabelcommunity/features/events/domain/entities/event.dart';
import 'package:camabelcommunity/features/events/domain/repositories/event_repository.dart';
import 'package:fpdart/fpdart.dart';

class EventRepositoryImpl implements EventRepository {
  // @override
  // Future<Event?> getEventById(String id) async {
  //   // TODO: implement getEventById
  //   throw UnimplementedError();
  // }

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
}
