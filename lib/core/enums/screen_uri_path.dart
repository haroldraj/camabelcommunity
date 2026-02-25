enum ScreenUriPath { home, eventHistory, dayProgram, massProgram, song }

extension ScreenUriPathLabel on ScreenUriPath {
  String get label {
    switch (this) {
      case ScreenUriPath.home:
        return "/home";
      case ScreenUriPath.eventHistory:
        return "/event-history";
      case ScreenUriPath.dayProgram:
        return "/day-program";
      case ScreenUriPath.massProgram:
        return "/mass-program";
      case ScreenUriPath.song:
        return "/song";
    }
  }
}
