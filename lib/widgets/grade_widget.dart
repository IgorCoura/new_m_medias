import 'package:flutter/material.dart';

class GradeWidget extends StatelessWidget {
  final String nameGrade;
  final String grade;

  const GradeWidget({
    Key? key,
    required this.nameGrade,
    required this.grade,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Row(
        children: [
          Text(
            this.nameGrade + ":",
            style: TextStyle(
                color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Container(
            alignment: Alignment.center,
            width: 75,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.white, width: 1)),
            ),
            padding: EdgeInsets.all(4),
            child: Text(
              this.grade,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
