import 'package:camabelcommunity/features/events/presentation/bloc/song/song_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SongLyricsScreen extends StatefulWidget {
  final String songId;
  final String songTitle;
  const SongLyricsScreen({
    required this.songId,
    super.key,
    required this.songTitle,
  });

  @override
  State<SongLyricsScreen> createState() => _SongLyricsScreenState();
}

class _SongLyricsScreenState extends State<SongLyricsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SongBloc>().add(GetSongByIdRequested(widget.songId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.songTitle)),
      body: BlocListener<SongBloc, SongState>(
        listener: (context, state) {
          if (state is SongFailure) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (_) => AlertDialog(
                title: Text("Error", style: TextStyle(color: Colors.red[800])),
                content: Text(state.errorMessage),
                backgroundColor: Colors.white,
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).maybePop();
                    },
                    child: Text("OK"),
                  ),
                ],
              ),
            );
          }
        },
        child: BlocBuilder<SongBloc, SongState>(
          builder: (context, state) {
            if (state is SongLoading) {
              return Center(child: const CircularProgressIndicator());
            }
            if (state is SongSuccess) {
              final song = state.song;
              return Container(
                margin: .symmetric(vertical: 15, horizontal: 25),
                child: SingleChildScrollView(
                  child: Text(
                    song.lyrics ?? "",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
