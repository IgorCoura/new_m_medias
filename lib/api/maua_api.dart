import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:http/http.dart';
import 'package:new_m_medias/models/login_model.dart';
import 'package:new_m_medias/models/student_model.dart';

class MauaApi {
  static Future<Response> login(String email, String password) async {
    Map<String, String> _body = {
      "email": email,
      "password": password,
    };

    var url = Uri.https(
      "corsnewmmedias.herokuapp.com",
      "mmedias",
    );

    var response = await http.post(url, body: _body);

    return response;
  }
}
