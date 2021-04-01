import 'package:desain_eelfeel/dataSensor.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'menu_dashboard.dart';

class AdviceShow extends StatefulWidget {
  final phStates,
      tempStates,
      heightStates,
      phVal,
      tempVal,
      heightVal,
      condStates;
  AdviceShow({
    Key key,
    this.phStates,
    this.tempStates,
    this.heightStates,
    this.phVal,
    this.tempVal,
    this.heightVal,
    this.condStates,
  }) : super(key: key);

  @override
  _AdviceShowState createState() => _AdviceShowState();
}

class _AdviceShowState extends State<AdviceShow> {
  String logsensor = 'logSensor';
  String phAdvice, tempAdvice, heightAdvice;
  String phTitle, tempTitle, heightTitle;

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

  void pilihSaranPH(DataSensor _dataSensor) {
    if ('${_dataSensor.phStats}' == '1') {
      //do low
      phTitle = 'pH Rendah';
      phAdvice =
          "Untuk menaikan pH air dapat menggunakan saringan yang terdiri dari pecahan koral dan pecahan kulit kerang dicampur dengan potongan batu kapur pada saluran aerasi kolam";
    } else if ('${_dataSensor.phStats}' == '2') {
      //do high
      phTitle = 'pH Tinggi';
      phAdvice =
          "Untuk menurunkan pH air dapat menggunakan daun ketapang. Rendam daun ketapang yang telah direbus di dasar air selama beberapa hari.";
    } else if ('${_dataSensor.phStats}' == '3') {
      //do opt
      phTitle = 'pH Optimal';
      phAdvice =
          "Kadar pH air pada kolam sudah optimal. Tetap pertahankan kondisi ini.";
    }
  }

  void pilihSaranTemp(DataSensor _dataSensor) {
    if ('${_dataSensor.tempStats}' == '1') {
      //do low
      tempTitle = 'Temperatur Rendah';
      tempAdvice = "Gunakan water heater untuk menaikkan suhu air kolam.";
    } else if ('${_dataSensor.tempStats}' == '2') {
      //do high
      tempTitle = 'Temperatur Tinggi';
      tempAdvice =
          "Untuk menurunkan temperatur dapat menggunakan water chiller.";
    } else if ('${_dataSensor.tempStats}' == '3') {
      //do opt
      tempTitle = 'Temperatur Optimal';
      tempAdvice =
          "Temperatur air pada kolam sudah optimal. Tetap pertahankan kondisi ini.";
    }
  }

  void pilihSaranHeight(DataSensor _dataSensor) {
    if ('${_dataSensor.heightStats}' == '1') {
      //do low
      heightTitle = 'Ketinggian Rendah';
      heightAdvice =
          "Ketinggian air pada kolam terlalu rendah, tambahkan air secukupnya";
    } else if ('${_dataSensor.heightStats}' == '2') {
      //do high
      heightTitle = 'Ketinggian Tinggi';
      heightAdvice =
          "Ketinggian air pada kolam terlalu tinggi, coba kurangi air dari kolam.";
    } else if ('${_dataSensor.heightStats}' == '3') {
      //do opt
      heightTitle = 'Ketinggian Optimal';
      heightAdvice =
          "Ketinggian air pada kolam sudah optimal. Tetap pertahankan kondisi ini";
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
            pilihSaranPH(_dataSensor);
            pilihSaranTemp(_dataSensor);
            pilihSaranHeight(_dataSensor);
            return tampilSaran(_dataSensor);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget tampilSaran(DataSensor _dataSensor) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 8,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: const Text(
          'Lihat Saran',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      drawer: Container(
        width: size.width * 0.6,
        child: MenuDashboard(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              //top
              Container(
                margin: EdgeInsets.fromLTRB(10, 13, 10, 0),
                height: size.height * 0.37,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(3, 3),
                      blurRadius: 4.0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      height: size.height * 0.065,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 45, 50, 67),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text(
                              phTitle,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.opacity_rounded,
                        ),
                        Text(
                          widget.phVal,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey[80],
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      child: Text(
                        phAdvice,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),

              //middle
              Container(
                margin: EdgeInsets.fromLTRB(10, 13, 10, 0),
                height: size.height * 0.37,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(3, 3),
                      blurRadius: 4.0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      height: size.height * 0.065,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 45, 50, 67),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            tempTitle,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.device_thermostat,
                        ),
                        Text(
                          widget.tempVal,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey[80],
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      child: Text(
                        tempAdvice,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),

              //bottom
              Container(
                margin: EdgeInsets.fromLTRB(10, 13, 10, 0),
                height: size.height * 0.37,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(3, 3),
                      blurRadius: 4.0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      height: size.height * 0.065,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 45, 50, 67),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            heightTitle,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.waves_rounded,
                        ),
                        Text(
                          widget.heightVal,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey[80],
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      child: Text(
                        heightAdvice,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
