import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:corpapp/services/logout/networking_logic.dart';
import 'package:corpapp/utilities/global.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    doLogOut();
  }

  void doLogOut() async {
    var loginData = await LogOutModel().getLoginInfo();
    basicData = loginData;
    Navigator.pop(context);
    print(basicData['success']);
    if (basicData['success'] == '1') {
      Navigator.pushNamed(context, '/login');
      basicData = null;
    } else {
      Navigator.pushNamed(context, '/login');
      print('some sort of logout error!');
      basicData = null;
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
