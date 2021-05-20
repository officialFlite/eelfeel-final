import 'package:desain_eelfeel/animations/FadeAnimation.dart';
import 'package:desain_eelfeel/pages/calibrationPage/calibration_page_confirm.dart';
import 'package:desain_eelfeel/widgets/revised_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class CalibrationPage extends StatefulWidget {
  @override
  _CalibrationPageState createState() => _CalibrationPageState();
}

class _CalibrationPageState extends State<CalibrationPage> {
  final phLowCtrl = TextEditingController();
  final phHighCtrl = TextEditingController();
  final tempLowCtrl = TextEditingController();
  final tempHighCtrl = TextEditingController();
  final heightLowCtrl = TextEditingController();
  final heightHighCtrl = TextEditingController();

  DatabaseReference kalibrasiAplikasi = FirebaseDatabase.instance
      .reference()
      .child('dataSensor')
      .child('logSensor');

  void calibrationUpload() {
    kalibrasiAplikasi.update(
      {
        'phLowKalibrasi': phLowCtrl.text,
        'phHighKalibrasi': phHighCtrl.text,
        'tempLowKalibrasi': tempLowCtrl.text,
        'tempHighKalibrasi': tempHighCtrl.text,
        'heightLowKalibrasi': heightLowCtrl.text,
        'heightHighKalibrasi': heightHighCtrl.text,
      },
    );
  }

  @override
  void dispose() {
    phLowCtrl.dispose();
    phHighCtrl.dispose();
    tempLowCtrl.dispose();
    tempHighCtrl.dispose();
    heightLowCtrl.dispose();
    heightHighCtrl.dispose();

    super.dispose();
  }

  clearTextInput() {
    phLowCtrl.clear();
    phHighCtrl.clear();
    tempLowCtrl.clear();
    tempHighCtrl.clear();
    heightLowCtrl.clear();
    heightHighCtrl.clear();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 8,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.05),
              FadeAnimation(
                1.8,
                Image.asset(
                  "assets/images/logo-eel-feel.png",
                  width: size.width * 0.5,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.1, vertical: 15),
                child: Text(
                  'Please input new value to calibrate the Expert System Algorithm',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: size.width * 0.4,
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
                      controller: phLowCtrl,
                      textAlign: TextAlign.start,
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
                        hintText: "Low pH",
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
                  Container(
                    width: size.width * 0.4,
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
                      controller: phHighCtrl,
                      textAlign: TextAlign.start,
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
                        hintText: "High pH",
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
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: size.width * 0.4,
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
                      controller: tempLowCtrl,
                      textAlign: TextAlign.start,
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
                        hintText: "Low Temp",
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
                  Container(
                    width: size.width * 0.4,
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
                      controller: tempHighCtrl,
                      textAlign: TextAlign.start,
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
                        hintText: "High Temp",
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
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: size.width * 0.4,
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
                      controller: heightLowCtrl,
                      textAlign: TextAlign.start,
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
                        hintText: "Low Level",
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
                  Container(
                    width: size.width * 0.4,
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
                      controller: heightHighCtrl,
                      textAlign: TextAlign.start,
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
                        hintText: "High Level",
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
                ],
              ),
              SizedBox(height: 10),
              RevisedButton(
                descButton: 'Upload Calibration',
                textColor: Colors.white,
                buttonSize: size.width * 0.88,
                color: Colors.cyan[900],
                press: () {
                  calibrationUpload();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CalibrationPageConfirm(),
                    ),
                  );
                  clearTextInput();
                },
              ),
              SizedBox(height: size.height * 0.04),
              Image.asset(
                "assets/images/banner.png",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
