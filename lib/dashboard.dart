import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  FirebaseUser _user;
  DashBoard(this._user);
  @override
  _DashBoardState createState() => _DashBoardState(_user);
}

class _DashBoardState extends State<DashBoard> {
  FirebaseUser currentUser;
_DashBoardState(this.currentUser);
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            child: Text('user : $this.currentUser.toString()'),
          ),
        ],
      ),
    );
  }
}
