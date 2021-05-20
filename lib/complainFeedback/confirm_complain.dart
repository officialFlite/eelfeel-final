import 'package:desain_eelfeel/pages/welcome_page.dart';
import 'package:flutter/material.dart';

class ConfirmComplain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                "assets/images/logo-eel-feel.png",
                width: size.width * 0.4,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                'Terima Kasih telah menghubungi kami. \nKami akan kembali dengan \nsolusi yang lebih baik',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: size.height * 0.28,
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
