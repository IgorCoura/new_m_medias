import 'package:new_m_medias/models/courses_model.dart';

class StudentModel {
  List<CoursesModel> _listCoursesModel = [];

  StudentModel() {
    List<double> n = [6.2, 5.1, 4.8, 1.2];
    _listCoursesModel.add(new CoursesModel("Calculo", n, n));
    _listCoursesModel.add(new CoursesModel("Fisica", n, n));
  }

  List<CoursesModel> getListCoursesModel() => _listCoursesModel;
}
