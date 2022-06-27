import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pomodoro/pages/entrada_tempo.dart';

class PomodoroPage extends StatelessWidget {
  const PomodoroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Podomoro"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              EntradaTempo(
                titulo: "Trabalho",
                valor: 25,
              ),
              EntradaTempo(
                titulo: "Descanso",
                valor: 5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
