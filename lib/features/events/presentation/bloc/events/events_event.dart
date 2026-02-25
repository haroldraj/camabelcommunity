part of 'events_bloc.dart';

@immutable
sealed class EventsEvent {}

final class GetAllEventsRequested extends EventsEvent {}

final class GetAllUpcomingEventsRequested extends EventsEvent {}

final class GetAllPastEventsRequested extends EventsEvent {}
