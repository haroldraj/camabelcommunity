part of 'day_program_bloc.dart';

@immutable
sealed class DayProgramState {}

final class DayProgramInitial extends DayProgramState {}

final class DayProgramFailure extends DayProgramState {
  final String errorMessage;

  DayProgramFailure(this.errorMessage);
}

final class DayProgramLoading extends DayProgramState {}

final class DayProgramSuccess extends DayProgramState {
  final DayProgram dayProgram;

  DayProgramSuccess(this.dayProgram);
}
