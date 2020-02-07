import 'package:flutter/material.dart';

class BottomNavTappedButton extends StatelessWidget {
  var icon;

  BottomNavTappedButton({
    Key key,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(7),
      child: Container(
        padding: EdgeInsets.all(3),
        child: Container(
          padding: EdgeInsets.all(5),
          child: Icon(icon, size: 37, color: Colors.blue //grey[700],
              ),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[600],
              boxShadow: [
                BoxShadow(
                    color: Colors.white,
                    offset: Offset(4.0, 4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0),
                BoxShadow(
                color: Color.fromRGBO(254, 255, 255, 1),
                offset: Offset(-5, -5),
                blurRadius: 5,
              ),
              ],
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.grey.shade200,
                    Colors.grey.shade200,
                    Colors.grey.shade200,
                    Colors.grey.shade200,
                  ],
                  stops: [
                    0,
                    0.1,
                    0.3,
                    1
                  ])),
        ),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[300],
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(225, 227, 239, 1),
                offset: Offset(9, 9),
                blurRadius: 3,
              ),
              BoxShadow(
                color: Color.fromRGBO(254, 255, 255, 1),
                offset: Offset(-3, -3),
                blurRadius: 5,
              ),
            ],
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.grey[400],
                  Colors.grey[400],
                ],
                stops: [
                  0.1,
                  0.3,
                ])),
      ),
    );
  }
}
