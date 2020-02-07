
import 'package:flutter/material.dart';


class IPhoneXXS11Pro1Widget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 88,
              height: 90,
              margin: EdgeInsets.only(left: 93, top: 214),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 88,
                      height: 90,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(106, 0, 0, 0),
                            offset: Offset(5, 6),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Image.asset(
                        "assets/images/ellipse-1-3.png",
                        fit: BoxFit.none,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 88,
                      height: 90,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(106, 0, 0, 0),
                            offset: Offset(5, 6),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Image.asset(
                        "assets/images/ellipse-1-3.png",
                        fit: BoxFit.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 258,
              height: 348,
              margin: EdgeInsets.only(left: 35, top: 15),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 8,
                    top: 0,
                    child: Container(
                      width: 250,
                      height: 348,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(106, 0, 0, 0),
                            offset: Offset(9, 9),
                            blurRadius: 9,
                          ),
                        ],
                      ),
                      child: Image.asset(
                        "assets/images/ellipse-2-2.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 104,
                    child: Container(
                      width: 102,
                      height: 183,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        border: Border.all(
                          width: 1,
                          color: Color.fromARGB(255, 112, 112, 112),
                        ),
                      ),
                      child: Container(),
                    ),
                  ),
                  Positioned(
                    left: 15,
                    top: 116,
                    child: Container(
                      width: 76,
                      height: 162,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        border: Border.all(
                          width: 1,
                          color: Color.fromARGB(255, 112, 112, 112),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(217, 0, 0, 0),
                            offset: Offset(5, 5),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Container(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}