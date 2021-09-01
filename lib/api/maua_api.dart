import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:http/http.dart';
import 'package:new_m_medias/models/login_model.dart';
import 'package:new_m_medias/models/student_model.dart';

class MauaApi {
  static const String host = 'www2.maua.br';

  static Future<Response> login(String email, String password) async {
    Map<String, String> header = {
      "Access-Control-Allow-Origin": "https://new-m-medias.herokuapp.com/",
    };

    var url = Uri.https(host, '/mauanet.2.0');

    Map<String, String> _body = {
      "maua_email": email,
      "maua_senha": password,
      "maua_submit": "Enviar"
    };
    var response = await http.post(url, body: _body, headers: header);
    return response;
  }

  static Future<Response> getGrade(Map<String, String> headers) async {
    var url = Uri.https(host, "/mauanet.2.0/boletim-escolar");
    var response = await http.get(url, headers: headers);
    return response;
  }
}
