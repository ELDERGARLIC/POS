import 'package:corpapp/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:corpapp/screens/login_screen.dart';
import 'package:flutter/services.dart';
import 'package:corpapp/utilities/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        bool condition = prefs.getBool('rememberMe');
        if (condition == true) {
          print('YOU R ON FIRE!');
          User tempUser = User(
            token: prefs.getString('token'),
            personalCode: prefs.getString('personalCode'),
            fName: prefs.getString('fName'),
            lName: prefs.getString('lName'),
            post: prefs.getString('post'),
            nationalId: prefs.getString('nationalId'),
            phone: prefs.getString('phone'),
            rememberMe: prefs.getBool('rememberMe'),
          );
          loggedUser = tempUser;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Image.asset(
          'assets/logos/wtf.jpeg',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
