import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../model/dataModel.dart';

class Api {
  static final String _url = 'https://vacancy.dns-shop.ru';

  static Future<String> getToken() async {
    var client = Client();

    final response = await client.post('$_url/api/candidate/token', body: {
      'firstName': Data.firstName,
      'secondName': Data.secondName,
      'phone': Data.phoneNumber,
      'email': Data.email,
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> tokenOutPut = jsonDecode(response.body);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', jsonDecode(response.body)['token']);
    }
    return 'Everything is fine!';
  }

  static Future<String> getSummary() async {
    var client = Client();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final response = await client.post(
      '$_url/api/candidate/summary',
      headers: {
        'conten-type': '$_url/application/json',
        'authorization': '$prefs',
      },
      body: {
        'firstName': Data.firstName,
        'secondName': Data.secondName,
        'phone': Data.phoneNumber,
        'email': Data.email,
        'githubProfileUrl': Data.githubProfileUrl,
        'summary': Data.summary,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> summaryOutPut = jsonDecode(response.body);
    }
    return 'Vse ok!';
  }

  static Future<String> getTestSummary() async {
    var client = Client();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final response = await client.post(
      '$_url/api/candidate/summary',
      headers: {
        'conten-type': '$_url/application/json',
        'authorization': '$prefs',
      },
      body: {
        'firstName': Data.firstName,
        'secondName': Data.secondName,
        'patronymic' : 'patronymic',
        'phone': Data.phoneNumber,
        'email': Data.email,
        'githubProfileUrl': Data.githubProfileUrl,
        'summary': Data.summary,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> summaryTestOutPut = jsonDecode(response.body);
    }
    return 'Test is ok!';
  }
}
