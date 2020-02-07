import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rainbowrenovations/login/login_page.dart';

import 'dashboard.dart';

class RainbowSplashScreen extends StatefulWidget {
  final Widget child;

  RainbowSplashScreen({Key key, this.child}) : super(key: key);

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
    return (user != null ? DashBoard() : LoginPage());
  }
}
