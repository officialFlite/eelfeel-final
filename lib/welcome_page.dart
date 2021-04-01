import 'package:desain_eelfeel/advice_giving.dart';
import 'package:flutter/material.dart';
import 'package:desain_eelfeel/menu_dashboard.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = new TabController(vsync: this, length: 1);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  DateTime currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.white70);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 8,
        centerTitle: true,
        title: Text(
          'Eel-Feel',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: Container(
        width: size.width * 0.6,
        child: MenuDashboard(),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          AdviceGiving(),
        ],
      ),
    );
  }
}
