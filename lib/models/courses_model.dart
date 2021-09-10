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
  List<double> _weightFinal = [0.6, 0.4];

  CoursesModel(String title) {
    _title = title;
  }

  String getTitle() => _title;
  List<double> getTest() => _test;
  List<double> getWorks() => _works;
  List<double> getWeigthTest() => _weightTest;
  List<double> getWeightWorks() => _weightWorks;

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

  void insertLitTest(List<double> grade) {
    _test = grade;
    grade.forEach((element) {
      _weightTest.add(1);
    });
  }

  void insertLitWork(List<double> grade) {
    _works = grade;
    grade.forEach((element) {
      _weightWorks.add(1);
    });
  }

  void changeTest(int index, double grade) {
    _test[index] = grade;
  }

  void changeWorks(int index, double grade) {
    _works[index] = grade;
  }

  void changeWeightTest(int index, double grade) {
    _weightTest[index] = grade;
  }

  void changeWeightWorks(int index, double grade) {
    _weightWorks[index] = grade;
  }

  void updateMeanFinal() {
    updateMeanTestFinal();
    updateMeanWorksFinal();
    if (_meanTest < 0) {
      _meanFinal = _meanWorks;
    } else {
      _meanFinal = _meanTest * _weightFinal[0] + _meanWorks * _weightFinal[1];
    }
  }

  void updateMeanTestFinal() {
    double testDivision = 0;
    double testSum = 0;
    List list = _getCalcListGradeTest(_test);
    List test = list[0];
    List weight = list[1];

    if (test.length <= 0) {
      _meanTest = -1;
      return;
    }

    for (int i = 0; i < test.length; i++) {
      var grade = test[i];
      if (grade == -1) {
        grade = 0;
      }
      testSum += grade * weight[i];
      testDivision += weight[i];
    }
    _meanTest = testSum / testDivision;
  }

  List<List<double>> _getCalcListGradeTest(List<double> grade) {
    List<double> listGrade = [];
    List<double> listWeight = [];
    if (grade.length == 3) {
      if (grade[1] > grade[0]) {
        listGrade.add(grade[1]);
      } else {
        listGrade.add(grade[0]);
      }
      listWeight.add(_weightTest[0]);
      return [listGrade, listWeight];
    } else if (grade.length > 3) {
      for (int i = 0; i < 2; i++) {
        if (grade[i] > grade[2]) {
          listGrade.add(grade[i]);
        } else {
          listGrade.add(grade[2]);
        }
        listWeight.add(_weightTest[0]);
        listWeight.add(_weightTest[1]);
      }
      if (grade.length > 6) {
        for (int i = 3; i < 5; i++) {
          if (grade[i] > grade[5]) {
            listGrade.add(grade[i]);
          } else {
            listGrade.add(grade[5]);
          }
        }
        listWeight.add(_weightTest[3]);
        listWeight.add(_weightTest[4]);
      }
    }
    return [listGrade, listWeight];
  }

  void updateMeanWorksFinal() {
    double worksDivision = 0;
    double worksSum = 0;
    for (int i = 0; i < _works.length - 1; i++) {
      var grade = _works[i];
      if (grade == -1 || grade == -2) {
        grade = 0;
      }
      if (grade >= 0) {
        worksSum += grade * _weightWorks[i];
        worksDivision += _weightWorks[i];
      }
    }
    _meanWorks = worksSum / worksDivision;
  }

  void updateMeanWorksPartial() {
    double worksDivision = 0;
    double worksSum = 0;
    for (int i = 0; i < _works.length - 1; i++) {
      var grade = _works[i];
      if (grade >= 0) {
        worksSum += grade * _weightWorks[i];
        worksDivision += _weightWorks[i];
      }
    }
    if (worksDivision > 0) {
      _meanWorksPartial = worksSum / worksDivision;
    }
  }

  void updateMeanTestPartial() {
    double testDivision = 0;
    double testSum = 0;
    List list = _getCalcListGradeTest(_test);
    List test = list[0];
    List weight = list[1];

    if (test.length <= 0) {
      _meanTest = -1;
      return;
    }

    for (int i = 0; i < test.length; i++) {
      var grade = test[i];
      if (grade >= 0) {
        testSum += grade * weight[i];
        testDivision += weight[i];
      }
    }
    if (testDivision > 0) {
      _meanTestPartial = testSum / testDivision;
    }
  }

  void updateMeanPartial() {
    updateMeanTestPartial();
    updateMeanWorksPartial();
    if (_meanTest < 0) {
      _meanFinalPartial = _meanWorksPartial;
    } else {
      _meanFinalPartial = _meanTestPartial * _weightFinal[0] +
          _meanWorksPartial * _weightFinal[1];
    }
  }

  double getMeanTestPartial() {
    updateMeanTestPartial();
    return _meanTestPartial;
  }

  double getMeanWorksPartial() {
    updateMeanWorksPartial();
    return _meanWorksPartial;
  }

  double getMeanFinalPartial() {
    updateMeanPartial();
    return _meanFinalPartial;
  }
}
