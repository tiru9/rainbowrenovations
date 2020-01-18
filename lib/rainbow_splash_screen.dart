import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rainbowrenovations/login/login_page.dart';

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

  void getCurrentUser() async {
    FirebaseUser _user = await _firebaseAuth.currentUser();

    setState(() {
      this.user = _user;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(body: user != null ? DashBoard(this.user) : _body());
  }

  _body() {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          //fit: StackFit.expand,
          children: <Widget>[
            Container(
              //Login Page Header
              decoration: BoxDecoration(
                color: new Color(0xff622F74),
                gradient: LinearGradient(
                  stops: [0.1, 0.4, 0.6, 0.9],
                  colors: [
                    Colors.yellow,
                    Colors.red,
                    Colors.indigo,
                    Colors.teal
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
              //child: RainbowLogin(), //Brings login card on Splash Page.
              child: LoginPage(),
            ),
          ],
        ),
      ),
    );
  }
}
