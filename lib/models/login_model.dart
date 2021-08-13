import 'package:flutter/material.dart';

class LoginModel {
  LoginModel() {}

  bool login(
      TextEditingController ctrlEmail, TextEditingController ctrlPassword) {
    String email = ctrlEmail.text;
    String senha = ctrlPassword.text;

    var response = email + senha;

    if (response != null) {
      print("Login Efetuado");
      return true;
    } else {
      print("Login negado");
      return false;
    }
  }
}
