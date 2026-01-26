part of 'events_bloc.dart';

@immutable
sealed class EventsEvent {}

final class GetEventsRequested extends EventsEvent {}