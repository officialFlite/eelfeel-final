import 'package:desain_eelfeel/pages/consult_page.dart';
import 'package:flutter/material.dart';

class ConfirmConsultation extends StatelessWidget {
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ConsultPage(),
              ),
            );
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
                'Terima Kasih telah menghubungi kami. \nKami akan menghubungi anda kembali dengan solusi yang lebih baik',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: size.height * 0.29,
              ),
              Text(
                'Hubungi Kami',
                style: TextStyle(fontSize: 18),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/whatsapp-logo.png",
                      width: 30,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      '08123456xxx',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
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
