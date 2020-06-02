import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/bloc/todo_bloc.dart';
import 'file:///C:/Users/bablibisht/Desktop/FlutterProjects/test/ExerciseLogin/flutter_app/lib/view/dashboard_bloc.dart';
import 'package:flutterapp/dashboard.dart';
import 'file:///C:/Users/bablibisht/Desktop/FlutterProjects/test/ExerciseLogin/flutter_app/lib/bloc/loginbloc.dart';
import 'package:flutterapp/model/todo.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<LoginScreen> {
  LoginBloc _loginBloc = LoginBloc();

  @override
  void dispose() {
    super.dispose();
    _loginBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            StreamBuilder(
              stream: _loginBloc.emailStream,
              builder: (context, snapshot) => TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: 'Enter email',
                    labelText: 'Email',
                    errorText: snapshot.error),
                onChanged: _loginBloc.emailChanged,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            StreamBuilder(
              stream: _loginBloc.passStream,
              builder: (context, snapshot) => TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: 'Enter password',
                    labelText: 'Password',
                    errorText: snapshot.error,
                ),
                onChanged: _loginBloc.passwordChanged,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            StreamBuilder(
              stream: _loginBloc.doLogin,
              builder: (context, snapshot) => RaisedButton(
                color: Colors.blue,
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                onPressed: () {
                  if (snapshot.hasData) {
                    debugPrint('Login');
                    navigateToDashboard(context);
                  } else
                    debugPrint('Login Fail');
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void navigateToDashboard(BuildContext context) {
   /* Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DashboardBloc(),
    ));*/
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: BlocProvider.of<TodoBloc>(context),
          child: DashboardBloc(),
        ),
      ),
    );



  }
}
