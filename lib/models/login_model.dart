import 'package:flutter/material.dart';
import 'package:new_m_medias/api/maua_api.dart';
import 'package:new_m_medias/models/student_model.dart';

class LoginModel {
  Future<StudentModel?> login(TextEditingController ctrlEmail,
      TextEditingController ctrlPassword) async {
    String email = ctrlEmail.text;
    String password = ctrlPassword.text;

    var response = await MauaApi.login(email, password);

    if (response.statusCode == 302) {
      var user = StudentModel();
      await user.updateData(response: response);
      return user;
    } else {
      return null;
    }
  }
}
