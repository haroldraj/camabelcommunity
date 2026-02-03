enum ProgramType { massProgram, dayTimeline }

extension ProgramTypeLabel on ProgramType {
  String get label {
    switch (this) {
      case ProgramType.massProgram:
        return "Liturjie";
      case ProgramType.dayTimeline:
        return "";
    }
  }
}
