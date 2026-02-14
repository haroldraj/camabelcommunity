part of 'events_bloc.dart';

@immutable
sealed class EventsState {}

final class EventsInitial extends EventsState {}

final class EventsSucces extends EventsState {
  final List<Event> events;

  EventsSucces(this.events);
}

final class EventsFailure extends EventsState {
  final String errorMessage;

  EventsFailure(this.errorMessage);
}

final class EventsLoading extends EventsState {}
