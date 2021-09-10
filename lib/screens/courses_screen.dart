import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_m_medias/models/courses_model.dart';
import 'package:new_m_medias/utilities/colors_utils.dart';
import 'package:new_m_medias/widgets/grade_widget.dart';
import 'package:new_m_medias/widgets/weight_widget.dart';

class CoursesScreen extends StatefulWidget {
  final CoursesModel coursesModel;

  const CoursesScreen({
    Key? key,
    required this.coursesModel,
  }) : super(key: key);

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  bool changeMeanWidget = true;
  bool editWeight = true;

  _changeMeanButton(bool change) {
    setState(() {
      if (change) {
        changeMeanWidget = true;
      } else {
        changeMeanWidget = false;
      }
    });
  }

  _clickEditWeightButton() {
    setState(() {
      editWeight = !editWeight;
    });
  }

  _changeGradeTest(int index, double grade) {
    setState(() {
      widget.coursesModel.changeTest(index, grade);
    });
  }

  _changeGradeWorks(int index, double grade) {
    setState(() {
      widget.coursesModel.changeWorks(index, grade);
    });
  }

  String _getNameTest(int e) {
    if (e < 2) {
      return "P" + (e + 1).toString();
    } else if (e == 2) {
      return "PS1";
    } else if (e > 2 && e < 5) {
      return "P" + e.toString();
    } else if (e == 5) {
      return "PS2";
    } else {
      return "+P" + (e - 1).toString();
    }
  }

  Widget _gradeGrid() {
    var test = widget.coursesModel.getTest();
    var works = widget.coursesModel.getWorks();
    return ListView(
        children: widget.coursesModel
            .getIndex()
            .map(
              (e) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  e < test.length - 1
                      ? GradeWidget(
                          id: e,
                          nameGrade: _getNameTest(e),
                          grade: test[e].toString(),
                          changeGrade: _changeGradeTest,
                          edit: editWeight,
                        )
                      : Container(
                          width: 160,
                        ),
                  e < test.length - 1
                      ? WeightWidget(
                          edit: editWeight,
                          weight: 1.7,
                        )
                      : Container(
                          width: 50,
                        ),
                  e < works.length - 1
                      ? GradeWidget(
                          id: e,
                          nameGrade: "T" + (e + 1).toString(),
                          grade: works[e].toString(),
                          changeGrade: _changeGradeWorks,
                          edit: editWeight,
                        )
                      : Container(
                          width: 160,
                        ),
                  e < works.length - 1
                      ? WeightWidget(
                          edit: editWeight,
                          weight: 1.6,
                        )
                      : Container(
                          width: 50,
                        ),
                ],
              ),
            )
            .toList());
  }

  Widget _meanFinal() {
    return Container(
      width: 360,
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Text("Média de Prova:",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    )),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.white, width: 1)),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      key: Key(
                          widget.coursesModel.getMeanTest().toStringAsFixed(1)),
                      initialValue:
                          widget.coursesModel.getMeanTest().toStringAsFixed(1),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      onChanged: (s) => print(s),
                    ),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Text("Média de Trabalho:",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    )),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.white, width: 1)),
                    ),
                    width: 50,
                    height: 50,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      key: Key(widget.coursesModel
                          .getMeanWorks()
                          .toStringAsFixed(1)),
                      initialValue:
                          widget.coursesModel.getMeanWorks().toStringAsFixed(1),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      onChanged: (s) => print(s),
                    ),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Text("Média de Final:",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.white, width: 1)),
                    ),
                    width: 50,
                    height: 50,
                    child: TextFormField(
                      key: Key(widget.coursesModel
                          .getMeanFinal()
                          .toStringAsFixed(1)),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                      initialValue:
                          widget.coursesModel.getMeanFinal().toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      onChanged: (s) => print(s),
                    ),
                  )),
            ],
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(secondaryColorDark),
            ),
            onPressed: () => print("object"),
            child: const Text(
              "Mínimo Esforço",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _meanPartial(String meanTest, String meanWork, String meanFinal) {
    return Container(
      width: 360,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: Text("Média de Prova:",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: Text(meanTest,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    )),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Média de Trabalho:",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(meanWork,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    )),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: Text("Média de Final:",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Text(widget.coursesModel.getMeanFinal().toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _mean() {
    return changeMeanWidget
        ? _meanPartial(
            widget.coursesModel.getMeanTestPartial().toStringAsFixed(1),
            widget.coursesModel.getMeanWorksPartial().toStringAsFixed(1),
            widget.coursesModel.getMeanFinalPartial().toStringAsFixed(1),
          )
        : _meanFinal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(widget.coursesModel.getTitle()),
        backgroundColor: primaryColorDark,
        actions: [
          IconButton(
              onPressed: () => _clickEditWeightButton(), icon: Icon(Icons.edit))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: _gradeGrid(),
          )),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8.0, 0),
            child: Container(
              color: primaryColorDark,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(8),
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () => _changeMeanButton(true),
                            child: const Text(
                              "Média Parcial",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                      Container(
                          padding: const EdgeInsets.all(8),
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () => _changeMeanButton(false),
                            child: const Text(
                              "Média Final",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          )),
                    ],
                  ),
                  _mean(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
