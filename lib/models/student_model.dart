import 'dart:convert';

import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';
import 'package:new_m_medias/api/maua_api.dart';
import 'package:new_m_medias/models/courses_model.dart';
import 'package:new_m_medias/service/html_service.dart';

class StudentModel {
  String _name = "";
  String _ra = "";
  List<CoursesModel> _listCoursesModel = [];
  Map<String, String> headers = {};

  Future<void> updateData({Response? response}) async {
    response != null ? updateCookie(response) : null;
    Response resp = await MauaApi.getGrade(headers);
    updateCookie(resp);
    String body = utf8.decode(resp.bodyBytes);
    Document doc = parse(body);
    _name = htmlService.getUserName(doc);
    _ra = htmlService.getUserRegister(doc);
    _listCoursesModel = htmlService.getGradeData(doc);
  }

  Future<void> updateCookie(Response response) async {
    String? rawCookie = response.headers["set-cookie"];
    if (rawCookie != null) {
      int index = rawCookie.indexOf(';');
      headers['cookie'] =
          (index == -1) ? rawCookie : rawCookie.substring(0, index);
    }
  }

  Map<String, String> getCookie() {
    return headers;
  }

  List<CoursesModel> getListCoursesModel() => _listCoursesModel;
  String getName() => _name;
  String getRa() => _ra;
}
