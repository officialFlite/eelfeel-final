import 'package:desain_eelfeel/advice_show.dart';
import 'package:desain_eelfeel/manual_monitor.dart';
import 'package:desain_eelfeel/revised_button.dart';
import 'package:flutter/material.dart';
import 'package:desain_eelfeel/dataSensor.dart';
import 'package:firebase_database/firebase_database.dart';

class ShowStats extends StatefulWidget {
  @override
  _ShowStatsState createState() => _ShowStatsState();
}

class _ShowStatsState extends State<ShowStats> {
  String logsensor = 'logSensor';
  Color colorCondition;

  DatabaseReference databaseReference =
      FirebaseDatabase.instance.reference().child('dataSensor');
  DatabaseReference keadaanSehat = FirebaseDatabase.instance
      .reference()
      .child('dataSensor')
      .child('logSensor');
  DatabaseReference uploadData = FirebaseDatabase.instance
      .reference()
      .child('dataSensor')
      .child('logSensor_history');
  DatabaseReference downloadSaran = FirebaseDatabase.instance
      .reference()
      .child('dataSensor')
      .child('adviceBank');

  void dataLogSensor(DataSensor _dataSensor) {
    uploadData.push().set(
      {
        'hari': _dataSensor.hari,
        'jam': _dataSensor.jam,
        'tanggal': _dataSensor.tanggal,
        'ph': _dataSensor.ph.toString(),
        'ketinggian': _dataSensor.ketinggian.toString(),
        'temperatur': _dataSensor.temperatur.toString(),
        'keadaan': _dataSensor.keadaan,
      },
    );
  }

  void conditionColor(DataSensor _dataSensor) {
    if ('${_dataSensor.keadaan}' == 'Sangat Sehat') {
      colorCondition = Colors.lightGreenAccent[700];
    } else if ('${_dataSensor.keadaan}' == 'Sehat') {
      colorCondition = Colors.green[300];
    } else if ('${_dataSensor.keadaan}' == 'Tidak Sehat') {
      colorCondition = Colors.orange[600];
    } else if ('${_dataSensor.keadaan}' == 'Sangat Tidak Sehat') {
      colorCondition = Colors.red;
    } else {
      colorCondition = Colors.pink;
    }
  }

  @override
  Widget build(BuildContext context) {
    return mainScaffold();
  }

  Widget mainScaffold() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: StreamBuilder(
        stream: databaseReference.onValue,
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              !snapshot.hasError &&
              snapshot.data.snapshot.value != null) {
            var _dataSensor =
                DataSensor.fromJson(snapshot.data.snapshot.value[logsensor]);
            conditionColor(_dataSensor);
            return tampilData(_dataSensor);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget tampilData(DataSensor _dataSensor) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'Kondisi kolam saat ini :',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      color: colorCondition,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 5.0,
                        ),
                      ],
                    ),
                    child: Text(
                      '${_dataSensor.keadaan}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.opacity_rounded),
                      Text(
                        '${_dataSensor.ph}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey[80],
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.device_thermostat),
                      Text(
                        '${_dataSensor.temperatur} C',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey[80],
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.waves_rounded),
                      Text(
                        '${_dataSensor.ketinggian} cm',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey[80],
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  Text(
                    '${_dataSensor.hari}, ${_dataSensor.tanggal} / ${_dataSensor.jam}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Image.asset(
                    "assets/images/banner.png",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Column(
                    children: [
                      RevisedButton(
                        descButton: 'Monitoring Manual',
                        color: Color.fromARGB(255, 55, 60, 77),
                        textColor: Colors.white,
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ManualMonitor(),
                            ),
                          );
                        },
                      ),
                      RevisedButton(
                        descButton: 'Lihat Saran',
                        color: Color.fromARGB(255, 55, 60, 77),
                        textColor: Colors.white,
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AdviceShow(
                                phStates: '${_dataSensor.phStats}',
                                tempStates: '${_dataSensor.tempStats}',
                                heightStates: '${_dataSensor.heightStats}',
                                phVal: '${_dataSensor.ph}',
                                tempVal: '${_dataSensor.temperatur}',
                                heightVal: '${_dataSensor.ketinggian}',
                                condStates: '${_dataSensor.keadaan}',
                              ),
                            ),
                          );
                        },
                      ),
                      RevisedButton(
                        descButton: 'Konsultasi Dengan Pakar',
                        color: Color.fromARGB(255, 55, 60, 77),
                        textColor: Colors.white,
                        press: () {},
                      ),
                      RevisedButton(
                        descButton: 'Press to Log',
                        color: Color.fromARGB(255, 55, 60, 77),
                        textColor: Colors.white,
                        press: () {
                          dataLogSensor(_dataSensor);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
