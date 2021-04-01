import 'package:desain_eelfeel/about_dev.dart';
import 'package:desain_eelfeel/complain_menu.dart';
import 'package:desain_eelfeel/login_page.dart';
import 'package:desain_eelfeel/welcome_page.dart';
import 'package:flutter/material.dart';

class MenuDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    precacheImage(AssetImage("assets/images/bottom-banner.png"), context);
    precacheImage(AssetImage("assets/images/logo-eel-feel.png"), context);

    return Drawer(
      child: Container(
        color: Colors.white,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                "assets/images/logo-eel-feel.png",
                width: size.width * 0.4,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text(
                  'Home',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () => {
                  Navigator.of(context).pop(),
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WelcomePage(),
                    ),
                    ModalRoute.withName("/Home"),
                  )
                },
              ),
              ListTile(
                leading: Icon(Icons.border_color),
                title: Text(
                  'Feedback',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () => {
                  Navigator.of(context).pop(),
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ComplainMenu(),
                    ),
                  ),
                },
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text(
                  'About',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () => {
                  Navigator.of(context).pop(),
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutDev(),
                    ),
                  ),
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () => {
                  Navigator.of(context).pop(),
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  ),
                },
              ),
              SizedBox(
                height: size.height * 0.2,
              ),
              Image.asset(
                "assets/images/bottom-banner.png",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
