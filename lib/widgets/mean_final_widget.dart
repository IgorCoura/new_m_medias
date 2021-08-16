import 'package:flutter/material.dart';

class MeanFinalWidget extends StatelessWidget {
  final String meanTest;
  final String meanWork;
  final String meanFinal;

  const MeanFinalWidget({
    Key? key,
    required this.meanTest,
    required this.meanFinal,
    required this.meanWork,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: Container(
                    width: 50,
                    height: 50,
                    child: TextFormField(
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
        ],
      ),
    );
  }
}
