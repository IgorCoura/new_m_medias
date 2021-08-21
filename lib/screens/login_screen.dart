import 'package:flutter/material.dart';
import 'package:new_m_medias/models/student_model.dart';
import 'package:new_m_medias/models/login_model.dart';
import 'package:new_m_medias/screens/home_screen.dart';
import 'package:new_m_medias/utilities/colors_utils.dart';
import 'package:new_m_medias/utilities/constants_utils.dart';

class LoginScreen extends StatelessWidget {
  final _ctrlEmail = TextEditingController();
  final _ctrlPassword = TextEditingController();
  final LoginModel loginModel;
  final StudentModel studentModel;

  LoginScreen({
    Key? key,
    required this.loginModel,
    required this.studentModel,
  }) : super(key: key);

  _clickButton(BuildContext context) async {
    if (await loginModel.login(_ctrlEmail, _ctrlPassword)) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen(
                    studentModel: studentModel,
                  )));
    }
  }

  Widget _buildEmail() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        height: 60.0,
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        child: TextField(
          controller: _ctrlEmail,
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.email,
              color: Colors.white,
            ),
            hintText: 'Enter your Email',
            hintStyle: kHintTextStyle,
          ),
        ),
      ),
    ]);
  }

  Widget _buildPassword() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        height: 60.0,
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        child: TextField(
          controller: _ctrlPassword,
          obscureText: true,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.white,
            ),
            hintText: 'Password',
            hintStyle: kHintTextStyle,
          ),
        ),
      ),
    ]);
  }

  Widget _buildLoginBtn(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 25),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => _clickButton(context),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          padding: MaterialStateProperty.all(const EdgeInsets.all(15.0)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          )),
          elevation: MaterialStateProperty.all(5),
        ),
        child: const Text(
          'LOGIN',
          style: TextStyle(
            color: primaryColor,
            letterSpacing: 1.5,
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: 40.0,
            vertical: 160.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 35.0),
              _buildEmail(),
              const SizedBox(
                height: 30.0,
              ),
              _buildPassword(),
              _buildLoginBtn(context),
            ],
          ),
        ),
      ),
    );
  }
}
