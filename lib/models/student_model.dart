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

  Future<void> updateData(Response response) async {
    String body = utf8.decode(response.bodyBytes);
    Document doc = parse(body);
    _name = htmlService.getUserName(doc);
    _ra = htmlService.getUserRegister(doc);
    _listCoursesModel = htmlService.getGradeData(doc);
  }

  List<CoursesModel> getListCoursesModel() => _listCoursesModel;
  String getName() => _name;
  String getRa() => _ra;
}
