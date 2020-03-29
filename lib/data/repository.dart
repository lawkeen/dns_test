import 'package:shared_preferences/shared_preferences.dart';

import '../model/userModel.dart';
import 'api.dart';

class Repository {
  Future<String> loadToken(User user) async {
    var token = await Api.getToken(user);

    if (token != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      return 'true';
    }
    return 'false';
  }

  Future<String> register(User user) async {
    var token = await Api.getSummary(user);

    if (token != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      return 'true';
    }
    return 'false';
  }
}
