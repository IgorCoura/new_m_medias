class CoursesModel {
  String _title = "";
  double _meanTest = 0;
  double _meanWorks = 0;
  double _meanFinal = 0;
  double _meanTestPartial = 0;
  double _meanWorksPartial = 0;
  double _meanFinalPartial = 0;
  List<double> _test = [];
  List<double> _weightTest = [];
  List<double> _works = [];
  List<double> _weightWorks = [];
  List<double> _weightFinal = [];

  CoursesModel(String title) {
    _title = title;
  }

  String getTitle() => _title;
  List<double> getTest() => _test;
  List<double> getWorks() => _works;
  double getMeanTest() {
    updateMeanTestFinal();
    return _meanTest;
  }

  double getMeanWorks() {
    updateMeanWorksFinal();
    return _meanWorks;
  }

  double getMeanFinal() {
    updateMeanFinal();
    return _meanFinal;
  }

  List<int> getIndex() {
    return _test.length >= _works.length
        ? List.generate(_test.length, (int i) => i)
        : List.generate(_works.length, (int i) => i);
  }

  void addTest(double grade) {
    _test.add(grade);
  }

  void addWork(double grade) {
    _works.add(grade);
  }

  void changeTest(int index, double grade) {
    _test[index] = grade;
  }

  void changeWorks(int index, double grade) {
    _works[index] = grade;
  }

  void updateMeanFinal() {
    updateMeanTestFinal();
    updateMeanWorksFinal();
    _meanFinal = _meanTest * 0.6 + _meanWorks * 0.4;
  }

  void updateMeanTestFinal() {
    double testDivision = 0;
    double testSum = 0;

    for (var t in _test) {
      testSum += t;
      testDivision += 1;
    }

    _meanTest = 0;
  }

  void updateMeanWorksFinal() {
    double worksDivision = 0;
    double worksSum = 0;
    for (var w in _works) {
      worksSum += w;
      worksDivision += 1;
    }

    _meanWorks = 0;
  }

  double getMeanTestPartial() {
    return _meanTestPartial;
  }

  double getMeanWorksPartial() {
    return _meanWorksPartial;
  }

  double getMeanFinalPartial() {
    return _meanFinalPartial;
  }
}
