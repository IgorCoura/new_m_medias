import 'package:flutter/material.dart';
import 'package:new_m_medias/models/login_model.dart';
import 'package:new_m_medias/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final loginModel = new LoginModel();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Spotify UI',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(
        loginModel: loginModel,
      ),
    );
  }
}
