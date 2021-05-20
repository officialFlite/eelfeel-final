import 'package:desain_eelfeel/widgets/advice_giving.dart';
import 'package:flutter/material.dart';
import 'package:desain_eelfeel/pages/menu_dashboard.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  DateTime currentBackPressTime;

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

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Press back again to leave'),
          duration: Duration(seconds: 1),
        ),
      );
      return Future.value(false);
    }
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.white70);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 4,
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
      body: WillPopScope(
        child: TabBarView(
          controller: controller,
          children: [
            AdviceGiving(),
          ],
        ),
        onWillPop: onWillPop,
      ),
    );
  }
}
