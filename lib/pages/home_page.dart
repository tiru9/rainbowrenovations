import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:rainbowrenovations/login/login_page.dart';
import 'package:rainbowrenovations/pages/mainservice_cards.dart';
import 'package:rainbowrenovations/pages/widgets/bottom_nav_bar.dart';
import 'package:rainbowrenovations/pages/widgets/bottom_nav_tappedBtn.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:rainbowrenovations/pages/widgets/dashboard_service_card.dart';

class HomePage extends StatefulWidget {
  //FirebaseUser _user;

  String userName;
  String userMobile;
  String userEmail;

  HomePage({Key key, this.userName, this.userMobile, this.userEmail})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CarouselSlider carouselSlider;

  //FirebaseUser currentUser;
  //_DashBoardState(this.currentUser);
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.8;
    return new Scaffold(
      //backgroundColor: Colors.grey.shade50,
      body: new Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Align(
                  child: Container(
                    height: 75,
                    margin: const EdgeInsets.symmetric(vertical: 30.0),
                    padding: EdgeInsets.only(right: 20),
                    child: BottomNavTappedButton(icon: Icons.account_circle),
                  ),
                ),
              ],
            ), //Logo & Profile
            //Row(),//SearchBar add in bottom bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 470,
                    width: 370,
                    child: Container(
                      child: MainServiceCards(),
                    ),
                  ),
                ),
              ],
            ), //Main ServiceCards

            Row(), //Individual Service Cards with Explore All
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1, 0.4, 0.6, 0.9],
            colors: [
              Color.fromRGBO(235, 242, 250, 1),
              Color.fromRGBO(235, 242, 250, 1),
              Color.fromRGBO(235, 242, 250, 1),
              Color.fromRGBO(235, 242, 250, 1),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
