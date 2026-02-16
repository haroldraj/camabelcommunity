part of 'mass_program_bloc.dart';

@immutable
sealed class MassProgramState {}

final class MassProgramInital extends MassProgramState {}

final class MassProgramLoading extends MassProgramState {}

final class MassProgramSuccess extends MassProgramState {
  final MassProgram massProgram;
  MassProgramSuccess(this.massProgram);
}

final class MassProgramFailure extends MassProgramState {
  final String errorMessage;
  MassProgramFailure(this.errorMessage);
}
