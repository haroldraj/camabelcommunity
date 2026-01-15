import 'package:camabelcommunity/core/theme/custom_colors.dart';
import 'package:camabelcommunity/features/events/domain/entities/mass_program_item.dart';
import 'package:camabelcommunity/features/events/domain/enums/mass_item_type.dart';
import 'package:flutter/material.dart';

class MassItemCard extends StatelessWidget {
  final MassProgramItem item;
  final VoidCallback? onTap;

  const MassItemCard({super.key, required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    final isSong = item.contentType == MassItemType.song;
    final songPreview = item.songPreview!;
    return Card(
      color: Colors.white,
      child: ListTile(
        leading: Icon(
          isSong ? Icons.music_note_rounded : Icons.menu_book_rounded,
          color: CustomColors.darkBlue,
        ),
        trailing: isSong && songPreview.hasLyrics
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
            Text(songPreview.title, style: TextStyle(fontSize: 20)),
            if (songPreview.book != null && songPreview.page != null)
              Text(
                "${songPreview.book} P. ${songPreview.page}",
                style: TextStyle(fontSize: 19, color: Colors.grey[600]),
              ),
          ],
        ),
        onTap: isSong ? onTap : null,
      ),
    );
  }
}
