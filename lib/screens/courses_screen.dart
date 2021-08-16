import 'package:flutter/material.dart';
import 'package:new_m_medias/models/courses_model.dart';
import 'package:new_m_medias/utilities/colors_utils.dart';
import 'package:new_m_medias/widgets/grade_widget.dart';
import 'package:new_m_medias/widgets/mean_final_widget.dart';

class CoursesScreen extends StatefulWidget {
  final CoursesModel coursesModel;

  CoursesScreen({
    Key? key,
    required this.coursesModel,
  }) : super(key: key);

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  bool changeWidget = true;

  _clickButton(bool change) {
    setState(() {
      if (change) {
        changeWidget = true;
      } else {
        changeWidget = false;
      }
    });
  }

  Widget _gradeGrid() {
    var test = this.widget.coursesModel.getTest();
    var works = this.widget.coursesModel.getWorks();
    return ListView(
        children: this
            .widget
            .coursesModel
            .getIndex()
            .map(
              (e) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  e < test.length
                      ? GradeWidget(
                          id: e,
                          nameGrade: "P" + (e + 1).toString(),
                          grade: test[e].toString(),
                          changeGrade: this.widget.coursesModel.changeTest)
                      : Container(
                          width: 160,
                        ),
                  e < works.length
                      ? GradeWidget(
                          id: e,
                          nameGrade: "T" + (e + 1).toString(),
                          grade: works[e].toString(),
                          changeGrade: this.widget.coursesModel.changeWorks)
                      : Container(
                          width: 160,
                        ),
                  //works[e].isNaN?Container():GradeWidget(id: e, nameGrade: "T"+(e+1).toString(), grade: works[e].toString(), changeGrade: coursesModel.changeWorks),
                ],
              ),
            )
            .toList());
  }

  Widget _meanFinal(String meanTest, String meanWork, String meanFinal) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
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
                    child: TextFormField(
                      initialValue: meanFinal,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                      style: TextStyle(
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
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Text("Média de Trabalho:",
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
                    child: TextFormField(
                      initialValue: meanFinal,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                      style: TextStyle(
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
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
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
                    width: 50,
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                      initialValue: meanFinal,
                      style: TextStyle(
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
            child: Text(
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
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: Text("Média de Prova:",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: Text(meanTest,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    )),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Média de Trabalho:",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(meanWork,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    )),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: Text("Média de Final:",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(meanFinal,
                    style: TextStyle(
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
    return changeWidget
        ? _meanPartial(
            this.widget.coursesModel.getMeanTestPartial().toStringAsFixed(1),
            this.widget.coursesModel.getMeanWorksPartial().toStringAsFixed(1),
            this.widget.coursesModel.getMeanFinalPartial().toStringAsFixed(1),
          )
        : _meanFinal(
            this.widget.coursesModel.getMeanTestPartial().toStringAsFixed(1),
            this.widget.coursesModel.getMeanWorksPartial().toStringAsFixed(1),
            this.widget.coursesModel.getMeanFinalPartial().toStringAsFixed(1),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(widget.coursesModel.getTitle()),
        backgroundColor: primaryColorDark,
      ),
      body: Column(
        children: [
          Expanded(child: _gradeGrid()),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8.0, 0),
              child: Container(
                color: primaryColorDark,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            padding: EdgeInsets.all(8),
                            alignment: Alignment.center,
                            child: TextButton(
                              onPressed: () => _clickButton(true),
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
                            padding: EdgeInsets.all(8),
                            alignment: Alignment.center,
                            child: TextButton(
                              onPressed: () => _clickButton(false),
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
          ),
        ],
      ),
    );
  }
}
