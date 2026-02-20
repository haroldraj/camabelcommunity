import 'package:camabelcommunity/core/error/failures.dart';
import 'package:camabelcommunity/core/usecase/usecase.dart';
import 'package:camabelcommunity/features/events/domain/entities/event.dart';
import 'package:camabelcommunity/features/events/domain/entities/event_cover.dart';
import 'package:camabelcommunity/features/events/domain/enums/cover_source.dart';
import 'package:camabelcommunity/features/events/domain/enums/event_status.dart';
import 'package:camabelcommunity/features/events/domain/enums/event_type.dart';
import 'package:camabelcommunity/features/events/domain/repositories/event_repository.dart';
import 'package:camabelcommunity/features/events/domain/usecases/get_all_upcoming_events_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockEventRepository extends Mock implements EventRepository {}

void main() {
  late MockEventRepository repository;
  late GetAllUpcomingEventsUsecase usecase;

  setUp(() {
    repository = MockEventRepository();
    usecase = GetAllUpcomingEventsUsecase(repository);
  });

  group("GetAllUpcomingEventsUsecase", () {
    test(
      "should call repository.getAllUpcomingEvents and return Right(List<Event>)",
      () async {
        final events = <Event>[
          Event(
            id: "id",
            title: "title",
            date: DateTime.now(),
            locationName: "locationName",
            locationAddress: "locationAddress",
            type: EventType.mass,
            status: EventStatus.published,
            cover: EventCover(source: CoverSource.byDefault),
            hasMassProgram: true,
            dayProgramId: "dayProgramId",
          ),
        ];

        when(
          () => repository.getAllUpcomingEvents(),
        ).thenAnswer((_) async => Right(events));

        final result = await usecase(NoParams());

        expect(result, Right<Failure, List<Event>>(events));
        verify(() => repository.getAllUpcomingEvents()).called(1);
        verifyNoMoreInteractions(repository);
      },
    );
    test(
      "should call repository.getAllUpcomingEvents and return Left(Failure)",
      () async {
        final failure = Failure("message");

        when(
          () => repository.getAllUpcomingEvents(),
        ).thenAnswer((_) async => Left(failure));

        final result = await usecase(NoParams());

        expect(result, Left<Failure, List<Event>>(failure));
        verify(() => repository.getAllUpcomingEvents()).called(1);
        verifyNoMoreInteractions(repository);
      },
    );
  });
}
