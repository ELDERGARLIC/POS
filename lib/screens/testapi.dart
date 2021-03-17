import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:crypto/crypto.dart';

String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}

Future createLoginState(String username, String password) async {
  final http.Response response = await http.post(
    'http://zfif.ir/POS/login/',
    headers: <String, String>{
      'Accept': 'application/json',
    },
    body: {
      'loginHash': generateMd5(username + password),
    },
  );

  if (response.statusCode == 200) {
    print(response.body);
  } else {
    throw Exception('Failed to create album.');
  }
}

class TestAPI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              GestureDetector(
                onTap: () {
                  print("LMAO");
                  createLoginState("4124", "0059986107");
                },
                child: Container(
                  color: Colors.green,
                  child: Text("TEST"),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print("GO TO TEST MAN");
                  Navigator.pushNamed(context, "/omran");
                },
                child: Container(
                  color: Colors.red,
                  child: Text("GO TO TEST MAN"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
