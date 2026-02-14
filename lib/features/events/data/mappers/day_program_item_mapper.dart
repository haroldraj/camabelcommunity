import 'package:camabelcommunity/features/events/data/models/day_program_item_model.dart';
import 'package:camabelcommunity/features/events/domain/entities/day_program_item.dart';
import 'package:camabelcommunity/features/events/domain/enums/program_type.dart';

class DayProgramItemMapper {
  static DayProgramItem toEntity(DayProgramItemModel dayProgramItemModel) {
    return DayProgramItem(
      id: dayProgramItemModel.id,
      title: dayProgramItemModel.title,
      startAt: dayProgramItemModel.startAt,
      type: ProgramType.values.firstWhere(
        (type) => type.name == dayProgramItemModel.type,
      ),
      description: dayProgramItemModel.description,
      massProgramId: dayProgramItemModel.massProgramId,
    );
  }

  static DayProgramItemModel toModel(DayProgramItem dayProgramItem) {
    return DayProgramItemModel(
      id: dayProgramItem.id,
      title: dayProgramItem.title,
      startAt: dayProgramItem.startAt,
      type: dayProgramItem.type.name,
    );
  }
}
