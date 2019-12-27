import 'package:flutter/material.dart';
import 'rainbow_splash_screen.dart';

void main() => runApp(MaterialApp(
      title: 'Welcome Rainbow Renovations',
      theme: ThemeData(
          primaryColor: new Color(0xff622f74), accentColor: Colors.orange),
      home: RainbowSplashScreen(),
    ));
