import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:rainbowrenovations/login/rainbow_login.dart';

import 'dashboard.dart';

class RainbowSplashScreen extends StatefulWidget {
  @override
  _RainbowSplashScreenState createState() => _RainbowSplashScreenState();
}

class _RainbowSplashScreenState extends State<RainbowSplashScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  FirebaseUser user;

  @override
  void initState() {
    super.initState();
   // getCurrentUser();
  }

  void getCurrentUser() async{
    FirebaseUser _user = await _firebaseAuth.currentUser();

    setState(() {
      this.user = _user;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: user != null ? DashBoard(this.user):Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            //Login Page Header
            decoration: BoxDecoration(
              color: new Color(0xff622F74),
              gradient: LinearGradient(
                colors: [
                  Colors.deepPurple[500],
                  Colors.indigo[500],
                  Colors.blue[500],
                  Colors.green[500],
                  Colors.yellow[800],
                  Colors.orange[500],
                  Colors.red[500]
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: RainbowLogin(), //Brings login card on Splash Page.
          ),
        ],
      ),
    );
  }
}
