import 'package:flutter/material.dart';
import 'package:new_m_medias/api/maua_api.dart';

class LoginModel {
  Future<bool> login(TextEditingController ctrlEmail,
      TextEditingController ctrlPassword) async {
    String email = ctrlEmail.text;
    String password = ctrlPassword.text;

    return await mauaApi.login(email, password);
  }
}
