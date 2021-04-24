import 'package:corpapp/utilities/global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class NetworkHelper {
  Future getData(String username, String password) async {
    final http.Response response = await http.post(
      'http://94.130.230.203:8585/auth/login/',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'PCode': username,
        'pass': password,
      },
    );
    if (response.statusCode == 200 && response.body.isNotEmpty) {
      String data = response.body;
      final http.Response dashbordResponse = await http.get(
        'http://94.130.230.203:8585/auth/dashboard/',
        headers: {
          'authorization': jsonDecode(data)['token'],
        },
      );
      globalToken = jsonDecode(data)['token'];
      String dashboardData = dashbordResponse.body;
      return jsonDecode(dashboardData);
    } else {
      print(jsonDecode(response.body).toString().substring(1, 6));
      print(response.statusCode);
      print(response.body);
      print("LOL DUMB!");
      return jsonDecode(response.body);
    }
  }
}
