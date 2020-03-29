import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/userModel.dart';

class Api {
  static final String _url = 'https://vacancy.dns-shop.ru';

  static Future<String> getToken(User user) async {
    var client = Client();
    final response = await client.post(
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

    print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      final Map<String, dynamic> tokenOutPut = jsonDecode(response.body);
      return jsonDecode(response.body)['data'];
    }
    return null;
  }

  static Future<String> getSummary(User user) async {
    var client = Client();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final response = await client.post(
      '$_url/api/candidate/summary',
      headers: {
        'Content-type': 'application/json',
        'authorization': '$prefs',
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
      print(jsonDecode(response.body));
      return 'true';
    }
    return null;
  }

  static Future<String> getTestSummary(User user) async {
    var client = Client();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final response = await client.post(
      '$_url/api/candidate/summary',
      headers: {
        'conten-type': '/application/json',
        'authorization': '$prefs',
      },
      body: jsonEncode(
        {
          'firstName': user.firstName,
          'lastName': user.lastName,
          'patronymic': 'patronymic',
          'phone': user.phoneNumber,
          'email': user.email,
          'githubProfileUrl': user.githubProfileUrl,
          'summary': user.summary,
        },
      ),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> summaryTestOutPut = jsonDecode(response.body);
    } else
      return 'Warning!';
  }
}
