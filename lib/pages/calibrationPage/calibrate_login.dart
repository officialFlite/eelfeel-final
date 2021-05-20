import 'package:desain_eelfeel/pages/calibrationPage/calibration_page.dart';
import 'package:desain_eelfeel/pages/welcome_page.dart';
import 'package:desain_eelfeel/widgets/revised_button.dart';
import 'package:flutter/material.dart';

class CalibrateLogin extends StatefulWidget {
  @override
  _CalibrateLoginState createState() => _CalibrateLoginState();
}

class _CalibrateLoginState extends State<CalibrateLogin> {
  final loginController = TextEditingController();

  @override
  void dispose() {
    loginController.dispose();
    super.dispose();
  }

  clearTextInput() {
    loginController.clear();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool _validate = false;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 8,
        centerTitle: true,
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
            children: [
              Container(
                width: size.width * 0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.vpn_key,
                      color: Colors.grey,
                      size: 40,
                    ),
                    Text(
                      'Please input the password to access the calibration page',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
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
                  controller: loginController,
                  textAlign: TextAlign.center,
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
                    hintText: "Enter Password",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                  obscureText: true,
                ),
              ),
              Container(
                child: RevisedButton(
                  buttonSize: size.width * 0.88,
                  descButton: 'Login',
                  color: Color.fromARGB(255, 55, 60, 77),
                  textColor: Colors.white,
                  press: () {
                    if (loginController.text == "aaaccc") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CalibrationPage(),
                        ),
                      );
                      clearTextInput();
                    } else {
                      print("error");
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
