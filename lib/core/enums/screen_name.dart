enum ScreenName { home, eventHistory }

extension ScreenNameLabel on ScreenName {
  String get label {
    switch (this) {
      case ScreenName.home:
        return "Accueil";
      case ScreenName.eventHistory:
        return "Historique";
    }
  }
}

extension ScreenNameTitle on ScreenName {
  String get title {
    switch (this) {
      case ScreenName.home:
        return "Evènements à venir";
      case ScreenName.eventHistory:
        return "Historique des évènemts";
    }
  }
}
