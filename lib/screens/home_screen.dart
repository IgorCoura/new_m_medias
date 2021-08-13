import 'package:flutter/material.dart';
import 'package:new_m_medias/models/courses_model.dart';
import 'package:new_m_medias/models/student_model.dart';
import 'package:new_m_medias/utilities/colors_utils.dart';
import 'package:new_m_medias/widgets/card_widget.dart';

class HomeScreen extends StatelessWidget {
  final StudentModel studentModel;

  HomeScreen({
    Key? key,
    required this.studentModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColorDark,
        title: Text("Aluno J"),
      ),
      body: ListView(
          padding: EdgeInsets.all(8),
          children: studentModel.getListCoursesModel().map((e) {
            return CardWidget(
              coursesModel: e,
            );
          }).toList()),
    );
  }
}
