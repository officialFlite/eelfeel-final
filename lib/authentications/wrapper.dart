import 'package:desain_eelfeel/authentications/main_page2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:desain_eelfeel/authentications/login_page2.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User firebaseUser = Provider.of<User>(context);
    return (firebaseUser == null) ? LoginPage2() : MainPage2(firebaseUser);
  }
}
