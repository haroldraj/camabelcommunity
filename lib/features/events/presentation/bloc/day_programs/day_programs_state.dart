part of 'day_programs_bloc.dart';

@immutable
sealed class DayProgramsState {}

final class DayProgramsInitial extends DayProgramsState {}

final class DayProgramsFailure extends DayProgramsState {
  final String errorMessage;

  DayProgramsFailure(this.errorMessage);
}

final class DayProgramsLoading extends DayProgramsState {}

final class DayProgramsSuccess extends DayProgramsState {
  final DayProgram dayProgram;

  DayProgramsSuccess(this.dayProgram);
}
