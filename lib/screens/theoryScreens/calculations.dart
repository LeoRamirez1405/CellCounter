import 'package:cell_counter/widgets/textHelper.dart';
import 'package:cell_counter/widgets/theoryScaffold.dart';
// import 'package:cell_counter/widgets/sidebar.dart';
import 'package:flutter/material.dart';

class Calculations extends StatelessWidget {
  const Calculations({super.key});

  @override
  Widget build(BuildContext context) {
    return TheoryScaffold(
      title: "Cálculos",
      body: SingleChildScrollView(
        child: Column(children: [
          TextHelper(
            header: "¿Cuáles son las fórmulas para realizar los cálculos?",
            body: Image.asset('assets/formulas_1.png'),
          ),
          const TextHelper(
            header: "¿Viabilidad o Vitalidad?",
            body: Text(
                "Viabilidad es un termino muy de  laboratorio, la palabra correcta seria  vitalidad porque el investigador solo sabe  en el momento que observa al microscopio  cuántas células estan vivas, ellas no se  mantienen en ese estado en el tiempo"),
          ),
          const TextHelper(
            header:
                "¿Qué representa 10^4 en la  expresión para determinar la  concentración celular?",
            body: Text(
                "Factor de corrección del volumen para la cámara de Neubauer, teniendo en cuenta  que cada cuadrante es 1x1 mm y su  profundidad es 0.1 mm"),
          ),
          TextHelper(
            header:
                "¿Cómo sembrar las células a una  concentración deseada en un  volumen determinado?",
            body: Column(children: [
              const Text(
                  """Para ello se debe emplear la ley de la volumetria. La expresión resultante permitirá determinar qué volumen del homogenado celular se debe tomar para  que las células estén a determina concentración en el volumen especificado."""),
              Image.asset('assets/formulas_2.png'),
            ]),
          ),
        ]),
      ),
    );
  }
}
