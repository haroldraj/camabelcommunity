import 'package:camabelcommunity/features/events/domain/entities/day_program.dart';
import 'package:camabelcommunity/features/events/domain/usecases/get_day_program_by_id_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/web.dart';

part 'day_programs_event.dart';
part 'day_programs_state.dart';

class DayProgramsBloc extends Bloc<DayProgramsEvent, DayProgramsState> {
  final GetDayProgramByIdUseCase getDayProgramByIdUseCase;

  DayProgramsBloc({required this.getDayProgramByIdUseCase})
    : super(DayProgramsInitial()) {
    on<GetDayProgramByIdRequested>(_getDayProgramBy);
  }

  Future<void> _getDayProgramBy(
    GetDayProgramByIdRequested event,
    Emitter<DayProgramsState> emit,
  ) async {
    try {
      emit(DayProgramsLoading());
      final result = await getDayProgramByIdUseCase(event.id);

      result.fold(
        (failure) {
          Logger().e("Error: ${failure.message}");
          emit(DayProgramsFailure(failure.message));
        },
        (dayProgram) {
          Logger().i("DayProgram: $dayProgram");
          emit(DayProgramsSuccess(dayProgram));
        },
      );
    } catch (e) {
      emit(DayProgramsFailure(e.toString()));
    }
  }
}
