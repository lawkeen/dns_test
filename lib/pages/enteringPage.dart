import 'dart:ui';

import 'package:dns_test/bloc/enteringPageBloc.dart';
import 'package:dns_test/res/appColors.dart';
import 'package:flutter/material.dart';

import '../res/strings.dart';
import 'secondPage.dart';

class EnteringPage extends StatefulWidget {
  @override
  EnteringPageState createState() => EnteringPageState();
}

class EnteringPageState extends State<EnteringPage> {
  var _bloc = EnteringPageBloc();

  Future _goToNextScreen(BuildContext context) async {
    await Navigator.of(context).push(MaterialPageRoute<Map<dynamic, dynamic>>(
        builder: (BuildContext context) {
      return SecondPage(_bloc.user);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.title1),
        centerTitle: false,
        backgroundColor: AppColors.orange,
        elevation: 5,
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: TextField(
              onChanged: (value) => _bloc.user.firstName = value,
              decoration: InputDecoration(
                hintText: Strings.firstName,
              ),
            ),
          ),
          ListTile(
            title: TextField(
              onChanged: (value) => _bloc.user.lastName = value,
              decoration: InputDecoration(
                hintText: Strings.lastName,
              ),
            ),
          ),
          ListTile(
            title: TextField(
              onChanged: (value) => _bloc.user.email = value,
              decoration: InputDecoration(
                hintText: Strings.email,
              ),
            ),
          ),
          ListTile(
            title: TextField(
              onChanged: (value) => _bloc.user.phoneNumber = value,
              decoration: InputDecoration(
                hintText: Strings.phoneNumber,
              ),
            ),
          ),
          Spacer(),
          RaisedButton(
            onPressed: () async {
              await _bloc.onTap();
              _goToNextScreen(context);
            },
            color: AppColors.orange,
            textColor: Colors.white,
            child: StreamBuilder<LoadingState>(
              stream: _bloc.watchLoading,
              builder: (context, snapshot) =>
              (snapshot.hasData && snapshot.data != LoadingState.loading)
                  ? Text(
                Strings.button1,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                ),
              )
                  : CircularProgressIndicator(),
            ),
            elevation: 3,
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
