import 'package:desain_eelfeel/complainFeedback/confirm_complain.dart';
import 'package:desain_eelfeel/pages/welcome_page.dart';
import 'package:desain_eelfeel/widgets/revised_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ComplainMenu extends StatefulWidget {
  @override
  _ComplainMenuState createState() => _ComplainMenuState();
}

class _ComplainMenuState extends State<ComplainMenu> {
  final subjectController = TextEditingController();
  final complainController = TextEditingController();

  DatabaseReference uploadDataComplain = FirebaseDatabase.instance
      .reference()
      .child('dataSensor')
      .child('dataComplain')
      .child('feedbackPengguna');

  void complainUploadData() {
    uploadDataComplain.push().set(
      {
        'subjectDescription': subjectController.text,
        'complainDescription': complainController.text,
      },
    );
  }

  @override
  void dispose() {
    subjectController.dispose();
    complainController.dispose();
    super.dispose();
  }

  clearTextInput() {
    subjectController.clear();
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
        title: Text(
          'Feedback',
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
            children: [
              SizedBox(
                height: 25,
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
                  controller: subjectController,
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
                    hintText: "Subject",
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
                    hintText: "Description",
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
                    setState(() {
                      subjectController.text.isEmpty
                          ? _validate = true
                          : _validate = false;
                      complainController.text.isEmpty
                          ? _validate = true
                          : _validate = false;
                    });
                    complainUploadData();
                    clearTextInput();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConfirmComplain(),
                      ),
                    );
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
