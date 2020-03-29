import 'dart:ui';

import 'package:dns_test/bloc/secondPageBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final bloc = SecondPageBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Отправка данных'),
        centerTitle: false,
        backgroundColor: Color(0xffED8E00),
        elevation: 5,
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: TextField(
              onChanged: (value) => bloc.user.githubProfileUrl = value,
              decoration: InputDecoration(
                hintText: 'ссылка на github',
              ),
            ),
          ),
          ListTile(
            title: TextField(
              onChanged: (value) => bloc.user.summary = value,
              decoration: InputDecoration(
                hintText: 'ссылка на резюме',
              ),
            ),
          ),
          Spacer(),
          RaisedButton(
            onPressed: () async {
              var res = await bloc.onTap();
            },
            color: Color(0xffED8E00),
            textColor: Colors.white,
            child: Text(
              'ЗАРЕГИСТРИРОВАТЬСЯ',
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
