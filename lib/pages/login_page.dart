import 'package:desain_eelfeel/animations/FadeAnimation.dart';
import 'package:desain_eelfeel/pages/registration_page.dart';
import 'package:desain_eelfeel/widgets/revised_button.dart';
import 'package:desain_eelfeel/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  AnimationController _animationController;

  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    usernameCtrl.dispose();
    passwordCtrl.dispose();

    super.dispose();
  }

  clearTextInput() {
    usernameCtrl.clear();
    passwordCtrl.clear();
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    Size size = MediaQuery.of(context).size;
    bool _obscureText = true;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      FadeAnimation(
                        1.8,
                        Image.asset(
                          "assets/images/logo-eel-feel.png",
                          width: size.width * 0.45,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      FadeAnimation(
                        1.6,
                        Text(
                          'Welcome',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 45,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      FadeAnimation(
                        2,
                        Text(
                          'Selamat datang di aplikasi \nmonitoring kolam belut',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Image.asset(
              "assets/images/banner.png",
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 15),
            Container(
              width: size.width * 0.88,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: TextField(
                controller: usernameCtrl,
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
                  prefixIcon: Icon(
                    Icons.email_rounded,
                    color: Colors.grey,
                  ),
                  hintText: "Username or E-mail",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Container(
              width: size.width * 0.88,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: TextField(
                controller: passwordCtrl,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  prefixIcon: Icon(
                    Icons.vpn_key,
                    color: Colors.grey,
                  ),
                  hintText: "Password",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
                obscureText: _obscureText,
              ),
            ),
            Container(
              child: RevisedButton(
                buttonSize: size.width * 0.88,
                descButton: 'Login',
                color: Color.fromARGB(255, 108, 110, 127),
                textColor: Colors.white,
                press: () {
                  if ((usernameCtrl.text == "admin") &&
                      (passwordCtrl.text == "password")) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WelcomePage(),
                      ),
                    );
                    clearTextInput();
                  } else {
                    print("error");
                  }
                },
              ),
            ),
            Container(
              child: RevisedButton(
                buttonSize: size.width * 0.88,
                descButton: 'Create an Account',
                color: Color.fromARGB(255, 45, 50, 67),
                textColor: Colors.white,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegistrationPage(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: size.height * 0.05),
          ],
        ),
      ),
    );
  }
}
