import 'package:camabelcommunity/features/events/data/mappers/day_program_item_mapper.dart';
import 'package:camabelcommunity/features/events/data/models/day_program_model.dart';
import 'package:camabelcommunity/features/events/domain/entities/day_program.dart';

class DayProgramMapper {
  static DayProgram toEntity(DayProgramModel dayProgramModel) {
    return DayProgram(
      id: dayProgramModel.id,
      label: dayProgramModel.label,
      date: dayProgramModel.date,
      items: dayProgramModel.items
          .map((item) => DayProgramItemMapper.toEntity(item))
          .toList(),
    );
  }

  static DayProgramModel toModel(DayProgram dayProgram) {
    return DayProgramModel(
      id: dayProgram.id,
      label: dayProgram.label,
      date: dayProgram.date,
      items: dayProgram.items
          .map((item) => DayProgramItemMapper.toModel(item))
          .toList(),
    );
  }
}
