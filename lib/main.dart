import 'package:flutter/material.dart';
import 'package:new_m_medias/models/student_model.dart';
import 'package:new_m_medias/models/login_model.dart';
import 'package:new_m_medias/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final loginModel = LoginModel();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mMedias',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(
        loginModel: loginModel,
      ),
    );
  }
}
