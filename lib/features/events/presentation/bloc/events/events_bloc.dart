import 'package:camabelcommunity/core/usecase/usecase.dart';
import 'package:camabelcommunity/features/events/domain/entities/event.dart';
import 'package:camabelcommunity/features/events/domain/usecases/get_events_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/web.dart';

part 'events_event.dart';
part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final GetEventsUseCase getEvents;
  EventsBloc({required this.getEvents}) : super(EventsInitial()) {
    on<GetEventsRequested>(_getEventsRequested);
  }

  Future<void> _getEventsRequested(
    GetEventsRequested event,
    Emitter<EventsState> emit,
  ) async {
    emit(EventsLoading());

    try {
      final result = await getEvents(NoParams());

      result.fold(
        (failure) {
          Logger().e("Error: ${failure.message}");
          emit(EventsFailure(failure.message));
        },
        (events) {
          Logger().i("Events: ${events[0].id}");
          emit(EventsSucces(events));
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
