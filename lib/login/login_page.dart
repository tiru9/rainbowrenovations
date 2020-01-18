import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rainbowrenovations/bloc/email_login_bloc.dart';
import 'package:rainbowrenovations/bloc/email_signup_bloc.dart';
import 'package:rainbowrenovations/service/UserService.dart';
import 'package:rainbowrenovations/style/theme.dart' as Theme;
import 'package:rainbowrenovations/utils/bubble_indication_painter.dart';
import 'package:rainbowrenovations/utils/login_signup_alerts.dart';

import 'otp_alert_dialougue.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final FocusNode myFocusNodeEmailLogin = FocusNode();
  final FocusNode myFocusNodePasswordLogin = FocusNode();

  final FocusNode myFocusNodePassword = FocusNode();
  final FocusNode myFocusNodeEmail = FocusNode();
  final FocusNode myFocusNodeName = FocusNode();

  TextEditingController loginMobileController = new TextEditingController();
  TextEditingController loginEmailController = new TextEditingController();
  TextEditingController loginPasswordController = new TextEditingController();

  bool _obscureTextLogin = true;
  bool _obscureTextSignup = true;
  bool _obscureTextSignupConfirm = true;

  TextEditingController signupEmailController = new TextEditingController();
  TextEditingController signupNameController = new TextEditingController();
  TextEditingController signupMobileController = new TextEditingController();
  TextEditingController signupPasswordController = new TextEditingController();
  TextEditingController signupConfirmPasswordController =
      new TextEditingController();

  PageController _pageController;

  Color left = Colors.black;
  Color right = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Center(
      key: _scaffoldKey,
      child: Center(
        child: SingleChildScrollView(
          /* child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowGlow();
            }, */
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height >= 775.0
                ? MediaQuery.of(context).size.height
                : 850.0,
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  stops: [
                    0.1,
                    0.4,
                    0.6,
                    0.9
                  ],
                  colors: [
                    Colors.teal[50],
                    Colors.teal[100],
                    Colors.green[100],
                    Colors.green[100],
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  tileMode: TileMode.clamp),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: new Image(
                      width: 250.0,
                      height: 180.0,
                      fit: BoxFit.fill,
                      image: new AssetImage('assets/images/rhr1.png')),
                ),
                Text(
                  "Rainbow Renovations",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 25.0,
                      fontFamily: "WorkSansSemiBold"),
                ),
                SizedBox(height: 10),
                Text("Welcomes you!",
                    style: TextStyle(
                        color: Colors.black87,
                        fontFamily: "WorkSansSemiBold",
                        fontSize: 18)),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: _buildMenuBar(context),
                ),
                Expanded(
                  flex: 2,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (i) {
                      if (i == 0) {
                        setState(() {
                          right = Colors.white;
                          left = Colors.black;
                        });
                      } else if (i == 1) {
                        setState(() {
                          right = Colors.black;
                          left = Colors.white;
                        });
                      }
                    },
                    children: <Widget>[
                      new ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: _buildSignIn(context),
                      ),
                      new ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: _buildSignUp(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      //),
    );
  }

  @override
  void dispose() {
    myFocusNodePassword.dispose();
    myFocusNodeEmail.dispose();
    myFocusNodeName.dispose();
    _pageController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _pageController = PageController();
  }

  void showInSnackBar(String value) {
    FocusScope.of(context).requestFocus(new FocusNode());
    _scaffoldKey.currentState?.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontFamily: "WorkSansSemiBold"),
      ),
      backgroundColor: Colors.blue,
      // duration: Duration(seconds: 3),
    ));
  }

  Widget _buildMenuBar(BuildContext context) {
    return Container(
      width: 300.0,
      height: 53.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60),
          topRight: Radius.circular(60),
          bottomLeft: Radius.circular(60),
          bottomRight: Radius.circular(60),
        ),
        color: Colors.grey.shade200,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.180),
            offset: Offset(10, 10),
            blurRadius: 10,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-5, -5),
            blurRadius: 5,
          ),
        ],
      ),
      child: CustomPaint(
        painter: TabIndicationPainter(pageController: _pageController),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: _onSignInButtonPress,
                child: Text(
                  "Existing",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16.0,
                      fontFamily: "WorkSansSemiBold"),
                ),
              ),
            ),
            //Container(height: 33.0, width: 1.0, color: Colors.white),
            Expanded(
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: _onSignUpButtonPress,
                child: Text(
                  "New",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16.0,
                      fontFamily: "WorkSansSemiBold"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignIn(BuildContext context) {
    final bloc = SignInBloc();
    return Container(
      padding: EdgeInsets.only(top: 50.0),
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            overflow: Overflow.visible,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  ),
                  color: Colors.grey.shade200,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.180),
                      offset: Offset(15, 15),
                      blurRadius: 10,
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-12, -12),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Container(
                  width: 350.0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.only(top: 20.0, left: 25.0, right: 25.0),
                        child: StreamBuilder<String>(
                          stream: bloc.mobile,
                          initialData: "",
                          builder: (context, snapshot) => TextField(
                            focusNode: myFocusNodeEmailLogin,
                            controller: loginMobileController,
                            keyboardType: TextInputType.phone,
                            maxLength: 10,
                            inputFormatters: <TextInputFormatter>[
                              WhitelistingTextInputFormatter.digitsOnly
                            ],
                            onChanged: bloc.mobileChanged,
                            style: TextStyle(
                                fontFamily: "WorkSansSemiBold",
                                fontSize: 16.0,
                                color: Colors.black),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  FontAwesomeIcons.mobile,
                                  color: Colors.black,
                                  size: 22.0,
                                ),
                                prefixText: "+91 ",
                                counterText: "",
                                hintText: "Mobile",
                                hintStyle: TextStyle(
                                    fontFamily: "WorkSansSemiBold",
                                    fontSize: 17.0),
                                errorText: snapshot.error),
                          ),
                        ),
                      ),
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey[400],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30.0, bottom: 10),
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          gradient: new LinearGradient(
                              colors: [
                                Theme.Colors.loginGradientEnd,
                                Theme.Colors.loginGradientStart
                              ],
                              begin: const FractionalOffset(0.2, 0.2),
                              end: const FractionalOffset(1.0, 1.0),
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp),
                        ),
                        child: StreamBuilder<bool>(
                          stream: bloc.loginCheck,
                          builder: (context, snapshot) => MaterialButton(
                            highlightColor: Colors.transparent,
                            splashColor: Theme.Colors.loginGradientEnd,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 42.0),
                              child: Text(
                                "Verify OTP",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontFamily: "WorkSansBold"),
                              ),
                            ),
                            onPressed: () =>
                                ((!snapshot.hasError) && snapshot.hasData)
                                    ? validateUser(true) //true for sign in
                                    : null,
                            /* => snapshot.hasData
                                  ? () => showInSnackBar(
                                      "Login credentials are valid")
                                  : null, //showInSnackBar("Login button pressed") */
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[],
            ),
          ),
        ],
      ),
      // ),
    );
  }

  Widget _buildSignUp(BuildContext context) {
    var bloc = new SignupBloc();
    return Container(
      padding: EdgeInsets.only(top: 50.0),
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            //overflow: Overflow.visible,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  ),
                  color: Colors.grey.shade200,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.180),
                      offset: Offset(15, 15),
                      blurRadius: 10,
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-12, -12),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Container(
                  width: 300.0,
                  //height: 360.0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20.0, bottom: 10.0, left: 25.0, right: 25.0),
                        child: StreamBuilder<String>(
                          stream: bloc.name,
                          builder: (context, snapshot) => TextField(
                            focusNode: myFocusNodeName,
                            onChanged: bloc.nameChanged,
                            maxLength: 25,
                            //controller: signupNameController,
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            style: TextStyle(
                                fontFamily: "WorkSansSemiBold",
                                fontSize: 16.0,
                                color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                FontAwesomeIcons.user,
                                color: Colors.black,
                              ),
                              counterText: "",
                              hintText: "Name",
                              hintStyle: TextStyle(
                                  fontFamily: "WorkSansSemiBold",
                                  fontSize: 16.0),
                              errorText: snapshot.error,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey[400],
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 20.0, left: 25.0, right: 25.0),
                        child: StreamBuilder<String>(
                          stream: bloc.mobileSignup,
                          initialData: "",
                          builder: (context, snapshot) => TextField(
                            focusNode: myFocusNodeEmailLogin,
                            controller: signupMobileController,
                            keyboardType: TextInputType.phone,
                            maxLength: 10,
                            inputFormatters: <TextInputFormatter>[
                              WhitelistingTextInputFormatter.digitsOnly
                            ],
                            onChanged: bloc.mobileSignupChanged,
                            style: TextStyle(
                                fontFamily: "WorkSansSemiBold",
                                fontSize: 16.0,
                                color: Colors.black),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  FontAwesomeIcons.mobile,
                                  color: Colors.black,
                                  size: 22.0,
                                ),
                                prefixText: "+91 ",
                                counterText: "",
                                hintText: "Mobile",
                                hintStyle: TextStyle(
                                    fontFamily: "WorkSansSemiBold",
                                    fontSize: 17.0),
                                errorText: snapshot.error),
                          ),
                        ),
                      ),
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey[400],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20.0, bottom: 10.0, left: 25.0, right: 25.0),
                        child: StreamBuilder<String>(
                          stream: bloc.emailSignup,
                          builder: (context, snapshot) => TextField(
                            focusNode: myFocusNodeEmail,
                            //controller: signupEmailController,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: bloc.emailSignupChanged,
                            style: TextStyle(
                                fontFamily: "WorkSansSemiBold",
                                fontSize: 16.0,
                                color: Colors.black),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  FontAwesomeIcons.envelope,
                                  color: Colors.black,
                                ),
                                hintText: "Email Address",
                                hintStyle: TextStyle(
                                    fontFamily: "WorkSansSemiBold",
                                    fontSize: 16.0),
                                errorText: snapshot.error),
                          ),
                        ),
                      ),
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey[400],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0, bottom: 10),
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          boxShadow: <BoxShadow>[],
                          gradient: new LinearGradient(
                              colors: [
                                Theme.Colors.loginGradientEnd,
                                Theme.Colors.loginGradientStart
                              ],
                              begin: const FractionalOffset(0.2, 0.2),
                              end: const FractionalOffset(1.0, 1.0),
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp),
                        ),
                        child: StreamBuilder<bool>(
                          stream: bloc.signUpCheck,
                          builder: (context, snapshot) => MaterialButton(
                            highlightColor: Colors.transparent,
                            splashColor: Theme.Colors.loginGradientEnd,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 42.0),
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontFamily: "WorkSansBold"),
                              ),
                            ),
                            onPressed: () => ((!snapshot.hasError) &&
                                    snapshot.hasData)
                                ? validateUser(
                                    false) //otpAlert(signupMobileController.text)
                                : null,
                          ),
                        ), //showInSnackBar("SignUp button pressed")),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onSignInButtonPress() {
    _pageController.animateToPage(0,
        duration: Duration(milliseconds: 50), curve: Curves.decelerate);
  }

  void _onSignUpButtonPress() {
    _pageController?.animateToPage(1,
        duration: Duration(milliseconds: 50), curve: Curves.decelerate);
  }

  void _toggleLogin() {
    setState(() {
      _obscureTextLogin = !_obscureTextLogin;
    });
  }

  void _toggleSignup() {
    setState(() {
      _obscureTextSignup = !_obscureTextSignup;
    });
  }

  void _toggleSignupConfirm() {
    setState(() {
      _obscureTextSignupConfirm = !_obscureTextSignupConfirm;
    });
  }

  Future<void> otpAlert(String mobile) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return OTPAlertWidget(mobile);
      },
    );
  }

  Future<void> validateUser(isSignIn) async {
    String mobile =
        isSignIn ? loginMobileController.text : signupMobileController.text;
    bool isUserExists = await UserService().isUserExists("\+91" + mobile);

    if (isUserExists) {
      if (isSignIn) {
        otpAlert(mobile);
      } else {
        return showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return LoginDialog("Mobile number already Registered!",
                "Please Signin by Verifing mobile OTP(Click Existing tab)");
          },
        );
      }
    } else {
      if (!isSignIn)
        otpAlert(mobile);
      else {
        return showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return LoginDialog("Mobile number Not Registered!",
                "Please Signin by clicking New Tab");
          },
        );
      }
    }
  }
}
