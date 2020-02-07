import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:rainbowrenovations/login/login_page.dart';
import 'package:rainbowrenovations/pages/widgets/bottom_nav_bar.dart';
import 'package:rainbowrenovations/pages/widgets/bottom_nav_tappedBtn.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:rainbowrenovations/pages/widgets/dashboard_service_card.dart';

class DashBoard extends StatefulWidget {
  //FirebaseUser _user;

  String userName;
  String userMobile;
  String userEmail;

  DashBoard({Key key, this.userName, this.userMobile, this.userEmail})
      : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  CarouselSlider carouselSlider;
  double profileVertPadding = Platform.isAndroid ? 50 : 60;
  int _current = 0;
  List imgList = [
    'https://picsum.photos/seed/picsum/200/300',
    'https://picsum.photos/200/300?grayscale',
    'https://picsum.photos/200/300/?blur=1',
    'https://picsum.photos/seed/picsum/200/300',
    'https://picsum.photos/id/237/200/300',
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  final Shader textGradient = LinearGradient(
    colors: <Color>[Colors.purple, Colors.indigo, Colors.pink],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  //FirebaseUser currentUser;
  //_DashBoardState(this.currentUser);
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.8;
    return new Scaffold(
      //backgroundColor: Colors.white,
      //grey.shade200, //grey.shade100,//teal.shade100,
      body: new Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  child: Container(
                    height: 75,
                    margin: const EdgeInsets.symmetric(vertical: 25),
                    padding: EdgeInsets.only(left: 20),
                    child: BottomNavTappedButton(
                      icon: Icons.list,
                    ),
                  ),
                ),
                Align(
                  child: Container(
                    height: 75,
                    margin: const EdgeInsets.symmetric(vertical: 25.0),
                    padding: EdgeInsets.only(right: 20),
                    child: BottomNavTappedButton(icon: Icons.account_circle),
                  ),
                ),
              ],
            ),
            Row(children: [
              Container(
                  alignment: Alignment(0.0, 0.0),
                  width: 80.00,
                  height: 70.00,
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: ExactAssetImage('assets/images/rhr1.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  )),
              Expanded(
                child: Text(
                  "Rainbow Renovations",
                  style: new TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ]),
            /* Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsetsDirectional.only(top: 25),
                      height: 180.0,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60),
                          bottomLeft: Radius.circular(60),
                          bottomRight: Radius.circular(60),
                        ),
                        //color: Colors.white10,
                      ),
                      child: carouselSlider = CarouselSlider(
                        height: 200.0,
                        initialPage: 0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        //reverse: true,
                        enableInfiniteScroll: true,
                        autoPlayInterval: Duration(seconds: 2),
                        autoPlayAnimationDuration: Duration(milliseconds: 2000),
                        pauseAutoPlayOnTouch: Duration(seconds: 10),
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index) {
                          setState(() {
                            _current = index;
                          });
                        },
                        items: imgList.map((imgUrl) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                margin: EdgeInsets.all(5),
                                child: Container(
                                  width: 290,
                                  height: 190,
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        offset: Offset(15, 15),
                                        blurRadius: 15,
                                      ),
                                      BoxShadow(
                                        color: Colors.white,
                                        offset: Offset(-7, -7),
                                        blurRadius: 5,
                                      ),
                                    ],
                                    color: Colors.white,
                                  ),
                                  child: new ClipRRect(
                                    borderRadius:
                                        new BorderRadius.circular(15.0),
                                    child: Image.network(
                                      imgUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  color: Colors.grey[200],
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.500),
                                        offset: Offset(7.0, 7.0),
                                        blurRadius: 5.0,
                                        spreadRadius: 1.0),
                                    BoxShadow(
                                        color: Colors.white.withOpacity(0.500),
                                        offset: Offset(-10.0, -10.0),
                                        blurRadius: 10.0,
                                        spreadRadius: 1.0),
                                  ],
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ],
            ), 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(imgList, (index, url) {
                return Container(
                  width: 7.0,
                  height: 7.0,
                  margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index ? Colors.blue : Colors.red,
                  ),
                );
              }),
            ),*/
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                      //color: Colors.lime.shade100,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Container(
                      width: c_width,
                      height: 135,

                      child: Column(
                        children: <Widget>[
                          ServiceCard(icon: Icons.pan_tool, title: 'Painting'),
                          Container(
                            color: Color.fromRGBO(236, 239, 244, 1),
                            margin: EdgeInsets.only(top: 6),
                            child: GradientText(
                              "Painting Container",
                              gradient: LinearGradient(colors: [
                                Colors.black,
                                Colors.black,
                              ]),
                              style: TextStyle(
                                fontSize: 13,
                                //fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      // onPressed: () {},
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                      //color: Colors.teal.shade50,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Container(
                      width: c_width,
                      height: 135,
                      child: Column(
                        children: <Widget>[
                          ServiceCard(
                              icon: Icons.add_to_home_screen,
                              title: 'Painting'),
                          Container(
                            color: Color.fromRGBO(236, 239, 244, 1),
                            margin: EdgeInsets.only(top: 6),
                            child: GradientText("New Construction",
                                gradient: LinearGradient(colors: [
                                  Colors.black,
                                  Colors.black,
                                ]),
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center),
                          ),
                        ],
                      ),
                      // onPressed: () {},
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                      //color: Colors.teal.shade50,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Container(
                      width: c_width,
                      height: 135,
                      child: Column(
                        children: <Widget>[
                          ServiceCard(icon: Icons.home, title: 'Painting'),
                          Container(
                            color: Color.fromRGBO(236, 239, 244, 1),
                            margin: EdgeInsets.only(top: 6),
                            child: GradientText("Construction",
                                gradient: LinearGradient(colors: [
                                  Colors.black,
                                  Colors.black,
                                ]),
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                      //color: Colors.teal.shade50,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Container(
                      width: c_width,
                      height: 135,
                      child: Column(
                        children: <Widget>[
                          ServiceCard(
                              icon: Icons.format_paint, title: 'Painting'),
                          Container(
                            color: Color.fromRGBO(236, 239, 244, 1),
                            margin: EdgeInsets.only(top: 6),
                            child: GradientText("Painting",
                                gradient: LinearGradient(colors: [
                                  Colors.black,
                                  Colors.black,
                                ]),
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(children: [
              Expanded(
                child: Container(
                  //margin: EdgeInsetsDirectional.only(top: 5),
                  decoration: BoxDecoration(
                    //color: Colors.teal.shade50,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Container(
                    width: c_width,
                    height: 135,
                    child: Column(
                      // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        ServiceCard(
                            icon: Icons.format_paint, title: 'Painting'),
                        Container(
                          color: Color.fromRGBO(236, 239, 244, 1),
                          margin: EdgeInsets.only(top: 6),
                          child: GradientText("Painting",
                              gradient: LinearGradient(colors: [
                                Colors.black,
                                Colors.black,
                              ]),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  //margin: EdgeInsetsDirectional.only(top: 5),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Container(
                    width: c_width,
                    height: 135,
                    child: Column(
                      children: <Widget>[
                        ServiceCard(
                            icon: Icons.format_paint, title: 'Painting'),
                        Container(
                          color: Color.fromRGBO(236, 239, 244, 1),
                          margin: EdgeInsets.only(top: 6),
                          child: GradientText("Painting",
                              gradient: LinearGradient(colors: [
                                Colors.black,
                                Colors.black,
                              ]),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  //margin: EdgeInsetsDirectional.only(top: 5),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Container(
                    width: c_width,
                    height: 135,
                    child: Column(
                      // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        ServiceCard(icon: Icons.settings, title: 'Painting'),
                        Container(
                          color: Color.fromRGBO(236, 239, 244, 1),
                          margin: EdgeInsets.only(top: 6),
                          child: GradientText("Painting",
                              gradient: LinearGradient(colors: [
                                Colors.black,
                                Colors.black,
                              ]),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  //margin: EdgeInsetsDirectional.only(top: 5),
                  decoration: BoxDecoration(
                    //color: Colors.teal.shade50,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Container(
                    width: c_width,
                    height: 135,
                    child: Column(
                      // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        ServiceCard(
                            icon: Icons.youtube_searched_for,
                            title: 'Check All Services'),
                        Container(
                          color: Color.fromRGBO(236, 239, 244, 1),
                          margin: EdgeInsets.only(top: 6),
                          child: GradientText("Explore more Services",
                              gradient: LinearGradient(colors: [
                                Colors.black,
                                Colors.black,
                              ]),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1, 0.4, 0.6, 0.9],
            /*  colors: [
              Color.fromRGBO(242, 243, 247, 1),
              Color.fromRGBO(242, 243, 247, 1),
              Color.fromRGBO(242, 243, 247, 1),
              Color.fromRGBO(242, 243, 247, 1),
            ], */
            colors: [
              Color.fromRGBO(225, 235, 245, 1),
              Color.fromRGBO(216, 226, 236, 1),
              Color.fromRGBO(212, 220, 231, 1),
              //Color.fromRGBO(212, 220, 231, 1),
              Color.fromRGBO(191, 203, 210, 1),
            ],
          ),
        ),
        /* floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new LoginPage()));
          // Navigator.pop(context);
        },
        tooltip: 'Logout',
        child: new Icon(Icons.arrow_back),
      ),  */ // This trailing comma makes auto-formatting nicer for build methods.
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  goToPrevious() {
    carouselSlider.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  goToNext() {
    carouselSlider.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  }
}
