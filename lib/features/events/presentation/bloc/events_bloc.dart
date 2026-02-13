import 'package:camabelcommunity/core/usecase/usecase.dart';
import 'package:camabelcommunity/features/events/domain/entities/event.dart';
import 'package:camabelcommunity/features/events/domain/usecases/get_events.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/web.dart';

part 'events_event.dart';
part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final GetEvents _getEvents;
  EventsBloc({required GetEvents getEvents})
    : _getEvents = getEvents,
      super(EventsInitial()) {
    Logger().i("Bloc created");
    on<GetEventsRequested>(_getEventsRequested);
  }

  Future<void> _getEventsRequested(
    GetEventsRequested event,
    Emitter<EventsState> emit,
  ) async {
    Logger().i("Loading...");
    emit(EventsLoading());

    try {
      var result = await _getEvents(NoParams());

      result.fold(
        (onLeft) {
          Logger().e("Error: $onLeft");
          emit(EventsFailure(onLeft.message));
        },
        (onRight) {
          Logger().i("Events: ${onRight[0].id}");
          emit(EventsSucces(onRight));
        },
      );
    } catch (e) {
      emit(EventsFailure(e.toString()));
    }
  }

  @override
  void onEvent(EventsEvent event) {
    super.onEvent(event);
    Logger().i("event called $event");
  }
}
