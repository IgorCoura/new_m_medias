import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:new_m_medias/models/student_model.dart';
import 'package:new_m_medias/models/login_model.dart';
import 'package:new_m_medias/screens/home_screen.dart';
import 'package:new_m_medias/utilities/colors_utils.dart';
import 'package:new_m_medias/utilities/constants_utils.dart';

class LoginScreen extends StatefulWidget {
  final LoginModel loginModel;

  const LoginScreen({
    Key? key,
    required this.loginModel,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _ctrlEmail = TextEditingController();

  final _ctrlPassword = TextEditingController();

  bool _clicked = false;

  double _opacity = 1.0;

  _clickButton(BuildContext context) async {
    Response response =
        await widget.loginModel.login(_ctrlEmail, _ctrlPassword);

    setState(() {
      _clicked = false;
      _opacity = 1.0;
    });

    if (response.statusCode == 200) {
      var user = StudentModel();
      user.updateData(response);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen(
                    studentModel: user,
                  )));
    } else {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('Erro: ' + response.statusCode.toString()),
          content: Text(response.body),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
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
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Stack(
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                _clicked = true;
                _opacity = 0.0;
              });
            },
            child: AnimatedContainer(
              width: _clicked ? 55 : 200,
              height: 55,
              curve: Curves.fastOutSlowIn,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_clicked ? 70.0 : 30.0),
                color: secondaryColorDark,
              ),
              duration: const Duration(milliseconds: 700),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    child: const Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    opacity: _opacity,
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _clickButton(context);
                _clicked = true;
                _opacity = 0.0;
              });
            },
            child: AnimatedContainer(
              width: _clicked ? 55 : 200,
              height: 55,
              curve: Curves.fastOutSlowIn,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_clicked ? 70.0 : 30.0),
              ),
              duration: const Duration(milliseconds: 700),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 700),
                child: Padding(
                  child: CircularProgressIndicator(
                      backgroundColor: Colors.blueAccent,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          _clicked ? primaryColorDark : secondaryColorDark)),
                  padding: const EdgeInsets.all(1),
                ),
                opacity: _opacity == 0.0 ? 1.0 : 0.0,
              ),
            ),
          ),
        ],
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
          child: Container(
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
      ),
    );
  }
}
