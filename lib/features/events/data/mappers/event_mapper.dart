import 'package:camabelcommunity/features/events/data/mappers/day_program_item_mapper.dart';
import 'package:camabelcommunity/features/events/data/mappers/event_cover_mapper.dart';
import 'package:camabelcommunity/features/events/data/models/day_program_item_model.dart';
import 'package:camabelcommunity/features/events/data/models/event_model.dart';
import 'package:camabelcommunity/features/events/domain/entities/event.dart';
import 'package:camabelcommunity/features/events/domain/enums/event_status.dart';
import 'package:camabelcommunity/features/events/domain/enums/event_type.dart';

class EventMapper {
  static Event toEntity(
    EventModel eventModel,
    List<DayProgramItemModel> dayProgramItemModels,
  ) {
    return Event(
      id: eventModel.id,
      title: eventModel.title,
      date: eventModel.date,
      locationName: eventModel.locationName,
      locationAddress: eventModel.locationAddress,
      type: EventType.values.firstWhere((type) => type.name == eventModel.type),
      status: EventStatus.values.firstWhere(
        (status) => status.name == eventModel.status,
      ),
      cover: EventCoverMapper.toEntity(eventModel.cover),
      hasMassProgram: eventModel.hasMassProgram,
      dayProgramItems: dayProgramItemModels
          .map(DayProgramItemMapper.toEntity)
          .toList(),
      createdAt: eventModel.createdAt,
    );
  }
}
