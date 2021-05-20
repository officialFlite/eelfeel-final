import 'package:desain_eelfeel/widgets/revised_button.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool _obscureText = true;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logo-eel-feel.png",
                width: size.width * 0.4,
                fit: BoxFit.cover,
              ),
              Text(
                'Registration',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.grey[850],
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Image.asset(
                "assets/images/banner.png",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Container(
                width: size.width * 0.88,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: TextField(
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
              SizedBox(height: 10),
              Container(
                width: size.width * 0.88,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: TextField(
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
              SizedBox(height: 10),
              Container(
                width: size.width * 0.88,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: TextField(
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
                    hintText: "Re-Type Password",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                  obscureText: _obscureText,
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Container(
                child: RevisedButton(
                  buttonSize: size.width * 0.88,
                  descButton: 'Register',
                  color: Color.fromARGB(255, 55, 60, 77),
                  textColor: Colors.white,
                  press: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
