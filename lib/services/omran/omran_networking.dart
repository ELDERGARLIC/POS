import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:corpapp/utilities/global.dart';

final GlobalKey<State> _keyLoader = new GlobalKey<State>();

class NetworkHelper {
  Future getData(
    String moredeDarkhasti,
    String darkhastKonande,
    String sharh,
    String pishnahad,
  ) async {
    Map<String, String> data = {
      "task": "add",
      "token": loggedUser.token,
      "morede_darkhasti": moredeDarkhasti,
      "darkhast_konande": darkhastKonande,
      "sharh": sharh,
      "pishnahad": pishnahad
    };
    var body = json.encode(data);

    final http.Response response = await http.post(
      'https://zfif.ir/POS/DAO/',
      headers: {},
      body: {
        "DAOREQ": body,
      },
    );
    if (response.statusCode == 200 && response.body.isNotEmpty) {
      String data = response.body;
      print(response.body);
      return jsonDecode(data);
    } else {
      print(jsonDecode(body)['DAOREQ']);
      print(response.statusCode);
      print(response.body);
      print("LOL DUMB!");
    }
  }
}

class OmranModel {
  OmranModel({
    @required this.moredeDarkhasti,
    @required this.darkhastKonande,
    @required this.pishnahad,
    @required this.sharh,
  });

  String moredeDarkhasti;
  String darkhastKonande;
  String sharh;
  String pishnahad;

  Future<dynamic> getOmranInfo() async {
    NetworkHelper networkHelper = NetworkHelper();

    var recievedData = await networkHelper.getData(
      moredeDarkhasti,
      darkhastKonande,
      sharh,
      pishnahad,
    );
    return recievedData;
  }
}

Future<dynamic> getOmranData(
  BuildContext context,
  String moredeDarkhasti,
  String darkhastKonande,
  String sharh,
  String pishnahad,
) async {
  Dialogs.showLoadingDialog(context, _keyLoader); //invoking login
  var omranData = await OmranModel(
    moredeDarkhasti: moredeDarkhasti,
    darkhastKonande: darkhastKonande,
    sharh: sharh,
    pishnahad: pishnahad,
  ).getOmranInfo();
  print(omranData);
  Navigator.of(_keyLoader.currentContext, rootNavigator: true)
      .pop(); //close the dialoge

  if (omranData['success'] == '1') {
    showAlertDialog(context, true);
  } else {
    showAlertDialog(context, false);
  }
}

class Dialogs {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return new WillPopScope(
          onWillPop: () async => false,
          child: SimpleDialog(
            key: key,
            backgroundColor: Colors.white,
            children: <Widget>[
              Center(
                child: Column(
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "...لطفا کمی صبر کنید",
                      style: TextStyle(color: Colors.blueAccent),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

showAlertDialog(BuildContext context, bool condition) {
  Text title;

  if (condition) {
    title = Text(
      'عملیات موفق',
      textDirection: TextDirection.rtl,
      style: TextStyle(
        color: Colors.green.shade300,
        fontWeight: FontWeight.bold,
      ),
    );
  } else {
    title = Text(
      'عملیات ناموفق',
      textDirection: TextDirection.rtl,
      style: TextStyle(
        color: Colors.red.shade300,
        fontWeight: FontWeight.bold,
      ),
    );
  }
  // set up the button
  Widget okButton = FlatButton(
    child: Text(
      "بازگشت",
    ),
    onPressed: () {
      Navigator.popUntil(
        context,
        ModalRoute.withName('/'),
      );
      Navigator.pushNamed(context, '/home');
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: title,
    actions: [
      okButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
