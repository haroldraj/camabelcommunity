import 'package:camabelcommunity/features/events/domain/entities/song.dart';
import 'package:flutter/material.dart';

class SongLyricsScreen extends StatelessWidget {
  final Song song;
  const SongLyricsScreen({required this.song, super.key});

  @override
  Widget build(BuildContext context) {
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
