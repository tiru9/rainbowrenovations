import 'package:flutter/material.dart';
import 'package:rainbowrenovations/login/rainbow_email_phone_wid.dart';

class RainbowLoginCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RainbowLoginCardState();
  }
}

class _RainbowLoginCardState extends State<RainbowLoginCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 10.0,
        right: 10.0,
        bottom: 10.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white38,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(80),
          topRight: Radius.circular(80),
          bottomLeft: Radius.circular(80),
          bottomRight: Radius.circular(80),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 60,
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(200, 95, 27, 3),
                    blurRadius: 50,
                    offset: Offset(10, 10),
                  )
                ],
              ),
              child:
                  RainbowEmailOrPhoneWidget(), //Brings email or phone along with button
            )
          ],
        ),
      ),
    );
  }
}
