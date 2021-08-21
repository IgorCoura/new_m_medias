import 'package:flutter/material.dart';
import 'package:new_m_medias/models/courses_model.dart';
import 'package:new_m_medias/screens/courses_screen.dart';
import 'package:new_m_medias/utilities/colors_utils.dart';

class CardWidget extends StatelessWidget {
  final CoursesModel coursesModel;
  final Function(CoursesModel c) refresh;
  const CardWidget({
    Key? key,
    required this.coursesModel,
    required this.refresh,
  }) : super(key: key);

  _clickButton(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CoursesScreen(
                  coursesModel: coursesModel,
                ))).then((value) => refresh(coursesModel));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () => _clickButton(context),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(primaryColor),
                alignment: Alignment.center,
                fixedSize:
                    MaterialStateProperty.all(const Size(double.infinity, 60)),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.fromLTRB(16, 0, 8, 0))),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    coursesModel.getTitle(),
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Text(
                    coursesModel.getMeanFinal().toStringAsFixed(1),
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            )),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
