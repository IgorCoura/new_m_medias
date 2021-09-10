import 'package:flutter/material.dart';

class WeightWidget extends StatelessWidget {
  final bool edit;
  final double weight;
  const WeightWidget({
    Key? key,
    required this.edit,
    required this.weight,
  }) : super(key: key);

  _textWidget() {
    return Text("x" + weight.toStringAsFixed(1),
        style: TextStyle(
            color: Color(0xffaeaeae),
            fontSize: 16,
            fontWeight: FontWeight.bold));
  }

  _editWeight() {
    return Container(
      width: 60,
      child: TextFormField(
        keyboardType: TextInputType.number,
        key: Key(
          "x1.7",
        ),
        initialValue: "x1.7",
        decoration: const InputDecoration(),
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        onChanged: (s) => print(s),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
        alignment: Alignment.bottomCenter,
        child: edit ? _editWeight() : _textWidget());
  }
}
