import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginDialog extends StatefulWidget {
  final String title;
  final String cText;
  LoginDialog(this.title, this.cText);

  @override
  State<StatefulWidget> createState() {
    return _LoginDialogState();
  }
}

class _LoginDialogState extends State<LoginDialog> {
  String _title;
  String _cText;
  @override
  void initState() {
    _title = widget.title;
    _cText = widget.cText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ((Platform.isAndroid)
        ? AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: Text(_title),
            content: new Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: RichText(
                text: TextSpan(
                  text: _cText,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Close"),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          )
        : CupertinoAlertDialog(
            title: Text(_title),
            content: new Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: RichText(
                text: TextSpan(
                  text: _cText,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            actions: [
              CupertinoDialogAction(
                child: Text("Close"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ));
  }
}
