import 'package:camabelcommunity/features/events/data/datasources/mock/mock_songs.dart';
import 'package:camabelcommunity/features/events/domain/entities/song.dart';
import 'package:flutter/material.dart';

class SongLyricsScreen extends StatelessWidget {
  final String songId;
  const SongLyricsScreen({required this.songId, super.key});

  @override
  Widget build(BuildContext context) {
    final song = mockSongs.firstWhere((song) => song.id == songId);
    return Scaffold(
      appBar: AppBar(title: Text(song.title)),
      body: Container(
        margin: .symmetric(vertical: 15, horizontal: 25),
        child: SingleChildScrollView(
          child: Text(song.lyrics ?? "", style: TextStyle(fontSize: 22)),
        ),
      ),
    );
  }
}
