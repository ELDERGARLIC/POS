import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:crypto/crypto.dart';

String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}

class NetworkHelper {
  Future getData(String username, String password) async {
    final http.Response response = await http.post(
      'https://zfif.ir/POS/login/',
      headers: {
        'Accept': 'application/json',
      },
      body: {
        'loginHash': generateMd5(username + password),
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
