import 'package:flutter/material.dart';

class LoginModel {
  LoginModel() {}

  String login(
      TextEditingController ctrlEmail, TextEditingController ctrlPassword) {
    String email = ctrlEmail.text;
    String senha = ctrlPassword.text;

    var response = "Efetuar login";

    if (response != null) {
      return response;
    }
    return "Fodeu";
  }
}
