import 'package:flutter/material.dart';
import 'package:new_m_medias/models/courses_model.dart';
import 'package:new_m_medias/utilities/colors_utils.dart';
import 'package:new_m_medias/widgets/grade_widget.dart';
import 'package:new_m_medias/widgets/mean_widget.dart';

class CoursesScreen extends StatefulWidget {
  final CoursesModel coursesModel;

  CoursesScreen({
    Key? key,
    required this.coursesModel,
  }) : super(key: key);

  @override
  State<CoursesScreen> createState() =>
      _CoursesScreenState(coursesModel: coursesModel);
}

class _CoursesScreenState extends State<CoursesScreen> {
  bool changeWidget = true;
  final CoursesModel coursesModel;

  _CoursesScreenState({
    required this.coursesModel,
  });

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
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: coursesModel
                .getWorks()
                .asMap()
                .map((key, value) => MapEntry(
                    key,
                    GradeWidget(
                      nameGrade: "P" + (key + 1).toString(),
                      grade: value.toString(),
                    )))
                .values
                .toList(),
          ),
          Column(
            children: coursesModel
                .getWorks()
                .asMap()
                .map((key, value) => MapEntry(
                    key,
                    GradeWidget(
                      nameGrade: "T" + (key + 1).toString(),
                      grade: value.toString(),
                    )))
                .values
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _mean() {
    return changeWidget
        ? MeanWidget(
            meanTest: coursesModel.getMeanTestPartial().toStringAsFixed(1),
            meanWork: coursesModel.getMeanWorksPartial().toStringAsFixed(1),
            meanFinal: coursesModel.getMeanFinalPartial().toStringAsFixed(1),
          )
        : Column(
            children: [
              MeanWidget(
                meanTest: coursesModel.getMeanTestFinal().toStringAsFixed(1),
                meanWork: coursesModel.getMeanWorksFinal().toStringAsFixed(1),
                meanFinal: coursesModel.getMeanFinal().toStringAsFixed(1),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(secondaryColorDark),
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
          _gradeGrid(),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: Container(
              color: primaryColorDark,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                            padding: EdgeInsets.all(8),
                            alignment: Alignment.center,
                            child: TextButton(
                              onPressed: () => _clickButton(true),
                              child: Text(
                                "Média Parcial",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )),
                      ),
                      Expanded(
                        child: Container(
                            padding: EdgeInsets.all(8),
                            alignment: Alignment.center,
                            child: TextButton(
                              onPressed: () => _clickButton(false),
                              child: Text(
                                "Média Final",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                  _mean(),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
