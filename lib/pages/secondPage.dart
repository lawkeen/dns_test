import 'dart:ui';
import 'package:dns_test/data/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  static final gitFieldController = new TextEditingController();
  static final summaryFieldController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Отправка данных'),
        centerTitle: false,
        backgroundColor: Color(0xffED8E00),
        elevation: 5,
      ),
      body: new Column(
        children: <Widget>[
          new ListTile(
            title: new TextField(
              decoration: new InputDecoration(
                hintText: 'ссылка на github',
              ),
              controller: gitFieldController,
            ),
          ),
          new ListTile(
            title: new TextField(
              decoration: new InputDecoration(
                hintText: 'ссылка на резюме',
              ),
              controller: summaryFieldController,
            ),
          ),
          Spacer(),
          new RaisedButton(
            onPressed: () {
              Navigator.pop(context, {
                'github': gitFieldController.text,
                'summary': summaryFieldController.text,
              });
              Api.getTestSummary();
              print('Vse ok!');
            },
            color: Color(0xffED8E00),
            textColor: Colors.white,
            child: new Text(
              'ЗАРЕГИСТРИРОВАТЬСЯ',
              style: new TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                fontStyle: FontStyle.normal,
              ),
            ),
            elevation: 3,
          ),
          new SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
