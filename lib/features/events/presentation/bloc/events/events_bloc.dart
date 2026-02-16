import 'package:camabelcommunity/core/usecase/usecase.dart';
import 'package:camabelcommunity/features/events/domain/entities/event.dart';
import 'package:camabelcommunity/features/events/domain/usecases/get_all_events_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/web.dart';

part 'events_event.dart';
part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final GetAllEventsUseCase getAllEvents;
  EventsBloc({required this.getAllEvents}) : super(EventsInitial()) {
    on<GetAllEventsRequested>(_getAllEventsRequested);
  }

  Future<void> _getAllEventsRequested(
    GetAllEventsRequested event,
    Emitter<EventsState> emit,
  ) async {
    emit(EventsLoading());

    try {
      final result = await getAllEvents(NoParams());

      result.fold(
        (failure) {
          Logger().e("Error: ${failure.message}");
          emit(EventsFailure(failure.message));
        },
        (events) {
          Logger().i("EventId: ${events[0].id}");
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
