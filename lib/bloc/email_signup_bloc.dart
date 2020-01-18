import 'dart:async';
import 'validator.dart';
import 'package:rxdart/rxdart.dart';

class SignupBloc extends Object with Validators implements BaseBloc {
  final _nameController = BehaviorSubject<String>();
  final _mobileSignupController = BehaviorSubject<String>();
  final _emailSignupController = BehaviorSubject<String>();
  //final _password1Controller = BehaviorSubject<String>();
  //final _password2Controller = BehaviorSubject<String>();

  Function(String) get nameChanged => _nameController.sink.add;
  Function(String) get mobileSignupChanged => _mobileSignupController.sink.add;
  Function(String) get emailSignupChanged => _emailSignupController.sink.add;
  //Function(String) get password1Changed => _password1Controller.sink.add;
  //Function(String) get password2Changed => _password2Controller.sink.add;

  Stream<String> get name => _nameController.stream.transform(nameValidator);
  Stream<String> get mobileSignup =>
      _mobileSignupController.stream.transform(mobileValidator);
  Stream<String> get emailSignup =>
      _emailSignupController.stream.transform(emailValidator);
  //Stream<String> get password1 =>
  //    _password1Controller.stream.transform(passwordValidator);
/*   Stream<String> get password2 => _password2Controller.stream
          .transform(passwordValidator)
          .doOnData((String c) {
        if (0 != _password1Controller.value.compareTo(c)) {
          // If they do not match, add an error
          _password2Controller.addError("Password not Matching..");
        }
      }); */

//Stream<bool> get submitCheck => Observable.combineLatest2(email, password, (e, p) => true);

  Stream<bool> get signUpCheck =>
      CombineLatestStream.combine3(name, emailSignup, mobileSignup, combiner);

  @override
  void dispose() {
    _nameController?.close();
    _mobileSignupController?.close();
    _emailSignupController?.close();
    // _password1Controller?.close();
    // _password2Controller?.close();
  }

  bool combiner(String name, String email, String mobile) {
    if (name != null &&
        email != null &&
        mobile != null &&
        name.length != 0 &&
        email.length != 0 &&
        mobile.length != 0) {
      print('Helloooooo');
      return true;
    } else
      return false;
  }
}

abstract class BaseBloc {
  void dispose();
}
