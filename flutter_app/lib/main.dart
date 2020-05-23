import 'package:flutter/material.dart';
import 'package:flutterapp/login.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TestApp',
      home: LoginScreen(),
    );
  }

}