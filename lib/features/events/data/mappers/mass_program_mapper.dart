import 'package:camabelcommunity/features/events/data/mappers/mass_program_item_mapper.dart';
import 'package:camabelcommunity/features/events/data/models/mass_program_model.dart';
import 'package:camabelcommunity/features/events/domain/entities/mass_program.dart';

class MassProgramMapper {
  static MassProgram toEntity(MassProgramModel massProgramModel) {
    return MassProgram(
      id: massProgramModel.id,
      label: massProgramModel.label,
      items: massProgramModel.items
          .map((item) => MassProgramItemMapper.toEntity(item))
          .toList(),
    );
  }

  static MassProgramModel toModel(MassProgram massProgram) {
    return MassProgramModel(
      id: massProgram.id,
      label: massProgram.label,
      items: massProgram.items
          .map((item) => MassProgramItemMapper.toModel(item))
          .toList(),
    );
  }
}
