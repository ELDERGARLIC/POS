import 'package:corpapp/utilities/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:corpapp/utilities/constants.dart';

class TestAPI extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<TestAPI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
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
                      final http.Response anbarResponse = await http.post(
                        'http://94.130.230.203:8585/user/Messages',
                        headers: {
                          'authorization': loggedUser.globalToken,
                        },
                      );
                      List<dynamic> calledSilosJson =
                          jsonDecode(anbarResponse.body);
                      print(calledSilosJson);
                      print(loggedUser.globalToken);
                    },
                    child: Text('Test'),
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
