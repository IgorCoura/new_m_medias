class CoursesModel {
  String _title = "";
  List<double> _test = new List.empty();
  List<double> _works = new List.empty();

  CoursesModel(String title, List<double> test, List<double> works) {
    this._title = title;
    this._test = test;
    this._works = works;
  }

  String getTitle() => _title;
  List<double> getTest() => _test;
  List<double> getWorks() => _works;

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
