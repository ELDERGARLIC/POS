import 'package:corpapp/utilities/global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class NetworkHelper {
  Future doExit() async {
    final http.Response response = await http.post(
      'http://zfif.ir/POS/logout/',
      headers: {
        'Accept': 'application/json',
      },
      body: {
        'token': basicData['token'],
      },
    );
    if (response.statusCode == 200) {
      String data = response.body;
      print(response.body);
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
