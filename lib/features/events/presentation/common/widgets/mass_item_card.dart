import 'package:camabelcommunity/core/theme/custom_colors.dart';
import 'package:camabelcommunity/features/events/domain/entities/program_item.dart';
import 'package:camabelcommunity/features/events/domain/enums/program_item_content_type.dart';
import 'package:flutter/material.dart';

class MassItemCard extends StatelessWidget {
  final ProgramItem item;
  final VoidCallback? onTap;

  const MassItemCard({super.key, required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    final isSong = item.contentType == ProgramItemContentType.song;

    return Card(
      color: Colors.white,
      child: ListTile(
        leading: Icon(
          isSong ? Icons.music_note_rounded : Icons.menu_book_rounded,
          color: CustomColors.darkBlue,
        ),
        trailing: isSong && item.hasLyrics
            ? Icon(Icons.arrow_forward_ios, color: CustomColors.darkBlue)
            : null,
        title: Text(
          "Salamo",
          style: TextStyle(
            color: CustomColors.darkBlue,
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: .start,
          children: [
            if (item.songTitle != null)
              Text(item.songTitle!, style: TextStyle(fontSize: 20)),
            if (item.book != null && item.page != null)
              Text(
                "${item.book} P. ${item.page}",
                style: TextStyle(fontSize: 19, color: Colors.grey[600]),
              ),
          ],
        ),
        onTap: isSong ? onTap : null,
      ),
    );
  }
}
