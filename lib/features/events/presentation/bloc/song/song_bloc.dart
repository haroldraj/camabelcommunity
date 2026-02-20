import 'package:camabelcommunity/features/events/domain/entities/song.dart';
import 'package:camabelcommunity/features/events/domain/usecases/get_song_by_id_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/web.dart';

part 'song_event.dart';
part 'song_state.dart';

class SongBloc extends Bloc<SongEvent, SongState> {
  final GetSongByIdUsecase getSongByIdUseCase;

  SongBloc({required this.getSongByIdUseCase}) : super(SongInital()) {
    on<GetSongByIdRequested>(_getSongByIdRequested);
  }

  Future<void> _getSongByIdRequested(
    GetSongByIdRequested event,
    Emitter<SongState> emit,
  ) async {
    emit(SongLoading());
    try {
      final result = await getSongByIdUseCase(event.id);
      result.fold(
        (failure) {
          Logger().e("Error: ${failure.message}");
          emit(SongFailure(failure.message));
        },
        (song) {
          Logger().i("SongId: ${song.id}");
          emit(SongSuccess(song));
        },
      );
    } catch (error) {
      emit(SongFailure(error.toString()));
    }
  }
}
