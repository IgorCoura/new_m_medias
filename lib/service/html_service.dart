import 'package:html/dom.dart';
import 'package:new_m_medias/models/courses_model.dart';
import 'package:new_m_medias/models/student_model.dart';

class htmlService {
  static List<CoursesModel> getGradeData(Document document) {
    List<CoursesModel> list = [];
    var table = document.getElementById("notas");
    var body = table!.getElementsByTagName("tbody").first;
    var materias = body.getElementsByTagName("tr");
    materias.forEach((element) {
      var title = element.getElementsByClassName("text-left").first.text;
      title = getText(title);
      var course = CoursesModel(title);
      var tests = element.getElementsByClassName("provas");
      tests.forEach((t) {
        var text = t.text;
        if (text != null && !t.outerHtml.contains("bloqueado")) {
          if (text == "") {
            text = "0";
          }
          text = text.replaceAll(",", ".");
          var grade = double.tryParse(text);
          if (grade != null) {
            course.addTest(grade);
          }
        }
      });
      var works = element.getElementsByClassName("trabalhos ");
      works.forEach((w) {
        var text = w.text;
        if (text != null && !w.outerHtml.contains("bloqueado")) {
          if (text == "") {
            text = "0";
          }
          text = text.replaceAll(",", ".");
          var grade = double.tryParse(text);
          if (grade != null) {
            course.addWork(grade);
          }
        }
      });
      list.add(course);
    });
    return list;
  }

  static String getUserName(Document document) {
    var table = document.getElementById("dados-aluno");
    var elements =
        table!.getElementsByTagName("tr").first.getElementsByTagName("td");
    return elements[1].text.replaceAll("Nome: ", "");
  }

  static String getUserRegister(Document document) {
    var table = document.getElementById("dados-aluno");
    var elements =
        table!.getElementsByTagName("tr").first.getElementsByTagName("td");
    return elements[2].text.replaceAll("RA: ", "");
  }

  static String getText(String text) {
    var t = text.split(" ");
    t.removeAt(0);
    t.removeLast();
    var resp = "";
    t.forEach((e) {
      if (e != "") {
        resp += e + " ";
      }
    });
    return resp;
  }
}
