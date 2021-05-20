import 'package:flutter/material.dart';
import 'package:desain_eelfeel/dataSensor.dart';
import 'package:firebase_database/firebase_database.dart';
import '../pages/show_stats.dart';

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

/*   
_dataSensor.tempLowKalibrasi
_dataSensor.tempHighKalibrasi
_dataSensor.heightLowKalibrasi
_dataSensor.heightHighKalibrasi
_dataSensor.phLowKalibrasi
_dataSensor.phHighKalibrasi      
*/

  void keadaanKolam(DataSensor _dataSensor) async {
    int tempKalLow = _dataSensor.tempLowKalibrasi;
    int tempKalHigh = _dataSensor.tempHighKalibrasi;
    int heightKalLow = _dataSensor.heightLowKalibrasi;
    int heightKalHigh = _dataSensor.heightHighKalibrasi;
    int phKalLow = _dataSensor.phLowKalibrasi;
    int phKalHigh = _dataSensor.phHighKalibrasi;

    if ((_dataSensor.ph == 100) &&
        (_dataSensor.ketinggian == 100) &&
        (_dataSensor.temperatur == 100)) {
      dudeReally();
      //lmao
    } else if ((_dataSensor.ph >= phKalLow && _dataSensor.ph <= phKalHigh) &&
        (_dataSensor.ketinggian >= heightKalLow &&
            _dataSensor.ketinggian <= heightKalHigh) &&
        (_dataSensor.temperatur >= tempKalLow &&
            _dataSensor.temperatur <= tempKalHigh)) {
      sangatSehat();
      phOptimal();
      heightOptimal();
      tempOptimal();
      print("27");
      //27 //done
    } else if ((_dataSensor.ph > phKalHigh) &&
        (_dataSensor.ketinggian >= heightKalLow &&
            _dataSensor.ketinggian <= heightKalHigh) &&
        (_dataSensor.temperatur >= tempKalLow &&
            _dataSensor.temperatur <= tempKalHigh)) {
      sehat();
      phHigh();
      heightOptimal();
      tempOptimal();
      print("26");
      //26 //done
    } else if ((_dataSensor.ph >= phKalLow && _dataSensor.ph <= phKalHigh) &&
        (_dataSensor.ketinggian < heightKalLow) &&
        (_dataSensor.temperatur >= tempKalLow &&
            _dataSensor.temperatur <= tempKalHigh)) {
      sehat();
      phOptimal();
      heightLow();
      tempHigh();
      print("25");
      //25 //done
    } else if ((_dataSensor.ph >= phKalLow && _dataSensor.ph <= phKalHigh) &&
        (_dataSensor.ketinggian >= heightKalLow &&
            _dataSensor.ketinggian <= heightKalHigh) &&
        (_dataSensor.temperatur > tempKalHigh)) {
      sehat();
      phOptimal();
      heightOptimal();
      tempHigh();
      print("24");
      //24 //done
    } else if ((_dataSensor.ph < phKalLow) &&
        (_dataSensor.ketinggian >= heightKalLow &&
            _dataSensor.ketinggian <= heightKalHigh) &&
        (_dataSensor.temperatur >= tempKalLow &&
            _dataSensor.temperatur <= tempKalHigh)) {
      sehat();
      phLow();
      heightOptimal();
      tempOptimal();
      print("23");
      //23 //done
    } else if ((_dataSensor.ph >= phKalLow && _dataSensor.ph <= phKalHigh) &&
        (_dataSensor.ketinggian >= heightKalLow &&
            _dataSensor.ketinggian <= heightKalHigh) &&
        (_dataSensor.temperatur < tempKalLow)) {
      sehat();
      phOptimal();
      heightOptimal();
      tempLow();
      print("22");
      //22 //done
    } else if ((_dataSensor.ph >= phKalLow && _dataSensor.ph <= phKalHigh) &&
        (_dataSensor.ketinggian < heightKalLow) &&
        (_dataSensor.temperatur >= tempKalLow &&
            _dataSensor.temperatur <= tempKalHigh)) {
      sehat();
      phOptimal();
      heightLow();
      tempOptimal();
      print("21");
      //21 //done
    } else if ((_dataSensor.ph > phKalHigh) &&
        (_dataSensor.ketinggian > heightKalHigh) &&
        (_dataSensor.temperatur > tempKalHigh)) {
      tidakSehat();
      phHigh();
      heightHigh();
      tempHigh();
      print("20");
      //20 //done
    } else if ((_dataSensor.ph > phKalHigh) &&
        (_dataSensor.ketinggian >= heightKalLow &&
            _dataSensor.ketinggian <= heightKalHigh) &&
        (_dataSensor.temperatur > tempKalHigh)) {
      tidakSehat();
      phHigh();
      heightOptimal();
      tempHigh();
      print("19");
      //19 //done
    } else if ((_dataSensor.ph >= phKalLow && _dataSensor.ph <= phKalHigh) &&
        (_dataSensor.ketinggian > heightKalHigh) &&
        (_dataSensor.temperatur > tempKalHigh)) {
      tidakSehat();
      phOptimal();
      heightHigh();
      tempHigh();
      print("18");
      //18 //done
    } else if ((_dataSensor.ph > phKalHigh) &&
        (_dataSensor.ketinggian > heightKalHigh) &&
        (_dataSensor.temperatur >= tempKalLow &&
            _dataSensor.temperatur <= tempKalHigh)) {
      tidakSehat();
      phHigh();
      heightHigh();
      tempOptimal();
      print("17");
      //17 //done
    } else if ((_dataSensor.ph > phKalHigh) &&
        (_dataSensor.ketinggian < heightKalLow) &&
        (_dataSensor.temperatur >= tempKalLow &&
            _dataSensor.temperatur <= tempKalHigh)) {
      tidakSehat();
      phHigh();
      heightLow();
      tempOptimal();
      print("16");
      //16 //done
    } else if ((_dataSensor.ph >= phKalLow && _dataSensor.ph <= phKalHigh) &&
        (_dataSensor.ketinggian < heightKalLow) &&
        (_dataSensor.temperatur > tempKalHigh)) {
      tidakSehat();
      phOptimal();
      heightLow();
      tempHigh();
      print("15");
      //15 //done
    } else if ((_dataSensor.ph > phKalHigh) &&
        (_dataSensor.ketinggian >= heightKalLow &&
            _dataSensor.ketinggian <= heightKalHigh) &&
        (_dataSensor.temperatur > tempKalHigh)) {
      tidakSehat();
      phHigh();
      heightOptimal();
      tempLow();
      print("14");
      //14 //done
    } else if ((_dataSensor.ph < phKalLow) &&
        (_dataSensor.ketinggian >= heightKalLow &&
            _dataSensor.ketinggian <= heightKalHigh) &&
        (_dataSensor.temperatur > tempKalHigh)) {
      tidakSehat();
      phLow();
      heightOptimal();
      tempHigh();
      print("13");
      //13 //done
    } else if ((_dataSensor.ph < phKalLow) &&
        (_dataSensor.ketinggian < heightKalLow) &&
        (_dataSensor.temperatur >= tempKalLow &&
            _dataSensor.temperatur <= tempKalHigh)) {
      tidakSehat();
      phLow();
      heightLow();
      tempOptimal();
      print("12");
      //12 //done
    } else if ((_dataSensor.ph < phKalLow) &&
        (_dataSensor.ketinggian > heightKalHigh) &&
        (_dataSensor.temperatur < tempKalLow)) {
      tidakSehat();
      phLow();
      heightHigh();
      tempLow();
      print("11");
      //11 //done
    } else if ((_dataSensor.ph >= phKalLow && _dataSensor.ph <= phKalHigh) &&
        (_dataSensor.ketinggian > heightKalHigh) &&
        (_dataSensor.temperatur < tempKalLow)) {
      tidakSehat();
      phOptimal();
      heightHigh();
      tempLow();
      print("10");
      //10 //done
    } else if ((_dataSensor.ph < phKalLow) &&
        (_dataSensor.ketinggian > heightKalHigh) &&
        (_dataSensor.temperatur >= tempKalLow &&
            _dataSensor.temperatur <= tempKalHigh)) {
      tidakSehat();
      phLow();
      heightHigh();
      tempOptimal();
      print("9");
      //9 //done
    } else if ((_dataSensor.ph < phKalLow) &&
        (_dataSensor.ketinggian >= heightKalLow &&
            _dataSensor.ketinggian <= heightKalHigh) &&
        (_dataSensor.temperatur < tempKalLow)) {
      tidakSehat();
      phLow();
      heightOptimal();
      tempLow();
      print("8");
      //8 //done
    } else if ((_dataSensor.ph >= phKalLow && _dataSensor.ph <= phKalHigh) &&
        (_dataSensor.ketinggian < heightKalLow) &&
        (_dataSensor.temperatur < tempKalLow)) {
      tidakSehat();
      phOptimal();
      heightLow();
      tempLow();
      print("7");
      //7 //done
    } else if ((_dataSensor.ph > phKalHigh) &&
        (_dataSensor.ketinggian > heightKalHigh) &&
        (_dataSensor.temperatur < tempKalLow)) {
      sangatTidakSehat();
      phHigh();
      heightHigh();
      tempLow();
      print("6");
      //6 //done
    } else if ((_dataSensor.ph > phKalHigh) &&
        (_dataSensor.ketinggian < heightKalLow) &&
        (_dataSensor.temperatur > tempKalHigh)) {
      sangatTidakSehat();
      phHigh();
      heightLow();
      tempHigh();
      print("5");
      //5 //done
    } else if ((_dataSensor.ph > phKalHigh) &&
        (_dataSensor.ketinggian < heightKalLow) &&
        (_dataSensor.temperatur < tempKalLow)) {
      sangatTidakSehat();
      phHigh();
      heightLow();
      tempLow();
      print("4");
      //4 //done
    } else if ((_dataSensor.ph < phKalLow) &&
        (_dataSensor.ketinggian > heightKalHigh) &&
        (_dataSensor.temperatur > tempKalHigh)) {
      sangatTidakSehat();
      phLow();
      heightHigh();
      tempHigh();
      print("3");
      //3 //done
    } else if ((_dataSensor.ph < phKalLow) &&
        (_dataSensor.ketinggian < heightKalLow) &&
        (_dataSensor.temperatur > tempKalHigh)) {
      sangatTidakSehat();
      phLow();
      heightLow();
      tempHigh();
      print("2");
      //2 //done
    } else if ((_dataSensor.ph < phKalLow) &&
        (_dataSensor.ketinggian < heightKalLow) &&
        (_dataSensor.temperatur < tempKalLow)) {
      sangatTidakSehat();
      phLow();
      heightLow();
      tempLow();
      print("1");
      //1 //done
    } else {
      sangatTidakSehat();
      print("exc");
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
