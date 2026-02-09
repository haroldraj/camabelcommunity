import 'package:camabelcommunity/features/events/domain/entities/event_cover.dart';
import 'package:camabelcommunity/features/events/domain/enums/cover_source.dart';

final List<EventCover> mockEventCovers = [
  EventCover(
    source: CoverSource.byDefault,
    url: null,
    path: "assets/covers/default.jpg",
  ),
  EventCover(
    source: CoverSource.byDefault,
    url: null,
    path: "assets/covers/default.jpg",
  ),
  EventCover(
    source: CoverSource.byDefault,
    url: null,
    path: "assets/covers/default.jpg",
  ),
  EventCover(
    source: CoverSource.custom,
    url: "https://picsum.photos/seed/camabel1/800/400",
    path: null,
  ),
  EventCover(
    source: CoverSource.custom,
    url: "https://picsum.photos/seed/camabel2/800/400",
    path: null,
  ),
  EventCover(
    source: CoverSource.custom,
    url: "https://picsum.photos/seed/camabel3/800/400",
    path: null,
  ),
  EventCover(
    source: CoverSource.byDefault,
    url: null,
    path: "assets/covers/default.jpg",
  ),
  EventCover(
    source: CoverSource.byDefault,
    url: null,
    path: "assets/covers/default.jpg",
  ),
  EventCover(
    source: CoverSource.custom,
    url: "https://picsum.photos/seed/camabel4/800/400",
    path: null,
  ),
  EventCover(
    source: CoverSource.byDefault,
    url: null,
    path: "assets/covers/default.jpg",
  ),
];
