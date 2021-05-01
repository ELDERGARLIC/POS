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
    String type,
    String start,
    String end,
    String successorPCode,
    String successorFname,
    String successorLname,
  ) async {
    final http.Response response = await http.post(
      'http://94.130.230.203:8585/official',
      headers: {
        'authorization': loggedUser.globalToken,
      },
      body: {
        'type': type,
        'successorFname': successorFname,
        'successorPCode': successorPCode,
        'successorLname': successorLname,
        'startdate': start,
        'enddate': end,
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

class MorekhasiModel {
  MorekhasiModel({
    @required this.type,
    @required this.successorPCode,
    @required this.successorFname,
    @required this.start,
    @required this.end,
    @required this.successorLname,
  });

  String type;
  String successorFname;
  String successorPCode;
  String successorLname;
  String start;
  String end;

  Future<dynamic> getMorekhasiInfo() async {
    NetworkHelper networkHelper = NetworkHelper();

    var recievedData = await networkHelper.getData(
      type,
      start,
      end,
      successorPCode,
      successorFname,
      successorLname,
    );
    return recievedData;
  }
}

Future<dynamic> getMorekhasiData(
  BuildContext context,
  String type,
  String start,
  String end,
  String successorPCode,
  String successorFname,
  String successorLname,
) async {
  Dialogs.showLoadingDialog(context, _keyLoader); //invoking login
  var omranData = await MorekhasiModel(
          type: type,
          successorFname: successorFname,
          successorPCode: successorPCode,
          end: end,
          start: start,
          successorLname: successorLname)
      .getMorekhasiInfo();
  print(omranData);
  Navigator.of(_keyLoader.currentContext, rootNavigator: true)
      .pop(); //close the dialoge

  if (omranData['successe'] == true) {
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
