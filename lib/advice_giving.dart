import 'package:flutter/material.dart';
import 'package:desain_eelfeel/dataSensor.dart';
import 'package:firebase_database/firebase_database.dart';
import 'show_stats.dart';

class AdviceGiving extends StatefulWidget {
  @override
  _AdviceGivingState createState() => _AdviceGivingState();
}

class _AdviceGivingState extends State<AdviceGiving> {
  String logsensor = 'logSensor';

  DatabaseReference databaseReference =
      FirebaseDatabase.instance.reference().child('dataSensor');
  DatabaseReference keadaanSehat = FirebaseDatabase.instance
      .reference()
      .child('dataSensor')
      .child('logSensor');
  DatabaseReference downloadSaran = FirebaseDatabase.instance
      .reference()
      .child('dataSensor')
      .child('adviceBank');

  void sangatSehat() {
    keadaanSehat.update({'keadaan': 'Sangat Sehat'});
  }

  void sehat() {
    keadaanSehat.update({'keadaan': 'Sehat'});
  }

  void tidakSehat() {
    keadaanSehat.update({'keadaan': 'Tidak Sehat'});
  }

  void sangatTidakSehat() {
    keadaanSehat.update({'keadaan': 'Sangat Tidak Sehat'});
  }

  void dudeReally() {
    keadaanSehat.update({'keadaan': 'Dude, really?'});
  }

  //ph
  void phLow() {
    keadaanSehat.update({'phStats': 1});
  }

  void phHigh() {
    keadaanSehat.update({'phStats': 2});
  }

  void phOptimal() {
    keadaanSehat.update({'phStats': 3});
  }

  //temp
  void tempLow() {
    keadaanSehat.update({'tempStats': 1});
  }

  void tempHigh() {
    keadaanSehat.update({'tempStats': 2});
  }

  void tempOptimal() {
    keadaanSehat.update({'tempStats': 3});
  }

  //height
  void heightLow() {
    keadaanSehat.update({'heightStats': 1});
  }

  void heightHigh() {
    keadaanSehat.update({'heightStats': 2});
  }

  void heightOptimal() {
    keadaanSehat.update({'heightStats': 3});
  }

  void keadaanKolam(DataSensor _dataSensor) async {
    if ((_dataSensor.ph <= 7 && _dataSensor.ph >= 5) &&
        (_dataSensor.ketinggian <= 20 && _dataSensor.ketinggian >= 5) &&
        (_dataSensor.temperatur <= 31 && _dataSensor.temperatur >= 27)) {
      sangatSehat();
      phOptimal();
      tempOptimal();
      heightOptimal();
      //27 //done
    } else if ((_dataSensor.ph >= 8) &&
        (_dataSensor.ketinggian <= 20 && _dataSensor.ketinggian >= 5) &&
        (_dataSensor.temperatur <= 31 && _dataSensor.temperatur >= 27)) {
      sehat();
      phHigh();
      tempOptimal();
      heightOptimal();
      //26 //done
    } else if ((_dataSensor.ph <= 7 && _dataSensor.ph >= 5) &&
        (_dataSensor.ketinggian <= 4) &&
        (_dataSensor.temperatur <= 31 && _dataSensor.temperatur >= 27)) {
      sehat();
      phOptimal();
      tempHigh();
      heightLow();
      //25 //done
    } else if ((_dataSensor.ph >= 8) &&
        (_dataSensor.ketinggian >= 21) &&
        (_dataSensor.temperatur <= 31 && _dataSensor.temperatur >= 27)) {
      sangatTidakSehat();
      phHigh();
      tempOptimal();
      heightHigh();
      //17 //done
    } else if ((_dataSensor.ph <= 7 && _dataSensor.ph >= 5) &&
        (_dataSensor.ketinggian <= 4) &&
        (_dataSensor.temperatur <= 26)) {
      sangatTidakSehat();
      phOptimal();
      tempLow();
      heightLow();
      //7 //done
    } else if ((_dataSensor.ph <= 4) &&
        (_dataSensor.ketinggian <= 4) &&
        (_dataSensor.temperatur >= 32)) {
      sangatTidakSehat();
      phLow();
      tempHigh();
      heightLow();
      //2 //done
    } else if ((_dataSensor.ph <= 4) &&
        (_dataSensor.ketinggian <= 4) &&
        (_dataSensor.temperatur <= 26)) {
      sangatTidakSehat();
      phLow();
      tempLow();
      heightLow();
      //1 //done
    } else if ((_dataSensor.ph >= 100) &&
        (_dataSensor.ketinggian >= 100) &&
        (_dataSensor.temperatur >= 100)) {
      dudeReally();
      //lmao
    } else {
      sangatTidakSehat();
    }
  }

  void givingAdvice(DataSensor _dataSensor) async {
    if (_dataSensor.phStats == 1) {}
  }

  @override
  Widget build(BuildContext context) {
    return mainScaffold();
  }

  Widget mainScaffold() {
    return Scaffold(
      body: StreamBuilder(
        stream: databaseReference.onValue,
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              !snapshot.hasError &&
              snapshot.data.snapshot.value != null) {
            var _dataSensor =
                DataSensor.fromJson(snapshot.data.snapshot.value[logsensor]);
            keadaanKolam(_dataSensor);
          }
          return Center(
            child: ShowStats(),
          );
        },
      ),
    );
  }
}
