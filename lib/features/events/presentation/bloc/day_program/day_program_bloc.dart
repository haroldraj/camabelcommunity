import 'package:camabelcommunity/features/events/domain/entities/day_program.dart';
import 'package:camabelcommunity/features/events/domain/usecases/get_day_program_by_id_usecase.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/web.dart';

part 'day_program_event.dart';
part 'day_program_state.dart';

class DayProgramBloc extends Bloc<DayProgramEvent, DayProgramState> {
  final GetDayProgramByIdUsecase getDayProgramByIdUseCase;

  DayProgramBloc({required this.getDayProgramByIdUseCase})
    : super(DayProgramInitial()) {
    on<GetDayProgramByIdRequested>(_getDayProgramByIdRequested);
  }

  Future<void> _getDayProgramByIdRequested(
    GetDayProgramByIdRequested event,
    Emitter<DayProgramState> emit,
  ) async {
    emit(DayProgramLoading());

    try {
      final result = await getDayProgramByIdUseCase(event.id);

      result.fold(
        (failure) {
          Logger().e("Error: ${failure.message}");
          emit(DayProgramFailure(failure.message));
        },
        (dayProgram) {
          Logger().i("DayProgramId: ${dayProgram.id}");
          emit(DayProgramSuccess(dayProgram));
        },
      );
    } catch (e) {
      emit(DayProgramFailure(e.toString()));
    }
  }

  @override
  void onEvent(DayProgramEvent event) {
    super.onEvent(event);
    Logger().i("event called $event");
  }
}
