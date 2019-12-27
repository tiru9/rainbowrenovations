import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPAlertWidget extends StatefulWidget {
  String phoneNumber;
  OTPAlertWidget(this.phoneNumber);
  @override
  State<StatefulWidget> createState() {
    return _OTPAlertWidgetState(this.phoneNumber);
  }
}

class _OTPAlertWidgetState extends State<OTPAlertWidget> {
  String currentText;

  String phoneNumber;
  String smsCode;
  String verificationId;

  _OTPAlertWidgetState(this.phoneNumber) {
    _sendCodeToPhoneNumber();
  }

  @override
  Widget build(BuildContext context) {
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

  signIn(String smsCode, String verificationId) async {
    print('smscode......$smsCode');
    print('verificationId......$verificationId');
    final AuthCredential credential = PhoneAuthProvider.getCredential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((AuthResult value) async {
      print('user....');
      if (value.user != null)
        print("Onboard the user..");
      else
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
      setState(() {
        this.verificationId = verId;
        this.smsCode = smsCode;
      });
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        codeAutoRetrievalTimeout: autoRetrive,
        codeSent: smsCodeSent,
        phoneNumber: "+91" + this.phoneNumber,
        timeout: const Duration(seconds: 10),
        verificationCompleted: (AuthCredential phoneAuthCredential) {
          print('authentication completed........$phoneAuthCredential');
        },
        verificationFailed: (AuthException error) {
          print('phone no.......$phoneNumber');
          print('Case ${error.message} is not yet implemented');
        });
  }
}
