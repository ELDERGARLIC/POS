import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:corpapp/utilities/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:corpapp/screens/liste_darkhast/liste_darkhast_page.dart';
import 'package:corpapp/services/liste_darkhast/liste_darkhast_networking.dart';

final GlobalKey<State> _keyLoader = new GlobalKey<State>();

class NetworkHelper {
  Future getData(String state, String id) async {
    Map<String, String> data = {
      "task": "changeState",
      "token": loggedUser.token,
      "DAOId": id,
      "newState": state,
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
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}

class ChangeStateModel {
  ChangeStateModel();

  Future<dynamic> getChangeStateInfo(String state, String id) async {
    NetworkHelper networkHelper = NetworkHelper();

    var recievedData = await networkHelper.getData(state, id);
    return recievedData;
  }
}

Future<dynamic> getChangeState(
    BuildContext context, String state, String id) async {
  Dialogs.showLoadingDialog(context, _keyLoader); //invoking login
  var listeDarkhast = await ChangeStateModel().getChangeStateInfo(state, id);
  print(listeDarkhast);
  Navigator.of(_keyLoader.currentContext, rootNavigator: true)
      .pop(); //close the dialoge
  Navigator.of(context).pop();
  getListeDarkhast(context).whenComplete(() => Navigator.pop(context));
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
