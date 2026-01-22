import 'package:camabelcommunity/features/events/data/models/event_cover_model.dart';
import 'package:camabelcommunity/features/events/domain/entities/event_cover.dart';
import 'package:camabelcommunity/features/events/domain/enums/cover_source.dart';

class EventCoverMapper {
  static EventCover toEntity(EventCoverModel eventCoverModel) {
    return EventCover(
      source: CoverSource.values.firstWhere(
        (source) => source.name == eventCoverModel.source,
      ),
      path: eventCoverModel.path,
      url: eventCoverModel.url,
    );
  }
}
