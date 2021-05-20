import 'package:desain_eelfeel/authentications/auth_services.dart';
import 'package:flutter/material.dart';

class LoginPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test login'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Sign-In Anon"),
          onPressed: () async {
            await AuthServices.signInAnonymous();
          },
        ),
      ),
    );
  }
}
