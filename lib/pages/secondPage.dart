import 'dart:ui';

import 'package:dns_test/bloc/secondPageBloc.dart';
import 'package:dns_test/model/userModel.dart';
import 'package:dns_test/res/appColors.dart';
import 'package:dns_test/res/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final User _user;

  SecondPage(this._user);

  @override
  SecondPageState createState() => SecondPageState();
}

class SecondPageState extends State<SecondPage> {
  SecondPageBloc _bloc;

  @override
  initState() {
    _bloc = SecondPageBloc(widget._user);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.title2),
        centerTitle: false,
        backgroundColor: AppColors.orange,
        elevation: 5,
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: TextField(
              onChanged: (value) => _bloc.user.githubProfileUrl = value,
              decoration: InputDecoration(
                hintText: Strings.gitHub,
              ),
            ),
          ),
          ListTile(
            title: TextField(
              onChanged: (value) => _bloc.user.summary = value,
              decoration: InputDecoration(
                hintText: Strings.summary,
              ),
            ),
          ),
          Spacer(),
          RaisedButton(
            onPressed: () async {
              await _bloc.onTap();
            },
            color: AppColors.orange,
            textColor: Colors.white,
            child: StreamBuilder(
                stream: _bloc.watchLoading,
                builder: (context, snapshot) =>
                    (snapshot.hasData && snapshot.data != LoadingState.loading)
                        ? Text(
                            Strings.button2,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              fontStyle: FontStyle.normal,
                            ),
                          )
                        : CircularProgressIndicator()),
            elevation: 3,
          ),
          SizedBox(
            height: 45,
          ),
        ],
      ),
    );
  }
}
