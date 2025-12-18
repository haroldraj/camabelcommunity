enum MassPart {
  fidirana,
  fifonana,
  voninahitra,
  fankalazanaNyTeninAndriamanitra,
  vakitenyVoalohany,
  salamo,
  vakitenyFaharoa,
  fihobianaNyEvanjely,
  vakitenyEvanjely,
  fiekempinoana,
  ranombavaka,
  rakitra,
  fanatitra,
  fanolorana,
  masina,
  fanandratana,
  rainay,
  fiadanana,
  zanakondry,
  komonio,
  fisaorana,
  fanirahana,
}

extension MassPartLabel on MassPart {
  String get label {
    switch (this) {
      case MassPart.fidirana:
        return "Fidirana";
      case MassPart.fifonana:
        return "Fifonana";
      case MassPart.voninahitra:
        return "Voninahitra";
      case MassPart.fankalazanaNyTeninAndriamanitra:
        return "Fankalazana ny tenin'Andriamanitra";
      case MassPart.vakitenyVoalohany:
        return "Vakiteny voalohany";
      case MassPart.salamo:
        return "Salamo";
      case MassPart.vakitenyFaharoa:
        return "Vakiteny faharoa";
      case MassPart.fihobianaNyEvanjely:
        return "Fihobiana ny Evanjely";
      case MassPart.vakitenyEvanjely:
        return "Vakiteny Evanjely";
      case MassPart.fiekempinoana:
        return "Fiekem-pinoana";
      case MassPart.ranombavaka:
        return "Ranombavaka";
      case MassPart.rakitra:
        return "Rakitra";
      case MassPart.fanatitra:
        return "Fanatitra";
      case MassPart.fanolorana:
        return "Fanoloran";
      case MassPart.masina:
        return "Masina";
      case MassPart.fanandratana:
        return "Fanandratana";
      case MassPart.rainay:
        return "Rainay";
      case MassPart.fiadanana:
        return "Fiadanana";
      case MassPart.zanakondry:
        return "Zanak'ondry";
      case MassPart.komonio:
        return "Komonio";
      case MassPart.fisaorana:
        return "Fisaorana";
      case MassPart.fanirahana:
        return "Fanirahana";
    }
  }
}
