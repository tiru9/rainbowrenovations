import 'package:flutter/material.dart';
import 'package:rainbowrenovations/pages/widgets/bottom_nav_defaultBtn.dart';
import 'package:rainbowrenovations/pages/widgets/bottom_nav_tappedBtn.dart';

class BottomNavBar extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

/* class CustomNavBar extends StatefulWidget {
  @override
  _CustomNavBarState createState() => _CustomNavBarState();
} */

class _CustomNavBarState extends State<BottomNavBar> {
  // SET ICONS HERE

  var icons1 = Icons.home;
  var icons2 = Icons.question_answer;
  var icons3 = Icons.shopping_cart;
  var icons4 = Icons.mail;

  //

  bool buttonPressed1 = false;
  bool buttonPressed2 = false;
  bool buttonPressed3 = false;
  bool buttonPressed4 = false;

  void _letsPress1() {
    setState(() {
      buttonPressed1 = true;
      buttonPressed2 = false;
      buttonPressed3 = false;
      buttonPressed4 = false;
    });
  }

  void _letsPress2() {
    setState(() {
      buttonPressed1 = false;
      buttonPressed2 = true;
      buttonPressed3 = false;
      buttonPressed4 = false;
    });
  }

  void _letsPress3() {
    setState(() {
      buttonPressed1 = false;
      buttonPressed2 = false;
      buttonPressed3 = true;
      buttonPressed4 = false;
    });
  }

  void _letsPress4() {
    setState(() {
      buttonPressed1 = false;
      buttonPressed2 = false;
      buttonPressed3 = false;
      buttonPressed4 = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: Color.fromRGBO(242, 243, 250, 1),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                    // FIRST BUTTON
                    onTap: _letsPress1,
                    child: buttonPressed1
                        ? BottomNavTappedButton(
                            icon: icons1,
                          )
                        : DefaultBottomNavButton(
                            icon: icons1,
                          )),
              ),
              Expanded(
                child: GestureDetector(
                    // SECOND BUTTON
                    onTap: _letsPress2,
                    child: buttonPressed2
                        ? BottomNavTappedButton(
                            icon: icons2,
                          )
                        : DefaultBottomNavButton(
                            icon: icons2,
                          )),
              ),
              Expanded(
                child: GestureDetector(
                    // THIRD BUTTON
                    onTap: _letsPress3,
                    child: buttonPressed3
                        ? BottomNavTappedButton(
                            icon: icons3,
                          )
                        : DefaultBottomNavButton(
                            icon: icons3,
                          )),
              ),
              Expanded(
                child: GestureDetector(
                    // FOURTH BUTTON
                    onTap: _letsPress4,
                    child: buttonPressed4
                        ? BottomNavTappedButton(
                            icon: icons4,
                          )
                        : DefaultBottomNavButton(
                            icon: icons4,
                          )),
              ),
            ],
          ),
        ));
  }
}
