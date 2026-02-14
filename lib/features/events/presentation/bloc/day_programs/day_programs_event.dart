part of 'day_programs_bloc.dart';

@immutable
sealed class DayProgramsEvent {}

final class GetDayProgramByIdRequested extends DayProgramsEvent {
  final String id;

  GetDayProgramByIdRequested(this.id);
}
