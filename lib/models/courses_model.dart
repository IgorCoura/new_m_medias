import 'dart:ffi';

class CoursesModel {
  String _title = "";
  List<double> _test = List.empty();
  List<double> _works = List.empty();

  CoursesModel(String title, List<double> test, List<double> works) {
    _title = title;
    _test = test;
    _works = works;
  }

  String getTitle() => _title;
  List<double> getTest() => _test;
  List<double> getWorks() => _works;

  List<int> getIndex() {
    return _test.length >= _works.length
        ? List.generate(_test.length, (int i) => i)
        : List.generate(_works.length, (int i) => i);
  }

  void changeTest(int index, double grade) {
    _test[index] = grade;
  }

  void changeWorks(int index, double grade) {
    _works[index] = grade;
  }

  double getMeanFinal() {
    return getMeanWorksFinal() * 0.6 + getMeanTestFinal() * 0.4;
  }

  double getMeanWorksFinal() {
    double testDivision = 0;
    double testSum = 0;

    for (var t in _test) {
      testSum += t;
      testDivision += 1;
    }

    return (testSum / testDivision);
  }

  double getMeanTestFinal() {
    double worksDivision = 0;
    double worksSum = 0;
    for (var w in _works) {
      worksSum += w;
      worksDivision += 1;
    }

    return worksSum / worksDivision;
  }

  double getMeanTestPartial() {
    return -1;
  }

  double getMeanWorksPartial() {
    return -1;
  }

  double getMeanFinalPartial() {
    return -1;
  }
}
