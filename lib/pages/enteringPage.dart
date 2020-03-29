import 'dart:ui';

import 'package:dns_test/bloc/enteringPageBloc.dart';
import 'package:flutter/material.dart';

import 'secondPage.dart';

class EnteringPage extends StatefulWidget {
  @override
  EnteringPageState createState() => EnteringPageState();
}

class EnteringPageState extends State<EnteringPage> {
  var bloc = EnteringPageBloc();

  Future _goToNextScreen(BuildContext context) async {
    await Navigator.of(context).push(MaterialPageRoute<Map<dynamic, dynamic>>(
        builder: (BuildContext context) {
      return SecondPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ввод данных'),
        centerTitle: false,
        backgroundColor: Color(0xffED8E00),
        elevation: 5,
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: TextField(
              onChanged: (value) => bloc.user.firstName = value,
              decoration: InputDecoration(
                hintText: 'Имя',
              ),
            ),
          ),
          ListTile(
            title: TextField(
              onChanged: (value) => bloc.user.lastName = value,
              decoration: InputDecoration(
                hintText: 'Фамилия',
              ),
            ),
          ),
          ListTile(
            title: TextField(
              onChanged: (value) => bloc.user.email = value,
              decoration: InputDecoration(
                hintText: 'e-mail',
              ),
            ),
          ),
          ListTile(
            title: TextField(
              onChanged: (value) => bloc.user.phoneNumber = value,
              decoration: InputDecoration(
                hintText: 'Телефон',
              ),
            ),
          ),
          Spacer(),
          RaisedButton(
            onPressed: () async {
              var res = await bloc.onTap();
              _goToNextScreen(context);
            },
            color: Color(0xffED8E00),
            textColor: Colors.white,
            child: Text(
              'ПОЛУЧИТЬ КЛЮЧ',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                fontStyle: FontStyle.normal,
              ),
            ),
            elevation: 3,
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
