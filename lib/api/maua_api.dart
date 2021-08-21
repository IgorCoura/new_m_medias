import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

class mauaApi {
  static final String host = 'www2.maua.br';

  static Map<String, String> headers = {};

  static Future<bool> login(String email, String password) async {
    var url = Uri.https(host, '/mauanet.2.0');

    Map<String, String> _body = {
      "maua_email": email,
      "maua_senha": password,
      "maua_submit": "Enviar"
    };

    var response = await http.post(url, body: _body);
    updateCookie(response);

    getNotas();

    if (response.statusCode == 302) {
      return true;
    } else {
      return false;
    }
  }

  static void getNotas() async {
    var url = Uri.https(host, "/mauanet.2.0/boletim-escolar");

    var response = await http.get(url, headers: headers);
    updateCookie(response);
  }

  static void updateCookie(http.Response response) {
    String? rawCookie = response.headers["set-cookie"];
    if (rawCookie != null) {
      int index = rawCookie.indexOf(';');
      headers['cookie'] =
          (index == -1) ? rawCookie : rawCookie.substring(0, index);
    }
  }
}
