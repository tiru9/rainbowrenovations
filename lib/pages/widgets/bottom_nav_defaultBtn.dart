import 'dart:io';

import 'package:flutter/material.dart';

class DefaultBottomNavButton extends StatelessWidget {
  var icon;

  DefaultBottomNavButton({
    Key key,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: Container(
        height: Platform.isAndroid ? 50 : 60,
        padding: EdgeInsets.all(5),
        child: Icon(
          icon,
          size: 30,
          color: Colors.redAccent,
        ),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[50],
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.180),
                offset: Offset(5, 5),
                blurRadius: 5,
              ),
              BoxShadow(
                color: Colors.white,
                offset: Offset(-7, -7),
                blurRadius: 5,
              ),
            ],
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.grey,
                  Colors.grey.shade400,
                  Colors.white24,
                  Colors.white54,
                ],
                stops: [
                  0.1,
                  0.3,
                  0.8,
                  1
                ])),
      ),
    );
  }
}
