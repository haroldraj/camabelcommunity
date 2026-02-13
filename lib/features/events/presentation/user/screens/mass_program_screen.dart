import 'package:camabelcommunity/core/theme/custom_colors.dart';
import 'package:camabelcommunity/features/events/domain/entities/mass_program.dart';
import 'package:camabelcommunity/features/events/domain/entities/mass_program_item.dart';
import 'package:camabelcommunity/features/events/domain/entities/song.dart';
import 'package:camabelcommunity/features/events/domain/enums/mass_item_type.dart';
import 'package:camabelcommunity/features/events/presentation/common/widgets/mass_item_card.dart';
import 'package:camabelcommunity/features/events/presentation/user/screens/song_lyrics_screen.dart';
import 'package:flutter/material.dart';

class MassProgramScreen extends StatelessWidget {
  final MassProgram massProgram;
  const MassProgramScreen({super.key, required this.massProgram});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Programme Liturjique"), centerTitle: true),
      backgroundColor: Colors.grey[200],
      body: ListView.builder(
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
                      songId:
                          massProgram.items[index].songPreview!.id,
                    ),
                  ),
                );
              }
            },
          );
        },
      ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       Card(
      //         color: Colors.white,
      //         child: ListTile(
      //           leading: Icon(
      //             Icons.music_note_rounded,
      //             color: CustomColors.darkBlue,
      //           ),
      //           trailing: Icon(
      //             Icons.arrow_forward_ios,
      //             color: CustomColors.darkBlue,
      //           ),
      //           title: Text(
      //             "Fifonana",
      //             style: TextStyle(
      //               color: CustomColors.darkBlue,
      //               fontWeight: FontWeight.bold,
      //               fontSize: 23,
      //             ),
      //           ),
      //           subtitle: Column(
      //             crossAxisAlignment: .start,
      //             children: [
      //               Text("Diso taminao", style: TextStyle(fontSize: 20)),
      //               Text(
      //                 "Hasina P. 303",
      //                 style: TextStyle(fontSize: 19, color: Colors.grey[600]),
      //               ),
      //             ],
      //           ),
      //           onTap: () {},
      //         ),
      //       ),
      //       Card(
      //         color: Colors.white,
      //         child: ListTile(
      //           leading: Icon(
      //             Icons.menu_book_rounded,
      //             color: CustomColors.darkBlue,
      //           ),
      //           trailing: Icon(
      //             Icons.arrow_forward_ios,
      //             color: CustomColors.darkBlue,
      //           ),
      //           title: Text(
      //             "Vakiteny voalohany",
      //             style: TextStyle(
      //               color: CustomColors.darkBlue,
      //               fontWeight: FontWeight.bold,
      //               fontSize: 25,
      //             ),
      //           ),
      //           subtitle: Text(
      //             "Boki'Izaia Mpaminany 11,1-10",
      //             style: TextStyle(fontSize: 20),
      //           ),
      //           onTap: () {},
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
