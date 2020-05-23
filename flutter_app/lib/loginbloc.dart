import 'package:flutterapp/validator.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends Object with Validators{

  BehaviorSubject<String> _emailController = BehaviorSubject<String>();
  BehaviorSubject<String> _passwordController = BehaviorSubject<String>();
  
  get emailStream => _emailController.stream.transform(emailValidator);
  get passStream => _passwordController.stream.transform(passwordValidator);

  get emailChanged => _emailController.sink.add;
  get passwordChanged => _passwordController.sink.add;

  get doLogin => Rx.combineLatest2(emailStream, passStream, (a, b) => true);

  void dispose(){
    _emailController.close();
    _passwordController.close();
  }
}