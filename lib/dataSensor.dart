// ignore: camel_case_types
class DataSensor {
  final String keadaan,
      subjectDescription,
      complainDescription,

      //advice
      saranPhLow,
      saranPhHigh,
      saranPhOptimal,
      saranHeightLow,
      saranHeightHigh,
      saranHeightOptimal,
      saranTempLow,
      saranTempHigh,
      saranTempOptimal;
  final int ph,
      ketinggian,
      temperatur,
      phStats,
      tempStats,
      heightStats,
      phLowAdvice,
      tempLowKalibrasi,
      tempHighKalibrasi,
      heightLowKalibrasi,
      heightHighKalibrasi,
      phLowKalibrasi,
      phHighKalibrasi;

  DataSensor({
    this.ph,
    this.ketinggian,
    this.temperatur,
    this.keadaan,
    this.phStats,
    this.tempStats,
    this.heightStats,
    this.phLowAdvice,
    this.subjectDescription,
    this.complainDescription,
    this.tempLowKalibrasi,
    this.tempHighKalibrasi,
    this.heightLowKalibrasi,
    this.heightHighKalibrasi,
    this.phLowKalibrasi,
    this.phHighKalibrasi,

    //advice
    this.saranPhLow,
    this.saranPhHigh,
    this.saranPhOptimal,
    this.saranHeightLow,
    this.saranHeightHigh,
    this.saranHeightOptimal,
    this.saranTempLow,
    this.saranTempHigh,
    this.saranTempOptimal,
  });

  factory DataSensor.fromJson(Map<dynamic, dynamic> json) {
    int parser(dynamic source) {
      try {
        return int.parse(source.toString());
      } on FormatException {
        return -1;
      }
    }

    return DataSensor(
      ph: parser(json['ph']),
      ketinggian: parser(json['ketinggian']),
      temperatur: parser(json['temperatur']),
      keadaan: (json['keadaan']),
      phStats: parser(json['phStats']),
      tempStats: parser(json['tempStats']),
      heightStats: parser(json['heightStats']),
      phLowAdvice: parser(json['phLowAdvice']),
      tempLowKalibrasi: parser(json['tempLowKalibrasi']),
      tempHighKalibrasi: parser(json['tempHighKalibrasi']),
      heightLowKalibrasi: parser(json['heightLowKalibrasi']),
      heightHighKalibrasi: parser(json['heightHighKalibrasi']),
      phLowKalibrasi: parser(json['phLowKalibrasi']),
      phHighKalibrasi: parser(json['phHighKalibrasi']),
      subjectDescription: (json['subjectDescription']),
      complainDescription: (json['complainDescription']),

      //advice
      saranPhLow: (json['saranPhLow']),
      saranPhHigh: (json['saranPhHigh']),
      saranPhOptimal: (json['saranPhOptimal']),
      saranHeightLow: (json['saranHeightLow']),
      saranHeightHigh: (json['saranHeightHigh']),
      saranHeightOptimal: (json['saranHeightOptimal']),
      saranTempLow: (json['saranTempLow']),
      saranTempHigh: (json['saranTempHigh']),
      saranTempOptimal: (json['saranTempOptimal']),
    );
  }
}
