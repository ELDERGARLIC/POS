import 'package:corpapp/utilities/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class NetworkHelper {
  Future getData() async {
    final http.Response response = await http.get(
      'http://94.130.230.203:8585‫‪/user/Message‬‬',
      headers: {
        'authorization': loggedUser.globalToken,
      },
    );
    String dashboardData = response.body;
    return jsonDecode(dashboardData);
  }
}

class OmranModel {
  OmranModel();

  Future<dynamic> getOmranInfo() async {
    NetworkHelper networkHelper = NetworkHelper();

    var recievedData = await networkHelper.getData();
    return recievedData;
  }
}

Future<dynamic> getOmranData() async {
  var omranData = await OmranModel().getOmranInfo();
  print(omranData);
}

class TestAPI extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<TestAPI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TEST GROUND BLYAAAAT!!'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () async {
                      getOmranData();
                    },
                    child: Text('TEST'),
                  ),
                ],
              ),
            )
            // Expanded(child: ShowCalender())
          ],
        ),
      ),
    );
  }
}
