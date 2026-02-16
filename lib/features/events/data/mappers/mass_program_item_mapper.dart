import 'package:camabelcommunity/features/events/data/models/mass_program_item_model.dart';
import 'package:camabelcommunity/features/events/domain/entities/mass_program_item.dart';
import 'package:camabelcommunity/features/events/domain/enums/mass_item_type.dart';
import 'package:camabelcommunity/features/events/domain/enums/mass_part.dart';

class MassProgramItemMapper {
  static MassProgramItem toEntity(MassProgramItemModel massProgramItemModel) {
    return MassProgramItem(
      id: massProgramItemModel.id,
      order: massProgramItemModel.order,
      contentType: MassItemType.values.firstWhere(
        (type) => type.name == massProgramItemModel.contentType,
      ),
      massPart: MassPart.values.firstWhere(
        (part) => part.name == massProgramItemModel.massPart,
      ),
      text: massProgramItemModel.text,
      songId: massProgramItemModel.songId,
    );
  }

  static MassProgramItemModel toModel(MassProgramItem massProgramItem) {
    return MassProgramItemModel(
      id: massProgramItem.id,
      order: massProgramItem.order,
      contentType: massProgramItem.contentType.name,
      massPart: massProgramItem.massPart.name,
      text: massProgramItem.text,
      songId: massProgramItem.songId,
    );
  }
}
