import 'package:desain_eelfeel/authentications/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPage2 extends StatelessWidget {
  final User user;
  MainPage2(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(user.uid),
            ElevatedButton(
              onPressed: () async {
                await AuthServices.signOut();
              },
              child: null,
            )
          ],
        ),
      ),
    );
  }
}
