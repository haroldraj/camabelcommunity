import 'package:camabelcommunity/features/events/data/mappers/event_cover_mapper.dart';
import 'package:camabelcommunity/features/events/data/models/event_model.dart';
import 'package:camabelcommunity/features/events/domain/entities/event.dart';
import 'package:camabelcommunity/features/events/domain/enums/event_status.dart';
import 'package:camabelcommunity/features/events/domain/enums/event_type.dart';

class EventMapper {
  static Event toEntity(
    EventModel eventModel
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
      // dayProgramItems: dayProgramItemModels
      //     .map(DayProgramItemMapper.toEntity)
      //     .toList(),
      createdAt: eventModel.createdAt,
      dayProgramId: eventModel.dayProgramId,
      massProgramId: eventModel.massProgramId
    );
  }

  static EventModel toModel(Event event) {
    return EventModel(
      id: event.id,
      title: event.title,
      date: event.date,
      locationName: event.locationName,
      locationAddress: event.locationAddress,
      type: event.type.name,
      status: event.status.name,
      cover: EventCoverMapper.toModel(event.cover),
      hasMassProgram: event.hasMassProgram,
      createdAt: event.createdAt,
      dayProgramId: event.dayProgramId,
      massProgramId: event.massProgramId
    );
  }
}
