import 'package:desain_eelfeel/animations/FadeAnimation.dart';
import 'package:desain_eelfeel/dataSensor.dart';
import 'package:desain_eelfeel/pages/show_stats.dart';
import 'package:desain_eelfeel/pages/welcome_page.dart';
import 'package:desain_eelfeel/widgets/revised_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ManualInput extends StatefulWidget {
  @override
  _ManualInputState createState() => _ManualInputState();
}

class _ManualInputState extends State<ManualInput> {
  String logsensor = 'logSensor';

  DatabaseReference databaseReference =
      FirebaseDatabase.instance.reference().child('dataSensor');
  DatabaseReference kalibrasiAplikasi = FirebaseDatabase.instance
      .reference()
      .child('dataSensor')
      .child('kalibrasiApp');

  final phController = TextEditingController();
  final tempController = TextEditingController();
  final heightController = TextEditingController();

  String keadaan;
  int phStats, tempStats, heightStats;

  @override
  void dispose() {
    phController.dispose();
    tempController.dispose();
    heightController.dispose();

    super.dispose();
  }

  clearTextInput() {
    phController.clear();
    tempController.clear();
    heightController.clear();
  }

  void sangatSehat() {
    keadaan = 'Sangat Sehat';
  }

  void sehat() {
    keadaan = 'Sehat';
  }

  void tidakSehat() {
    keadaan = 'Tidak Sehat';
  }

  void sangatTidakSehat() {
    keadaan = 'Sangat Tidak Sehat';
  }

  void dudeReally() {
    keadaan = 'Dude, really?';
  }

  //ph
  void phLow() {
    phStats = 1;
  }

  void phHigh() {
    phStats = 2;
  }

  void phOptimal() {
    phStats = 3;
  }

  //temp
  void tempLow() {
    tempStats = 1;
  }

  void tempHigh() {
    tempStats = 2;
  }

  void tempOptimal() {
    tempStats = 3;
  }

  //height
  void heightLow() {
    heightStats = 1;
  }

  void heightHigh() {
    heightStats = 2;
  }

  void heightOptimal() {
    heightStats = 3;
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

  void keadaanKolam(DataSensor _dataSensor) async {
    double phCalc = double.parse(phController.text);
    double tempCalc = double.parse(tempController.text);
    double heightCalc = double.parse(heightController.text);

    int tempKalLow = _dataSensor.heightLowKalibrasi;
    int tempKalHigh = _dataSensor.tempHighKalibrasi;
    int heightKalLow = _dataSensor.heightLowKalibrasi;
    int heightKalHigh = _dataSensor.heightHighKalibrasi;
    int phKalLow = _dataSensor.phLowKalibrasi;
    int phKalHigh = _dataSensor.phHighKalibrasi;

    if ((phCalc == 100) && (heightCalc == 100) && (tempCalc == 100)) {
      dudeReally();
      //lmao
    } else if ((phCalc >= phKalLow && phCalc <= phKalHigh) &&
        (heightCalc >= heightKalLow && heightCalc <= heightKalHigh) &&
        (tempCalc >= tempKalLow && tempCalc <= tempKalHigh)) {
      sangatSehat();
      phOptimal();
      heightOptimal();
      tempOptimal();
      //27 //done
    } else if ((phCalc > phKalHigh) &&
        (heightCalc >= heightKalLow && heightCalc <= heightKalHigh) &&
        (tempCalc >= tempKalLow && tempCalc <= tempKalHigh)) {
      sehat();
      phHigh();
      heightOptimal();
      tempOptimal();
      //26 //done
    } else if ((phCalc >= phKalLow && phCalc <= phKalHigh) &&
        (heightCalc < heightKalLow) &&
        (tempCalc >= tempKalLow && tempCalc <= tempKalHigh)) {
      sehat();
      phOptimal();
      heightLow();
      tempHigh();
      //25 //done
    } else if ((phCalc >= phKalLow && phCalc <= phKalHigh) &&
        (heightCalc >= heightKalLow && heightCalc <= heightKalHigh) &&
        (tempCalc > tempKalHigh)) {
      sehat();
      phOptimal();
      heightOptimal();
      tempHigh();
      //24 //done
    } else if ((phCalc < phKalLow) &&
        (heightCalc >= heightKalLow && heightCalc <= heightKalHigh) &&
        (tempCalc >= tempKalLow && tempCalc <= tempKalHigh)) {
      sehat();
      phLow();
      heightOptimal();
      tempOptimal();
      //23 //done
    } else if ((phCalc >= phKalLow && phCalc <= phKalHigh) &&
        (heightCalc >= heightKalLow && heightCalc <= heightKalHigh) &&
        (tempCalc < tempKalLow)) {
      sehat();
      phOptimal();
      heightOptimal();
      tempLow();
      //22 //done
    } else if ((phCalc >= phKalLow && phCalc <= phKalHigh) &&
        (heightCalc < heightKalLow) &&
        (tempCalc >= tempKalLow && tempCalc <= tempKalHigh)) {
      sehat();
      phOptimal();
      heightLow();
      tempOptimal();
      //21 //done
    } else if ((phCalc > phKalHigh) &&
        (heightCalc > heightKalHigh) &&
        (tempCalc > tempKalHigh)) {
      tidakSehat();
      phHigh();
      heightHigh();
      tempHigh();
      //20 //done
    } else if ((phCalc > phKalHigh) &&
        (heightCalc >= heightKalLow && heightCalc <= heightKalHigh) &&
        (tempCalc > tempKalHigh)) {
      tidakSehat();
      phHigh();
      heightOptimal();
      tempHigh();
      //19 //done
    } else if ((phCalc >= phKalLow && phCalc <= phKalHigh) &&
        (heightCalc > heightKalHigh) &&
        (tempCalc > tempKalHigh)) {
      tidakSehat();
      phOptimal();
      heightHigh();
      tempHigh();
      //18 //done
    } else if ((phCalc > phKalHigh) &&
        (heightCalc > heightKalHigh) &&
        (tempCalc >= tempKalLow && tempCalc <= tempKalHigh)) {
      tidakSehat();
      phHigh();
      heightHigh();
      tempOptimal();
      //17 //done
    } else if ((phCalc > phKalHigh) &&
        (heightCalc < heightKalLow) &&
        (tempCalc >= tempKalLow && tempCalc <= tempKalHigh)) {
      tidakSehat();
      phHigh();
      heightLow();
      tempOptimal();
      //16 //done
    } else if ((phCalc >= phKalLow && phCalc <= phKalHigh) &&
        (heightCalc < heightKalLow) &&
        (tempCalc > tempKalHigh)) {
      tidakSehat();
      phOptimal();
      heightLow();
      tempHigh();
      //15 //done
    } else if ((phCalc > phKalHigh) &&
        (heightCalc >= heightKalLow && heightCalc <= heightKalHigh) &&
        (tempCalc > tempKalHigh)) {
      tidakSehat();
      phHigh();
      heightOptimal();
      tempLow();
      //14 //done
    } else if ((phCalc < phKalLow) &&
        (heightCalc >= heightKalLow && heightCalc <= heightKalHigh) &&
        (tempCalc > tempKalHigh)) {
      tidakSehat();
      phLow();
      heightOptimal();
      tempHigh();
      //13 //done
    } else if ((phCalc < phKalLow) &&
        (heightCalc < heightKalLow) &&
        (tempCalc >= tempKalLow && tempCalc <= tempKalHigh)) {
      tidakSehat();
      phLow();
      heightLow();
      tempOptimal();
      //12 //done
    } else if ((phCalc < phKalLow) &&
        (heightCalc > heightKalHigh) &&
        (tempCalc < tempKalLow)) {
      tidakSehat();
      phLow();
      heightHigh();
      tempLow();
      //11 //done
    } else if ((phCalc >= phKalLow && phCalc <= phKalHigh) &&
        (heightCalc > heightKalHigh) &&
        (tempCalc < tempKalLow)) {
      tidakSehat();
      phOptimal();
      heightHigh();
      tempLow();
      //10 //done
    } else if ((phCalc < phKalLow) &&
        (heightCalc > heightKalHigh) &&
        (tempCalc >= tempKalLow && tempCalc <= tempKalHigh)) {
      tidakSehat();
      phLow();
      heightHigh();
      tempOptimal();
      //9 //done
    } else if ((phCalc < phKalLow) &&
        (heightCalc >= heightKalLow && heightCalc <= heightKalHigh) &&
        (tempCalc < tempKalLow)) {
      tidakSehat();
      phLow();
      heightOptimal();
      tempLow();
      //8 //done
    } else if ((phCalc >= phKalLow && phCalc <= phKalHigh) &&
        (heightCalc < heightKalLow) &&
        (tempCalc < tempKalLow)) {
      tidakSehat();
      phOptimal();
      heightLow();
      tempLow();
      //7 //done
    } else if ((phCalc > phKalHigh) &&
        (heightCalc > heightKalHigh) &&
        (tempCalc < tempKalLow)) {
      sangatTidakSehat();
      phHigh();
      heightHigh();
      tempLow();
      //6 //done
    } else if ((phCalc > phKalHigh) &&
        (heightCalc < heightKalLow) &&
        (tempCalc > tempKalHigh)) {
      sangatTidakSehat();
      phHigh();
      heightLow();
      tempHigh();
      //5 //done
    } else if ((phCalc > phKalHigh) &&
        (heightCalc < heightKalLow) &&
        (tempCalc < tempKalLow)) {
      sangatTidakSehat();
      phHigh();
      heightLow();
      tempLow();
      //4 //done
    } else if ((phCalc < phKalLow) &&
        (heightCalc > heightKalHigh) &&
        (tempCalc > tempKalHigh)) {
      sangatTidakSehat();
      phLow();
      heightHigh();
      tempHigh();
      //3 //done
    } else if ((phCalc < phKalLow) &&
        (heightCalc < heightKalLow) &&
        (tempCalc > tempKalHigh)) {
      sangatTidakSehat();
      phLow();
      heightLow();
      tempHigh();
      //2 //done
    } else if ((phCalc < phKalLow) &&
        (heightCalc < heightKalLow) &&
        (tempCalc < tempKalLow)) {
      sangatTidakSehat();
      phLow();
      heightLow();
      tempLow();
      //1 //done
    } else {
      sangatTidakSehat();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 4,
        centerTitle: true,
        title: Text(
          'Input Manual',
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
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              textForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget textForm() {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          FadeAnimation(
            1.8,
            Image.asset(
              "assets/images/logo-eel-feel.png",
              width: size.width * 0.5,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: size.height * 0.05),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Masukkan data parameter kolam anda dan kami akan mendiagnosa keadaannya.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: size.width * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(3, 3),
                  blurRadius: 4.0,
                ),
              ],
            ),
            child: TextField(
              textAlign: TextAlign.start,
              controller: phController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                hintText: "Nilai pH",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
                prefixIcon: Icon(
                  Icons.opacity_rounded,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: size.width * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(3, 3),
                  blurRadius: 4.0,
                ),
              ],
            ),
            child: TextField(
              textAlign: TextAlign.start,
              controller: tempController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                hintText: "Temperatur",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
                prefixIcon: Icon(
                  Icons.device_thermostat,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: size.width * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(3, 3),
                  blurRadius: 4.0,
                ),
              ],
            ),
            child: TextField(
              textAlign: TextAlign.start,
              controller: heightController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                hintText: "Ketinggian Air",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
                prefixIcon: Icon(
                  Icons.waves_rounded,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          RevisedButton(
            descButton: 'Calculate',
            textColor: Colors.white,
            buttonSize: size.width * 0.5,
            color: Colors.cyan[900],
            press: () {},
          ),
          SizedBox(height: size.height * 0.04),
          Image.asset(
            "assets/images/banner.png",
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
