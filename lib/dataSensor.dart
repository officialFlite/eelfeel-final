// ignore: camel_case_types
class DataSensor {
  final String hari,
      jam,
      tanggal,
      keadaan,
      subjectDescription,
      complainDescription;
  final int ph,
      ketinggian,
      temperatur,
      phStats,
      tempStats,
      heightStats,
      phLowAdvice;

  DataSensor({
    this.hari,
    this.jam,
    this.tanggal,
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
      hari: (json['hari']),
      jam: (json['jam']),
      tanggal: (json['tanggal']),
      ph: parser(json['ph']),
      ketinggian: parser(json['ketinggian']),
      temperatur: parser(json['temperatur']),
      keadaan: (json['keadaan']),
      phStats: parser(json['phStats']),
      tempStats: parser(json['tempStats']),
      heightStats: parser(json['heightStats']),
      phLowAdvice: parser(json['phLowAdvice']),
      subjectDescription: (json['subjectDescription']),
      complainDescription: (json['complainDescription']),
    );
  }
}
