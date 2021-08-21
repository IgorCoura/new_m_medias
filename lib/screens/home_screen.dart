import 'package:flutter/material.dart';
import 'package:new_m_medias/models/courses_model.dart';
import 'package:new_m_medias/models/student_model.dart';
import 'package:new_m_medias/utilities/colors_utils.dart';
import 'package:new_m_medias/widgets/card_widget.dart';

class HomeScreen extends StatefulWidget {
  final StudentModel studentModel;

  const HomeScreen({
    Key? key,
    required this.studentModel,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _refresh(CoursesModel c) {
    setState(() {
      c.updateMeanFinal();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColorDark,
        title: const Text("Aluno J"),
      ),
      body: ListView(
          padding: const EdgeInsets.all(8),
          children: widget.studentModel.getListCoursesModel().map((e) {
            return CardWidget(
              coursesModel: e,
              refresh: _refresh,
            );
          }).toList()),
    );
  }
}
