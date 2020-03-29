import 'package:dns_test/bloc/updateModel.dart';
import 'package:dns_test/data/api.dart';
import 'package:dns_test/model/dataModel.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'secondPage.dart';

class EnteringPage extends StatefulWidget {
  @override
  EnteringPageState createState() => EnteringPageState();
}

class EnteringPageState extends State<EnteringPage> {
  static final firstNameFieldController = new TextEditingController();
  static final secondNameFieldController = new TextEditingController();
  static final emailFieldController = new TextEditingController();
  static final phoneNumberFieldController = new TextEditingController();

  Future _goToNextScreen(BuildContext context) async {
    await Navigator.of(context).push(
        new MaterialPageRoute<Map<dynamic, dynamic>>(
            builder: (BuildContext context) {
      return new SecondScreen();
    }));
  }

  void toKnow() => print(Data.toMap);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Ввод данных'),
        centerTitle: false,
        backgroundColor: Color(0xffED8E00),
        elevation: 5,
      ),
      body: new Column(
        children: <Widget>[
          new ListTile(
            title: new TextField(
              decoration: new InputDecoration(
                hintText: 'Имя',
              ),
              controller: firstNameFieldController,
            ),
          ),
          new ListTile(
            title: new TextField(
              decoration: new InputDecoration(
                hintText: 'Фамилия',
              ),
              controller: secondNameFieldController,
            ),
          ),
          new ListTile(
            title: new TextField(
              decoration: new InputDecoration(
                hintText: 'e-mail',
              ),
              controller: emailFieldController,
            ),
          ),
          new ListTile(
            title: new TextField(
              decoration: new InputDecoration(
                hintText: 'Телефон',
              ),
              controller: phoneNumberFieldController,
            ),
          ),
          Spacer(),
          new RaisedButton(
            onPressed: () {
              Api.getToken();
              DataBloc.update();
              toKnow();
              _goToNextScreen(context);
            },
            color: Color(0xffED8E00),
            textColor: Colors.white,
            child: new Text(
              'ПОЛУЧИТЬ КЛЮЧ',
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
