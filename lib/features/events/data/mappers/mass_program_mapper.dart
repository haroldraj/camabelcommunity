import 'package:camabelcommunity/features/events/data/mappers/mass_program_item_mapper.dart';
import 'package:camabelcommunity/features/events/data/models/mass_program_item_model.dart';
import 'package:camabelcommunity/features/events/data/models/mass_program_model.dart';
import 'package:camabelcommunity/features/events/domain/entities/mass_program.dart';

class MassProgramMapper {
  static MassProgram toEntity(
    MassProgramModel massProgramModel,
    List<MassProgramItemModel> massProgramItemModels,
  ) {
    return MassProgram(
      id: massProgramModel.id,
      eventId: massProgramModel.eventId,
      title: massProgramModel.title,
      items: massProgramItemModels
          .map(MassProgramItemMapper.toEntity)
          .toList(),
    );
  }
}
