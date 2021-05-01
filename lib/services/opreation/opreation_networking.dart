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
    String title,
    String shipcontent,
    String shipname,
    String tonnage,
    String baskol,
    String resourcetype,
    String resourcename,
    String resourcepart,
    String vehicleids,
    String humans,
  ) async {
    final http.Response response = await http.post(
      'http://94.130.230.203:8585/operation',
      headers: {
        'authorization': loggedUser.globalToken,
      },
      body: {
        'title': title,
        'shipcontent': shipcontent,
        'shipname': shipname,
        'tonnage': tonnage,
        'baskol': baskol,
        'resourcetype': resourcetype,
        'resourcename': resourcename,
        'resourcepart': resourcepart,
        'vehicleids': vehicleids,
        'humans': humans,
      },
    );
    if (response.statusCode == 200 && response.body.isNotEmpty) {
      String data = response.body;
      print(response.body);
      return jsonDecode(data);
    } else {
      print(response.statusCode);
      print(response.body);
      print("LOL DUMB!");
    }
  }
}

class AmaliyatModel {
  AmaliyatModel({
    @required this.title,
    @required this.shipcontent,
    @required this.shipname,
    @required this.tonnage,
    @required this.baskol,
    @required this.resourcetype,
    @required this.resourcename,
    @required this.resourcepart,
    @required this.vehicleids,
    @required this.humans,
  });

  String title;
  String shipcontent;
  String shipname;
  String tonnage;
  String baskol;
  String resourcetype;
  String resourcename;
  String resourcepart;
  String vehicleids;
  String humans;

  Future<dynamic> getAmaliyatInfo() async {
    NetworkHelper networkHelper = NetworkHelper();

    var recievedData = await networkHelper.getData(
      title,
      shipcontent,
      shipname,
      tonnage,
      baskol,
      resourcetype,
      resourcename,
      resourcepart,
      vehicleids,
      humans,
    );
    return recievedData;
  }
}

Future<dynamic> getAmaliyatData(
  BuildContext context,
  String title,
  String shipcontent,
  String shipname,
  String tonnage,
  String baskol,
  String resourcetype,
  String resourcename,
  String resourcepart,
  String vehicleids,
  String humans,
) async {
  Dialogs.showLoadingDialog(context, _keyLoader); //invoking login
  var amaliyatData = await AmaliyatModel(
    title: title,
    shipcontent: shipcontent,
    shipname: shipname,
    tonnage: tonnage,
    baskol: baskol,
    resourcetype: resourcetype,
    resourcename: resourcename,
    resourcepart: resourcepart,
    vehicleids: vehicleids,
    humans: humans,
  ).getAmaliyatInfo();
  print(amaliyatData);
  Navigator.of(_keyLoader.currentContext, rootNavigator: true)
      .pop(); //close the dialoge

  if (amaliyatData['successe'] == true) {
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
