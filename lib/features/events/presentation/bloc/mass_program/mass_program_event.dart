part of 'mass_program_bloc.dart';

@immutable
sealed class MassProgramEvent {}

final class GetMassProgramByIdRequested extends MassProgramEvent {
  final String massProgramId;

  GetMassProgramByIdRequested(this.massProgramId);
}
