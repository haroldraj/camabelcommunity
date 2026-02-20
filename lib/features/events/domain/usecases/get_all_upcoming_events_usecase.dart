import 'package:camabelcommunity/core/error/failures.dart';
import 'package:camabelcommunity/core/usecase/usecase.dart';
import 'package:camabelcommunity/features/events/domain/entities/event.dart';
import 'package:camabelcommunity/features/events/domain/repositories/event_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetAllUpcomingEventsUsecase implements Usecase<List<Event>, NoParams> {
  final EventRepository eventRepository;

  GetAllUpcomingEventsUsecase(this.eventRepository);

  @override
  Future<Either<Failure, List<Event>>> call(NoParams params) async{
    return await eventRepository.getAllUpcomingEvents();
  }
}
