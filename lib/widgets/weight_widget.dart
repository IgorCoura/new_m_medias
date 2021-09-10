import 'package:flutter/material.dart';

class WeightWidget extends StatelessWidget {
  final bool edit;
  final double weight;
  final Function(int index, double grade) changeWeight;
  final int id;
  const WeightWidget({
    Key? key,
    required this.edit,
    required this.weight,
    required this.id,
    required this.changeWeight,
  }) : super(key: key);

  _textWidget() {
    return Container(
      width: 45,
      child: Text("x" + weight.toStringAsFixed(1),
          style: const TextStyle(
              color: Color(0xffaeaeae),
              fontSize: 16,
              fontWeight: FontWeight.bold)),
    );
  }

  _editWeight() {
    return Container(
      width: 75,
      child: TextFormField(
        keyboardType: TextInputType.number,
        key: Key(
          "x" + weight.toStringAsFixed(1),
        ),
        initialValue: "x" + weight.toStringAsFixed(1),
        decoration: const InputDecoration(),
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        onFieldSubmitted: (w) =>
            changeWeight(id, double.parse(w.replaceAll("x", ""))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
        alignment: Alignment.bottomCenter,
        child: edit ? _editWeight() : _textWidget());
  }
}
