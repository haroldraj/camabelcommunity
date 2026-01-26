import 'package:camabelcommunity/core/usecase/usecase.dart';
import 'package:camabelcommunity/features/events/domain/entities/event.dart';
import 'package:camabelcommunity/features/events/domain/usecases/get_events.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'events_event.dart';
part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final GetEvents _getEvents;
  EventsBloc({required GetEvents getEvents})
    : _getEvents = getEvents,
      super(EventsInitial()) {
    on<GetEventsRequested>(_getEventsRequested);
  }

  Future<void> _getEventsRequested(
    GetEventsRequested event,
    Emitter<EventsState> emit,
  ) async {
    emit(EventsLoading());

    try {
      var result = await _getEvents(NoParams());

      result.fold(
        (onLeft) => emit(EventsFailure(onLeft.message)),
        (onRight) => emit(EventsSucces(onRight)),
      );
    } catch (e) {
      emit(EventsFailure(e.toString()));
    }
  }
}
