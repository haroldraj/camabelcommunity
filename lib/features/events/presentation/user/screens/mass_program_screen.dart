import 'package:camabelcommunity/features/events/domain/enums/mass_item_type.dart';
import 'package:camabelcommunity/features/events/presentation/bloc/mass_program/mass_program_bloc.dart';
import 'package:camabelcommunity/features/events/presentation/common/widgets/mass_item_card.dart';
import 'package:camabelcommunity/features/events/presentation/user/screens/song_lyrics_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MassProgramScreen extends StatefulWidget {
  final String massProgramId;
  const MassProgramScreen({super.key, required this.massProgramId});

  @override
  State<MassProgramScreen> createState() => _MassProgramScreenState();
}

class _MassProgramScreenState extends State<MassProgramScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MassProgramBloc>().add(
      GetMassProgramByIdRequested(widget.massProgramId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Programme Liturjique"), centerTitle: true),
      backgroundColor: Colors.grey[200],
      body: BlocListener<MassProgramBloc, MassProgramState>(
        listener: (context, state) {
          if (state is MassProgramFailure) {
            showDialog(
              barrierDismissible: false,
              context: context,

              builder: (_) => AlertDialog(
                title: Text("Error", style: TextStyle(color: Colors.red[800])),
                content: Text(state.errorMessage),
                backgroundColor: Colors.white,
                // actions: [
                //   TextButton(
                //     onPressed: () => Navigator.pop(context),
                //     child: Text("OK"),
                //   ),
                // ],
              ),
            );
          }
        },
        child: BlocBuilder<MassProgramBloc, MassProgramState>(
          builder: (context, state) {
            if (state is! MassProgramSuccess) {
              return Center(child: const CircularProgressIndicator());
            }
            final massProgram = state.massProgram;
            return RefreshIndicator(
              backgroundColor: Colors.white,
              onRefresh: () async => context.read<MassProgramBloc>().add(
                GetMassProgramByIdRequested(widget.massProgramId),
              ),
              child: ListView.builder(
                itemCount: massProgram.items.length,
                itemBuilder: (BuildContext context, int index) {
                  return MassItemCard(
                    item: massProgram.items[index],
                    index: index,
                    onTap: () {
                      if (massProgram.items[index].contentType.name ==
                              MassItemType.song.name &&
                          massProgram.items[index].songPreview != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SongLyricsScreen(
                              songId: massProgram.items[index].songPreview!.id,
                              songTitle:
                                  massProgram.items[index].songPreview!.title,
                            ),
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
