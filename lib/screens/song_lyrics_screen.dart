import 'package:camabelcommunity/models/song_model.dart';
import 'package:flutter/material.dart';

class SongLyricsScreen extends StatelessWidget {
  final SongModel songModel;
  const SongLyricsScreen({required this.songModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(songModel.title)),
      body: Container(
        margin: .symmetric(vertical: 15, horizontal: 25),
        child: SingleChildScrollView(
          child: Text(songModel.lyrics ?? "", style: TextStyle(fontSize: 22)),
        ),
      ),
    );
  }
}
