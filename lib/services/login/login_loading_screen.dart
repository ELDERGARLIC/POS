import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:corpapp/services/login/networking_logic.dart';
import 'package:corpapp/utilities/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({@required this.username, this.password});

  final String username;
  final String password;

  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLoginData();
  }

  void getLoginData() async {
    var loginData =
        await LoginModel(username: widget.username, password: widget.password)
            .getLoginInfo();
    basicData = loginData;
    Navigator.pop(context);

    //print(basicData['success']);
    //print(rememberMe);

    if (basicData.toString().substring(1, 6) != 'error') {
      // CREATE NEW USER AND PUSH IT AS GLOBAL LOGGED USER.
      User newUser = User(
        token: basicData['data']['_id'].toString(),
        personalCode: basicData['data']['PCode'].toString(),
        fName: basicData['data']['Fname'].toString(),
        lName: basicData['data']['Lname'].toString(),
        post: basicData['data']['Post'].toString(),
        nationalId: basicData['data']['Ncode'].toString(),
        phone: basicData['data']['phone'].toString(),
        globalToken: globalToken,
        rememberMe: rememberMe,
      );
      loggedUser = newUser;

      // SAVE THE LOGIN INFO ON THE DEVICE.
      if (newUser.rememberMe == true) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', loggedUser.token);
        prefs.setString('personalCode', loggedUser.personalCode);
        prefs.setString('fName', loggedUser.fName);
        prefs.setString('lName', loggedUser.lName);
        prefs.setString('post', loggedUser.post);
        prefs.setString('nationalId', loggedUser.nationalId);
        prefs.setString('phone', loggedUser.phone);
        prefs.setString('globalToken', loggedUser.globalToken);
        prefs.setBool('rememberMe', loggedUser.rememberMe);
      }
      Navigator.pop(context);
      Navigator.pushNamed(context, '/home');
    } else {
      basicData = null;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "نام کاربری یا رمز عبور اشتباه است",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade700,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
      Future.delayed(
        Duration(seconds: 1),
        () {},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF61A4F1),
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.blue.shade200,
          size: 100.0,
        ),
      ),
    );
  }
}
