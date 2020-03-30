import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/userModel.dart';

class Api {
  static final String _url = 'https://vacancy.dns-shop.ru';

  static Future<String> getToken(User user) async {
    var _client = Client();
    final response = await _client.post(
      '$_url/api/candidate/token',
      headers: {'Content-type': 'application/json'},
      body: jsonEncode(
        {
          'firstName': user.firstName,
          'lastName': user.lastName,
          'phone': user.phoneNumber,
          'email': user.email,
        },
      ),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> tokenOutPut = jsonDecode(response.body);
      return jsonDecode(response.body)['data'];
    }
    return null;
  }

  static Future<String> getSummary(User user) async {
    var _client = Client();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final response = await _client.post(
      '$_url/api/candidate/summary',
      headers: {
        'Content-type': 'application/json',
        'authorization': 'Bearer ${prefs.getString('token')}',
      },
      body: jsonEncode(
        {
          'firstName': user.firstName,
          'lastName': user.lastName,
          'phone': user.phoneNumber,
          'email': user.email,
          'githubProfileUrl': user.githubProfileUrl,
          'summary': user.summary,
        },
      ),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> summaryOutPut = jsonDecode(response.body);
      return 'true';
    }
    return null;
  }

  static Future<String> getTestSummary(User user) async {
    var _client = Client();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final response = await _client.post(
      '$_url/api/candidate/test/summary',
      headers: {
        'Content-type': 'application/json',
        'authorization': 'Bearer ${prefs.getString('token')}',
      },
      body: jsonEncode(
        {
          'firstName': user.firstName,
          'lastName': user.lastName,
//        'patronymic': 'Олегович',
          'phone': user.phoneNumber,
          'email': user.email,
          'githubProfileUrl': user.githubProfileUrl,
          'summary': user.summary,
        },
      ),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> summaryTestOutPut = jsonDecode(response.body);
      return 'true';
    }
    return null;
  }
}
