import 'package:corpapp/services/logout/networking.dart';

class LogOutModel {
  Future<dynamic> getLoginInfo() async {
    NetworkHelper networkHelper = NetworkHelper();

    var curData = await networkHelper.doExit();
    return curData;
  }
}
