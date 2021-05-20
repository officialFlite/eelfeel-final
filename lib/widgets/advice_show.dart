import 'package:desain_eelfeel/dataSensor.dart';
import 'package:desain_eelfeel/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import '../pages/menu_dashboard.dart';

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
  DatabaseReference isiAdvice = FirebaseDatabase.instance
      .reference()
      .child('dataSensor')
      .child('dataAdvice');
  DatabaseReference uploadData = FirebaseDatabase.instance
      .reference()
      .child('dataSensor')
      .child('logSensor_history');

  void pilihSaranPH(DataSensor _dataSensor) {
    if ('${_dataSensor.phStats}' == '1') {
      //do low
      phTitle = 'pH Rendah';
      phAdvice = '${_dataSensor.saranPhLow}';
    } else if ('${_dataSensor.phStats}' == '2') {
      //do high
      phTitle = 'pH Tinggi';
      phAdvice = '${_dataSensor.saranPhHigh}';
    } else if ('${_dataSensor.phStats}' == '3') {
      //do opt
      phTitle = 'pH Optimal';
      phAdvice = '${_dataSensor.saranPhOptimal}';
    }
  }

  void pilihSaranTemp(DataSensor _dataSensor) {
    if ('${_dataSensor.tempStats}' == '1') {
      //do low
      tempTitle = 'Temperatur Rendah';
      tempAdvice = '${_dataSensor.saranTempLow}';
    } else if ('${_dataSensor.tempStats}' == '2') {
      //do high
      tempTitle = 'Temperatur Tinggi';
      tempAdvice = '${_dataSensor.saranTempHigh}';
    } else if ('${_dataSensor.tempStats}' == '3') {
      //do opt
      tempTitle = 'Temperatur Optimal';
      tempAdvice = '${_dataSensor.saranTempHigh}';
    }
  }

  void pilihSaranHeight(DataSensor _dataSensor) {
    if ('${_dataSensor.heightStats}' == '1') {
      //do low
      heightTitle = 'Ketinggian Rendah';
      heightAdvice = '${_dataSensor.saranHeightLow}';
    } else if ('${_dataSensor.heightStats}' == '2') {
      //do high
      heightTitle = 'Ketinggian Tinggi';
      heightAdvice = '${_dataSensor.saranHeightHigh}';
    } else if ('${_dataSensor.heightStats}' == '3') {
      //do opt
      heightTitle = 'Ketinggian Optimal';
      heightAdvice = '${_dataSensor.saranHeightOptimal}';
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
        elevation: 4,
        centerTitle: true,
        title: Text(
          'Lihat Saran',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => WelcomePage()),
                (Route<dynamic> route) => false);
          },
        ),
      ),
      drawer: Container(
        width: size.width * 0.5,
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
                height: size.height * 0.55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.cyan[50],
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
                height: size.height * 0.55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.cyan[50],
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
                height: size.height * 0.55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.cyan[50],
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
