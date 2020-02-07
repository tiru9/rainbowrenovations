import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  var icon;
  var title;

  ServiceCard({
    Key key,
    this.icon,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 65,
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        //shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(225, 227, 239, 1),
            offset: Offset(9, 9),
            blurRadius: 3,
          ),
          BoxShadow(
            color: Color.fromRGBO(254, 255, 255, 1),
            offset: Offset(-6, -6),
            blurRadius: 5,
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [
            Color.fromRGBO(231, 237, 249, 1),
            Color.fromRGBO(242, 250, 255, 1),
            Color.fromRGBO(242, 250, 255, 1),
            Color.fromRGBO(242, 250, 255, 1),
          ],
          stops: [0.1, 0.2, 0.3, 1],
        ),
      ),
      child: Container(
        height: 68,
        width: 68,
        //padding: EdgeInsets.all(3),
        child: Icon(icon, size: 30, color: Colors.grey[700]),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          //shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(231, 237, 249, 1),
              Color.fromRGBO(229, 238, 244, 1),
              Color.fromRGBO(212, 220, 231, 1),
              Color.fromRGBO(229, 238, 244, 1),
            ],
            stops: [0.1, 0.4, 0.6, 0.9],
          ),
        ),
      ),
    );
  }
}
