import 'dart:async';
import 'validator.dart';
import 'package:rxdart/rxdart.dart';

class SignInBloc extends Object with Validators implements BaseBloc {
  final _mobileController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  //final _passwordController = BehaviorSubject<String>();

Function(String) get mobileChanged => _mobileController.sink.add;
  Function(String) get emailChanged => _emailController.sink.add;
  Function(String) get passwordChanged => _passwordController.sink.add;

  //Another way
  // StreamSink<String> get emailChanged => _emailController.sink;
  // StreamSink<String> get passwordChanged => _passwordController.sink;

  Stream<String> get mobile =>
      _mobileController.stream.transform(mobileValidator);

  Stream<String> get email => _emailController.stream.transform(emailValidator);
  Stream<String> get password =>
      _passwordController.stream.transform(passwordValidator);

//Stream<bool> get submitCheck => Observable.combineLatest2(email, password, (e, p) => true);

  Stream<bool> get loginCheck =>
      CombineLatestStream.combine2(mobile, mobile, combiner);

  @override
  void dispose() {
    _mobileController.close();
    _emailController?.close();
    _passwordController?.close();
  }

  bool combiner(String mobile, String pass) {
    //ignore password
    if (mobile != null && mobile.length == 10) {
      return true;
    } else {
      return false;
    }
  }
}

abstract class BaseBloc {
  void dispose();
}
