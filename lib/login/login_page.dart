import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rainbowrenovations/bloc/email_login_bloc.dart';
import 'package:rainbowrenovations/bloc/email_signup_bloc.dart';
import 'package:rainbowrenovations/pages/dashboard.dart';
import 'package:rainbowrenovations/pages/home_page.dart';
import 'package:rainbowrenovations/service/UserService.dart';
import 'package:rainbowrenovations/style/theme.dart' as Theme;
import 'package:rainbowrenovations/utils/bubble_indication_painter.dart';
import 'package:rainbowrenovations/utils/login_signup_alerts.dart';
import 'package:rainbowrenovations/utils/otp_fields.dart';

//import 'otp_alert_dialougue.dart';

class LoginPage extends StatefulWidget {
  final Widget child;
  LoginPage({Key key, this.child}) : super(key: key);

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

  bool isSignIn = true;
  bool isPhoneVerfied = false;
  bool _obscureTextLogin = true;
  bool _obscureTextSignup = true;
  bool _obscureTextSignupConfirm = true;

  String currentText;
  String phoneNumber;
  String smsCode;
  String verificationId;

  TextEditingController signupEmailController = new TextEditingController();
  TextEditingController signupNameController = new TextEditingController();
  TextEditingController signupMobileController = new TextEditingController();
  TextEditingController signupPasswordController = new TextEditingController();
  TextEditingController signupConfirmPasswordController =
      new TextEditingController();

  PageController _pageController;
  var signupBloc;
  var signinBloc;

  Color left = Colors.black;
  Color right = Colors.white;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
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
                      //Colors.grey.shade200,
                      //Colors.grey.shade200,
                     // Colors.grey.shade200,
                     // Colors.grey.shade200,
                     Color.fromRGBO(209,222,238,1),
                     Color.fromRGBO(209,222,238,1),
                     Color.fromRGBO(209,222,238,1),
                     Color.fromRGBO(209,222,238,1),
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
      ),
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
       //color: Colors.grey.shade200,
      color: Color.fromRGBO(230,233,245,1),
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
    signinBloc = SignInBloc();
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
                 // color: Colors.grey.shade200,
                 color: Color.fromRGBO(230,233,245,1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.180),
                      offset: Offset(15, 15),
                      blurRadius: 15,
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-10, -10),
                      blurRadius: 3,
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
                          stream: signinBloc.mobile,
                          initialData: "",
                          builder: (context, snapshot) => TextField(
                            focusNode: myFocusNodeEmailLogin,
                            controller: loginMobileController,
                            keyboardType: TextInputType.phone,
                            maxLength: 10,
                            inputFormatters: <TextInputFormatter>[
                              WhitelistingTextInputFormatter.digitsOnly
                            ],
                            onChanged: signinBloc.mobileChanged,
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
                          stream: signinBloc.loginCheck,
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
    );
  }

  Widget _buildSignUp(BuildContext context) {
    signupBloc = new SignupBloc();
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
                  //color: Colors.grey.shade200,
                  color: Color.fromRGBO(223,233,245,1),
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
                          stream: signupBloc.name,
                          builder: (context, snapshot) => TextField(
                            focusNode: myFocusNodeName,
                            onChanged: signupBloc.nameChanged,
                            maxLength: 25,
                            controller: signupNameController,
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
                          stream: signupBloc.mobileSignup,
                          initialData: "",
                          builder: (context, snapshot) => TextField(
                            focusNode: myFocusNodeEmailLogin,
                            controller: signupMobileController,
                            keyboardType: TextInputType.phone,
                            maxLength: 10,
                            inputFormatters: <TextInputFormatter>[
                              WhitelistingTextInputFormatter.digitsOnly
                            ],
                            onChanged: signupBloc.mobileSignupChanged,
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
                          stream: signupBloc.emailSignup,
                          builder: (context, snapshot) => TextField(
                            focusNode: myFocusNodeEmail,
                            controller: signupEmailController,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: signupBloc.emailSignupChanged,
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
                          stream: signupBloc.signUpCheck,
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
                            onPressed: () =>
                                ((!snapshot.hasError) && snapshot.hasData)
                                    ? validateUser(false)
                                    : null,
                          ),
                        ),
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
    isSignIn = true;
    _pageController.animateToPage(0,
        duration: Duration(milliseconds: 50), curve: Curves.decelerate);
  }

  void _onSignUpButtonPress() {
    isSignIn = false;
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

  Future<void> _sendCodeToPhoneNumber(String mobile) async {
    print(mobile);
    final PhoneCodeAutoRetrievalTimeout autoRetrive = (String verId) {
      this.verificationId = verId;
    };

    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
      setState(() {
        this.verificationId = verId;
        this.smsCode = smsCode;
      });
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        codeAutoRetrievalTimeout: autoRetrive,
        codeSent: smsCodeSent,
        phoneNumber: "+91" + mobile,
        timeout: const Duration(seconds: 10),
        verificationCompleted: (AuthCredential phoneAuthCredential) {
          print('authentication completed........$phoneAuthCredential');
        },
        verificationFailed: (AuthException error) {
          print('Case ${error.message} is not yet implemented');
        });
  }

  Future<void> validateUser(isSignIn) async {
    String mobile =
        isSignIn ? loginMobileController.text : signupMobileController.text;
    bool isUserExists = await UserService().isUserExists("\+91" + mobile);

    if (isUserExists) {
      if (isSignIn) {
        return showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return _otpAlert(mobile, isSignIn);
          },
        );
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
      if (!isSignIn) {
        return showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return _otpAlert(mobile, isSignIn);
          },
        );
      } else {
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

  signIn(String smsCode, String verificationId) async {
    final AuthCredential credential = PhoneAuthProvider.getCredential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((AuthResult value) async {
      if (value.user != null) {
        var _oAuthuser = value.user;
        this.isPhoneVerfied = true;
        print(signupBloc.name);
        var route = new MaterialPageRoute(
          builder: (BuildContext context) => new HomePage(
              userName: signupNameController.text,
              userMobile: signupMobileController.text,
              userEmail: signupEmailController.text),
        );
        Navigator.of(context).push(route);
        if (isSignIn)
          print("Onboard the user..");
        else {
          print("Onboard the user & save sign up data");
          bool isUserAdded = await UserService().addUser(
              signupMobileController.text,
              _oAuthuser.uid,
              signupNameController.text,
              DateTime.now().toString(),
              signupEmailController.text);
        }
      } else
        print('Error validating OTP, try again..');
    }).catchError((e) {
      print('Something went wrong..');
    });
  }

  _otpAlert(String mobile, isSignIn) {
    _sendCodeToPhoneNumber(mobile);
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 100.0,
      backgroundColor: Colors.white,
      title: Text('OTP verification!'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Please enter the OTP'),
            SizedBox(
              height: 20,
            ),
            PinCodeTextField(
              length: 6,
              obsecureText: false,
              textInputType: TextInputType.numberWithOptions(),
              animationType: AnimationType.fade,
              shape: PinCodeFieldShape.box,
              animationDuration: Duration(milliseconds: 300),
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 50,
              fieldWidth: 40,
              onChanged: (value) {
                setState(() {
                  currentText = value;
                });
              },
            )
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Verify'),
          onPressed: () {
            Navigator.pop(context);
            signIn(currentText, this.verificationId);
          },
        ),
      ],
    );
  }
}
