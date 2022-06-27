import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/components/cronometro.dart';
import 'package:pomodoro/components/entrada_tempo.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class PomodoroPage extends StatelessWidget {
  const PomodoroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Expanded(
          child: Cronometro(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Observer(builder: (context) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                EntradaTempo(
                  inc: store.iniciado && store.estaTrabalhando()
                      ? null
                      : store.incrementarTempoTrabalho,
                  dec: store.iniciado && store.estaTrabalhando()
                      ? null
                      : store.decrementarTempoTrabalho,
                  titulo: "Trabalho",
                  valor: store.tempoTrabalho,
                ),
                EntradaTempo(
                  inc: store.iniciado && !store.estaTrabalhando()
                      ? null
                      : store.incrementarTempoDescanso,
                  dec: store.iniciado && !store.estaTrabalhando()
                      ? null
                      : store.decrementarTempoDescanso,
                  titulo: "Descanso",
                  valor: store.tempoDescanso,
                ),
              ],
            );
          }),
        ),
      ],
    ));
  }
}
