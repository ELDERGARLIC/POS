import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:corpapp/utilities/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:corpapp/screens/liste_darkhast/liste_darkhast_page.dart';

final GlobalKey<State> _keyLoader = new GlobalKey<State>();

class NetworkHelper {
  Future getData() async {
    Map<String, String> data = {
      "task": "getList",
      "token": loggedUser.token,
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

class ListeDarkhastModel {
  ListeDarkhastModel();

  Future<dynamic> getListeDarkhastInfo() async {
    NetworkHelper networkHelper = NetworkHelper();

    var recievedData = await networkHelper.getData();
    return recievedData;
  }
}

Future<dynamic> getListeDarkhast(BuildContext context) async {
  Dialogs.showLoadingDialog(context, _keyLoader); //invoking login
  var listeDarkhast = await ListeDarkhastModel().getListeDarkhastInfo();
  print(listeDarkhast);
  Navigator.of(_keyLoader.currentContext, rootNavigator: true)
      .pop(); //close the dialoge
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ListeDarkhastPage(listeDarkhast: listeDarkhast),
    ),
  );
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
