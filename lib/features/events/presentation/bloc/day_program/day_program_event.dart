part of 'day_program_bloc.dart';

@immutable
sealed class DayProgramEvent {}

final class GetDayProgramByIdRequested extends DayProgramEvent {
  final String id;

  GetDayProgramByIdRequested(this.id);
}
