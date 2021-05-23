import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ManualMonitor extends StatefulWidget {
  @override
  _ManualMonitorState createState() => _ManualMonitorState();
}

class _ManualMonitorState extends State<ManualMonitor> {
  Query _ref;

  @override
  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance
        .reference()
        .child('dataSensor')
        .child('logSensor_history')
        .orderByChild('tanggal');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 8,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: const Text(
          'Riwayat Data',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        child: Container(
          child: FirebaseAnimatedList(
            query: _ref,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              Map dataSensor = snapshot.value;
              return _manualMonitorSensor(dataSensor: dataSensor);
            },
          ),
        ),
      ),
    );
  }

  Widget _manualMonitorSensor({Map dataSensor}) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.cyan[50],
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(0, 3),
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                      Icon(
                        Icons.calendar_today_rounded,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        dataSensor['hari'],
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ', ',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        dataSensor['tanggal'],
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.access_alarm,
                            color: Colors.black,
                            size: 20,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "Jam:",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            dataSensor['jam'],
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[850],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.healing_rounded,
                            color: Colors.black,
                            size: 20,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "Keadaan : ",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            dataSensor['keadaan'],
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[850],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.opacity_rounded,
                            color: Colors.black,
                            size: 20,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "pH : ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            dataSensor['ph'],
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[850],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.waves_rounded,
                            color: Colors.black,
                            size: 20,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "Ketinggian Air : ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            dataSensor['ketinggian'],
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[850],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.device_thermostat,
                            color: Colors.black,
                            size: 20,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "Temperatur : ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            dataSensor['temperatur'],
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[850],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
