import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:corpapp/services/liste_darkhast/liste_darkhast_networking.dart';

// VARIABLES
var basicData;
bool rememberMe = false;
User loggedUser;
String globalToken;

// CLASSES
class User {
  String token;
  String personalCode;
  String fName;
  String lName;
  String post;
  String nationalId;
  String phone;
  String globalToken;
  bool rememberMe;

  User({
    @required this.token,
    @required this.personalCode,
    @required this.fName,
    @required this.lName,
    @required this.post,
    @required this.nationalId,
    @required this.phone,
    @required this.rememberMe,
    @required this.globalToken,
  });
}

// FUNCTIONS
void logOutFunction(BuildContext context) async {
  {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: new Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 50,
                  child: new CircularProgressIndicator(
                    strokeWidth: 5,
                  ),
                ),
              ),
              new Text("Loading"),
            ],
          ),
        );
      },
    );
    new Future.delayed(
      new Duration(seconds: 1),
      () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.remove('token');
        prefs.remove('fName');
        prefs.remove('lName');
        prefs.remove('post');
        prefs.remove('personalCode');
        prefs.remove('nationalId');
        prefs.remove('phone');
        prefs.remove('rememberMe');
        prefs.remove('globalToken');
        Navigator.pop(context); //pop dialog
        Navigator.pushNamed(context, '/login');
      },
    );
  }
}

Drawer returnDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          child: Image.asset('assets/logos/pos.png'),
          decoration: BoxDecoration(
            color: Color(0xFF61A4F1),
          ),
        ),
        ListTile(
          title: Text(
            'ارتباط با ما',
            textDirection: TextDirection.rtl,
          ),
          onTap: () {
            Navigator.pop(context);
            launch('http://pos.co.ir/');
          },
        ),
        ListTile(
          title: Text(
            'پیغام ها',
            textDirection: TextDirection.rtl,
          ),
          onTap: () async {
            getListeDarkhast(context);
          },
        ),
      ],
    ),
  );
}

FloatingActionButton returnFloatingActionButton(BuildContext context) {
  return FloatingActionButton(
    onPressed: () async {
      getListeDarkhast(context);
    },
    backgroundColor: Color(0xFF61A4F1),
    child: Stack(
      children: [
        Icon(Icons.mail),
        Positioned(
          right: -0,
          top: -0,
          child: Opacity(
            opacity: 0, // TODO: MAKE A NUMERIC ALERT FOR THE MESSEGES
            child: Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.red,
              ),
              child: Center(
                child: Text(
                  '1',
                  style: TextStyle(fontSize: 8),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
