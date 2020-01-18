import 'dart:async';

import 'package:email_validator/email_validator.dart';

mixin Validators {
  var nameValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    if (!RegExp(r'[.!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(name))
      sink.add(name);
    else
      sink.addError("Name is not valid");
  });

  var emailValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (EmailValidator.validate(email)) {
      sink.add(email);
    } else {
      sink.addError("Enter valid email");
    }
  });

  var mobileValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (mobile, sink) {
    //print(mobile.length);
    if (mobile.length == 10) {
      sink.add(mobile);
    } else {
      sink.addError("Mobile Number must be of 10 digit");
    }
  });

  var passwordValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 4) {
      sink.add(password);
    } else {
      sink.addError("Password length must be more than 4 chars.");
    }
  });
}
