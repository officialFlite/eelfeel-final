import 'package:desain_eelfeel/animations/FadeAnimation.dart';
import 'package:desain_eelfeel/pages/consult_page.dart';
/* import 'package:desain_eelfeel/pages/manualinput/manual_input.dart'; */
import 'package:desain_eelfeel/widgets/advice_show.dart';
import 'package:desain_eelfeel/pages/manual_monitor.dart';
import 'package:desain_eelfeel/widgets/revised_button.dart';
import 'package:desain_eelfeel/widgets/data_widgets.dart';
import 'package:flutter/material.dart';
import 'package:desain_eelfeel/dataSensor.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

class ShowStats extends StatefulWidget {
  @override
  _ShowStatsState createState() => _ShowStatsState();
}

class _ShowStatsState extends State<ShowStats> {
  DateTime now = DateTime.now();
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
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    String uploadTime = DateFormat('kk:mm:s').format(now);
    String uploadDay = DateFormat('EEEE').format(now);

    uploadData.push().set(
      {
        'hari': uploadDay,
        'jam': uploadTime,
        'tanggal': formattedDate,
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

    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    String uploadTime = DateFormat('kk:mm:s').format(now);
    String uploadDay = DateFormat('EEEE').format(now);

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
                  Container(
                    height: size.height * 0.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 35),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                uploadDay,
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(width: 10),
                              Text(
                                formattedDate,
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(width: 10),
                              Text(
                                uploadTime,
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        FadeAnimation(
                          1,
                          Text(
                            'Kondisi kolam saat ini :',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        FadeAnimation(
                          1.1,
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
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FadeAnimation(
                          1.2,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DataWidgets(
                                icon: Icons.opacity_rounded,
                                variables: '${_dataSensor.ph}',
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              DataWidgets(
                                icon: Icons.device_thermostat,
                                variables: '${_dataSensor.temperatur} C',
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              DataWidgets(
                                icon: Icons.waves_rounded,
                                variables: '${_dataSensor.ketinggian} cm',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/images/banner.png",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: size.height * 0.02),
                  Column(
                    children: [
                      FadeAnimation(
                        1,
                        RevisedButton(
                          buttonSize: size.width * 0.88,
                          descButton: 'Riwayat Data',
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
                      ),
                      FadeAnimation(
                        1.05,
                        RevisedButton(
                          buttonSize: size.width * 0.88,
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
                      ),
                      FadeAnimation(
                        1.1,
                        RevisedButton(
                          buttonSize: size.width * 0.88,
                          descButton: 'Konsultasi Dengan Pakar',
                          color: Color.fromARGB(255, 55, 60, 77),
                          textColor: Colors.white,
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ConsultPage(
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
                      ),
                      FadeAnimation(
                        1.15,
                        RevisedButton(
                          buttonSize: size.width * 0.88,
                          descButton: 'Press to Log',
                          color: Color.fromARGB(255, 55, 60, 77),
                          textColor: Colors.white,
                          press: () {
                            dataLogSensor(_dataSensor);
                          },
                        ),
                      ),
                      /* FadeAnimation(
                        1.2,
                        RevisedButton(
                          buttonSize: size.width * 0.88,
                          descButton: 'Input Data Manual',
                          color: Color.fromARGB(255, 55, 60, 77),
                          textColor: Colors.white,
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ManualInput(),
                              ),
                            );
                          },
                        ),
                      ), */
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
