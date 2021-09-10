import 'package:flutter/material.dart';

class GradeWidget extends StatelessWidget {
  final String nameGrade;
  final String grade;
  final Function(int index, double grade) changeGrade;
  final int id;
  final bool edit;

  const GradeWidget({
    Key? key,
    required this.id,
    required this.nameGrade,
    required this.grade,
    required this.changeGrade,
    required this.edit,
  }) : super(key: key);

  _modNormal() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Row(
        children: [
          Text(
            nameGrade + ":",
            style: const TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
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
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
                initialValue: grade,
              )),
        ],
      ),
    );
  }

  _modEdit() {
    return Container(
      width: 110,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Text(
            nameGrade + ":",
            style: const TextStyle(
                color: Color(0xffaeaeae),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              grade,
              style: const TextStyle(
                  color: Color(0xffaeaeae),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return edit ? _modEdit() : _modNormal();
  }
}
