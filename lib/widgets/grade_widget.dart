import 'package:flutter/material.dart';

class GradeWidget extends StatelessWidget {
  final String nameGrade;
  final String grade;
  final Function(int index, double grade) changeGrade;
  final int id;

  const GradeWidget({
    Key? key,
    required this.id,
    required this.nameGrade,
    required this.grade,
    required this.changeGrade,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Row(
        children: [
          Text(
            nameGrade + ":",
            style: const TextStyle(
                color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Container(
              alignment: Alignment.center,
              width: 75,
              decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.white, width: 1)),
              ),
              child: TextFormField(
                onFieldSubmitted: (s) => changeGrade(id, double.parse(s)),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
                initialValue: grade,
              )),
        ],
      ),
    );
  }
}
