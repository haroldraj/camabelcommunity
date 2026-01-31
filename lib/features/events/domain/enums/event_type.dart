enum EventType { mass, announcement, meeting, youth, other }

extension EventTypeLabel on EventType {
  String get label {
    switch (this) {
      case EventType.mass:
        return "Messe";
      case EventType.announcement:
        return "Annonce";
      case EventType.meeting:
        return "Réunion";
      case EventType.youth:
        return "Jeunes";
      case EventType.other:
        return "Autre";
    }
  }
}
