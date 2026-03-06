import 'package:camabelcommunity/features/events/data/datasources/embedded_datasource/embedded_datasource.dart';
import 'package:camabelcommunity/features/events/data/datasources/firestore_datasource/event_firestore_datasource.dart';
import 'package:camabelcommunity/features/events/data/models/event_cover_model.dart';
import 'package:camabelcommunity/features/events/data/models/event_model.dart';
import 'package:camabelcommunity/features/events/data/repositories/event_repository_impl.dart';
import 'package:camabelcommunity/features/events/domain/enums/cover_source.dart';
import 'package:camabelcommunity/features/events/domain/enums/event_status.dart';
import 'package:camabelcommunity/features/events/domain/enums/event_type.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFirestoreDatasource extends Mock
    implements EventFirestoreDatasource {}

class MockEmbeddedDatasource extends Mock implements EmbeddedDatasource {}

void main() {
  late EventFirestoreDatasource firestoreDatasource;
  late EventRepositoryImpl eventRepositoryImpl;
  late EmbeddedDatasource embeddedDatasource;

  setUp(() {
    firestoreDatasource = MockFirestoreDatasource();
    embeddedDatasource = MockEmbeddedDatasource();
    eventRepositoryImpl = EventRepositoryImpl(
      firestoreDatasource,
      embeddedDatasource,
    );
  });

  group("eventRepositoryImpl", () {
    test(
      "should return Right Event when datasource.getAllUpcomingEvents succeeds",
      () async {
        final events = <EventModel>[
          EventModel(
            id: "id",
            title: "title",
            date: DateTime(2026),
            locationName: "locationName",
            locationAddress: "locationAddress",
            type: "mass",
            status: "published",
            cover: EventCoverModel(source: "byDefault"),
            hasMassProgram: true,
            dayProgramId: "dayProgramId",
          ),
        ];

        when(
          () => firestoreDatasource.getAllUpcomingEvents(),
        ).thenAnswer((_) async => events);

        final result = await eventRepositoryImpl.getAllUpcomingEvents();

        expect(result.isRight(), true);

        result.match((_) => fail("message"), (events) {
          expect(events[0].id, "id");
          expect(events[0].title, "title");
          expect(events[0].locationName, "locationName");
          expect(events[0].locationAddress, "locationAddress");
          expect(events[0].type, EventType.mass);
          expect(events[0].cover.source, CoverSource.byDefault);
          expect(events[0].date, DateTime(2026));
          expect(events[0].hasMassProgram, true);
          expect(events[0].dayProgramId, "dayProgramId");
          expect(events[0].status, EventStatus.published);
        });

        verify(() => firestoreDatasource.getAllUpcomingEvents()).called(1);
        verifyNoMoreInteractions(firestoreDatasource);
      },
    );
    test(
      "should return Left Failure when datasource.getAllUpcomingEvents throw exception",
      () async {
        when(
          () => firestoreDatasource.getAllUpcomingEvents(),
        ).thenThrow(Exception("Exception"));

        final result = await eventRepositoryImpl.getAllUpcomingEvents();

        expect(result.isLeft(), true);
        verify(() => firestoreDatasource.getAllUpcomingEvents()).called(1);
        verifyNoMoreInteractions(firestoreDatasource);
      },
    );

    test(
      "should return Right Event when datasource.getAllPastEvents succeeds",
      () async {
        final events = <EventModel>[
          EventModel(
            id: "id",
            title: "title",
            date: DateTime(2026),
            locationName: "locationName",
            locationAddress: "locationAddress",
            type: "mass",
            status: "published",
            cover: EventCoverModel(source: "byDefault"),
            hasMassProgram: true,
            dayProgramId: "dayProgramId",
          ),
        ];

        when(
          () => firestoreDatasource.getAllPastEvents(),
        ).thenAnswer((_) async => events);

        final result = await eventRepositoryImpl.getAllPastEvents();

        expect(result.isRight(), true);

        result.match((_) => fail("message"), (events) {
          expect(events[0].id, "id");
          expect(events[0].title, "title");
          expect(events[0].locationName, "locationName");
          expect(events[0].locationAddress, "locationAddress");
          expect(events[0].type, EventType.mass);
          expect(events[0].cover.source, CoverSource.byDefault);
          expect(events[0].date, DateTime(2026));
          expect(events[0].hasMassProgram, true);
          expect(events[0].dayProgramId, "dayProgramId");
          expect(events[0].status, EventStatus.published);
        });

        verify(() => firestoreDatasource.getAllPastEvents()).called(1);
        verifyNoMoreInteractions(firestoreDatasource);
      },
    );
    test(
      "should return Left Failure when datasource.getAllPastEvents throw exception",
      () async {
        when(
          () => firestoreDatasource.getAllPastEvents(),
        ).thenThrow(Exception("Exception"));

        final result = await eventRepositoryImpl.getAllPastEvents();

        expect(result.isLeft(), true);
        verify(() => firestoreDatasource.getAllPastEvents()).called(1);
        verifyNoMoreInteractions(firestoreDatasource);
      },
    );
  });
}
