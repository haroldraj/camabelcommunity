enum BookName { hasina }

extension BookNameLabel on BookName {
  String get label {
    switch (this) {
      case BookName.hasina:
        return "Hasina";
    }
  }
}
