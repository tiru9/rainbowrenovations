import 'package:flutter/material.dart';
import 'package:rainbowrenovations/login/rainbow_login_card.dart';

class RainbowLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RainbowLoginState();
  }
}

class _RainbowLoginState extends State<RainbowLogin> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Hey Welcome!",
                  style: TextStyle(color: Colors.white70, fontSize: 30)),
              SizedBox(height: 10),
              Text("Please Signup/Login",
                  style: TextStyle(color: Colors.white54, fontSize: 18)),
            ],
          ),
        ),
        Expanded(
          child: RainbowLoginCard(),
        ),
      ],
    );
  }
}
