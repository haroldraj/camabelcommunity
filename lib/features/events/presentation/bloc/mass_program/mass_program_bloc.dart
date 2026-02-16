import 'package:camabelcommunity/features/events/domain/entities/mass_program.dart';
import 'package:camabelcommunity/features/events/domain/usecases/get_mass_program_by_id_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/web.dart';

part 'mass_program_event.dart';
part 'mass_program_state.dart';

class MassProgramBloc extends Bloc<MassProgramEvent, MassProgramState> {
  final GetMassProgramByIdUseCase getMassProgramByIdUseCase;

  MassProgramBloc({required this.getMassProgramByIdUseCase})
    : super(MassProgramInital()) {
    on<GetMassProgramByIdRequested>(_getMassProgramByIdRequested);
  }

  Future<void> _getMassProgramByIdRequested(
    GetMassProgramByIdRequested event,
    Emitter<MassProgramState> emit,
  ) async {
    emit(MassProgramInital());

    try {
      final result = await getMassProgramByIdUseCase(event.massProgramId);

      result.fold(
        (failure) {
          Logger().e("Error: ${failure.message}");
          emit(MassProgramFailure(failure.message));
        },
        (massProgram) {
          Logger().i("MassProgramId: ${massProgram.id}");
          emit(MassProgramSuccess(massProgram));
        },
      );
    } catch (e) {
      emit(MassProgramFailure(e.toString()));
    }
  }

  @override
  void onEvent(MassProgramEvent event) {
    super.onEvent(event);
    Logger().i("event called $event");
  }
}
