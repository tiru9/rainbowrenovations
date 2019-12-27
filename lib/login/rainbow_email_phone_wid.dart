import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rainbowrenovations/login/otp_alert_dialougue.dart';

class RainbowEmailOrPhoneWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RainbowEmailOrPhoneWidgetState();
  }
}

class _RainbowEmailOrPhoneWidgetState extends State<RainbowEmailOrPhoneWidget> {
  final _emailOrPhone = TextEditingController();
  bool _validate = true;

  @override
  void dispose() {
    _emailOrPhone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return email/phone input field along with verufy button
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.white10),
            ),
          ),
          child: TextField(
            style: new TextStyle(
                fontSize: 20.0,
                height: 1.0,
                color: Colors.deepPurple,
                fontWeight: FontWeight.w600),
            controller: _emailOrPhone,
            keyboardType: TextInputType.phone,
            maxLength: 10,
            inputFormatters: <TextInputFormatter>[
              WhitelistingTextInputFormatter.digitsOnly
            ],
            decoration: new InputDecoration(
              labelText: 'Enter mobile number',
              prefixText: "+91",
              counterText: "",
              //hintText: "Enter mobile number",
              hintStyle: TextStyle(fontSize: 20.0, color: Colors.deepPurple),
              fillColor: Colors.redAccent,
              errorText: _validate ? null : 'Invalid email or mobile number',
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(15.0),
                borderSide: new BorderSide(color: Colors.cyanAccent),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        RaisedButton(
          onPressed: () {
            // setState(() {
            _validate = _validateEmailorPhone();
            // if (_validate) PhoneOtp(_emailOrPhone.text);
            //PhoneOtp.withA(_emailOrPhone.text);
            // });
          },
          child: Text('Submit'),
          textColor: Colors.black,
          elevation: 25.0,
          color: Colors.white70,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
              side: BorderSide(
                color: Colors.white12,
              )),
        ),
      ],
    );
  }

  _validateEmailorPhone() {
    bool isValid = true;
    //return true;
    // EmailorPhoneValidator(_emailOrPhone.text).isValidMailOrPhone();
    if (isValid) {
      _otpAlert();
      return true;
    } else
      return false;
  }

  Future<void> _otpAlert() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        print('phone at..... $_emailOrPhone.text ');
        return OTPAlertWidget(_emailOrPhone.text);
      },
    );
  }
}
