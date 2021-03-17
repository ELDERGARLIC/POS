import 'package:corpapp/services/login/networking.dart';
import 'package:flutter/cupertino.dart';

class LoginModel {
  LoginModel({@required this.username, @required this.password});

  String username;
  String password;

  Future<dynamic> getLoginInfo() async {
    NetworkHelper networkHelper = NetworkHelper();

    var curData = await networkHelper.getData(username, password);
    return curData;
  }
}
