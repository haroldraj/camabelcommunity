part of 'song_bloc.dart';

@immutable
sealed class SongEvent {}

final class GetSongByIdRequested extends SongEvent {
  final String id;

  GetSongByIdRequested(this.id);
}
