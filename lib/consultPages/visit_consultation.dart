import 'package:desain_eelfeel/consultPages/confirm_consultation.dart';
import 'package:desain_eelfeel/widgets/revised_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class VisitConsultation extends StatefulWidget {
  @override
  _VisitConsultationState createState() => _VisitConsultationState();
}

class _VisitConsultationState extends State<VisitConsultation> {
  final subjectController = TextEditingController();
  final phoneController = TextEditingController();
  final complainController = TextEditingController();

  DatabaseReference uploadDataComplain = FirebaseDatabase.instance
      .reference()
      .child('dataSensor')
      .child('dataComplain')
      .child('kehadiranPakar');

  void complainUploadData() {
    uploadDataComplain.push().set(
      {
        'nomorPengeluh': phoneController.text,
        'deskripsiMasalah': complainController.text,
      },
    );
  }

  @override
  void dispose() {
    subjectController.dispose();
    phoneController.dispose();
    complainController.dispose();

    super.dispose();
  }

  clearTextInput() {
    subjectController.clear();
    phoneController.clear();
    complainController.clear();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    bool _validate = false;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
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
            children: [
              SizedBox(
                height: 25,
              ),
              Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.06,
                    ),
                    Text(
                      'Subject : ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Butuh Kehadiran Pakar',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.grey[800],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: size.width * 0.88,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(3, 3),
                      blurRadius: 4.0,
                    ),
                  ],
                ),
                child: TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    errorText: _validate ? 'Value Can\'t Be Empty' : null,
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
                    hintText: "Nomor yang dapat dihubungi",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: size.width * 0.88,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(3.5, 3.5),
                      blurRadius: 4.0,
                    ),
                  ],
                ),
                child: TextField(
                  maxLines: 10,
                  controller: complainController,
                  decoration: InputDecoration(
                    errorText: _validate ? 'Value Can\'t Be Empty' : null,
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
                    hintText: "Deskripsikan Masalah Anda",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: RevisedButton(
                  buttonSize: size.width * 0.88,
                  descButton: 'Submit',
                  color: Color.fromARGB(255, 55, 60, 77),
                  textColor: Colors.white,
                  press: () {
                    complainUploadData();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConfirmConsultation(),
                      ),
                    );
                    clearTextInput();
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Image.asset(
                "assets/images/logo-eel-feel.png",
                width: size.width * 0.4,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
