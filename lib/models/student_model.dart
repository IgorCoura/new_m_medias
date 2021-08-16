import 'package:new_m_medias/models/courses_model.dart';

class StudentModel {
  List<CoursesModel> _listCoursesModel = [];

  StudentModel() {
    List<double> n = [6.2, 5.1, 4.8];
    List<double> n1 = [6.2, 5.1, 4.8, 1.2, 5.2, 4.2];
    _listCoursesModel.add(CoursesModel("Calculo", n, n1));
    _listCoursesModel.add(CoursesModel("Fisica", n, n1));
  }

  List<CoursesModel> getListCoursesModel() => _listCoursesModel;
}
