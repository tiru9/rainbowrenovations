import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rainbowrenovations/dashboard.dart';

class PhoneOtp extends StatefulWidget {
  String phone;
  /*  PhoneOtp(phone, smsCode) {
    _PhoneOtpState(phone).signIn(phone, smsCode);
  } */

  PhoneOtp(this.phone) {
    _PhoneOtpState(phone);
  }

  @override
  State<StatefulWidget> createState() => _PhoneOtpState(phone);
}

class _PhoneOtpState extends State<PhoneOtp> {
  String phoneNumber;
  String smsCode;
  String verificationId;

  /* _PhoneOtpState.withA(this.phoneNumber) {
    _sendCodeToPhoneNumber();
  } */

  _PhoneOtpState(this.phoneNumber) {
    _sendCodeToPhoneNumber();
  }

  signIn(phone, smsCode) async {
    print('smscode......$smsCode');
    print('verificationId......$this.verificationId');
    final AuthCredential credential = PhoneAuthProvider.getCredential(
      verificationId: this.verificationId,
      smsCode: smsCode,
    );
    print('inside signIn....');
    FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((AuthResult value) async {
      print('user....');
      if (value.user != null) {
        print("Onboard the user..");
        Navigator.push(
          context,
          MaterialPageRoute<DashBoard>(builder: (BuildContext context) => DashBoard(value.user)),
        );
      } else
        print('Error validating OTP, try again..');
    }).catchError((e) {
      print('Something went wrong..');
    });
  }

  Future<void> _sendCodeToPhoneNumber() async {
    final PhoneCodeAutoRetrievalTimeout autoRetrive = (String verId) {
      this.verificationId = verId;
    };

    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
      print('verId .....$verId');
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        codeAutoRetrievalTimeout: autoRetrive,
        codeSent: smsCodeSent,
        phoneNumber: this.phoneNumber,
        timeout: const Duration(seconds: 10),
        verificationCompleted: (AuthCredential phoneAuthCredential) {
          print('authentication completed........$phoneAuthCredential');
          setState(() {
            //this.verificationId = verId;
            //this.smsCode = smsCode;
          });
        },
        verificationFailed: (AuthException error) {
          print('phone no.......$phoneNumber');
          print('Case ${error.message} is not yet implemented');
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(); //OTPAlertWidget(this.phoneNumber);
  }
}
