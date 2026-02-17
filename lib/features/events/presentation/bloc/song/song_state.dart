part of 'song_bloc.dart';

@immutable
sealed class SongState {}

final class SongInital extends SongState {}

final class SongLoading extends SongState {}

final class SongFailure extends SongState {
  final String errorMessage;

  SongFailure(this.errorMessage);
}

final class SongSuccess extends SongState {
  final Song song;

  SongSuccess(this.song);
}
