import 'package:cell_counter/widgets/textHelper.dart';
import 'package:cell_counter/widgets/theoryScaffold.dart';
// import 'package:cell_counter/widgets/sidebar.dart';
import 'package:flutter/material.dart';

class NeubauerCam extends StatelessWidget {
  const NeubauerCam({super.key});
  static String camExplain =
      """ La cámara de Neubauer es un portaobjetos de vidrio grueso con una zona central diseñada como una cámara para contar. El diseño exacto puede variar. La parte central es la plataforma de conteo, la cual está rodeada por una ranura de 1 mm. Una ranura transversal divide esta plataforma en dos cámaras, cada una de las cuales consta de una placa de pie plateada en la que esta grabada una rejilla de 3x3 mm. Esta cuadrícula se subdivide en nueve cuadrados de 1x1 mm. Las células generalmente se cuentan en cuatro cuadrantes externos y el cuadrante central. Los primeros se dividen a su vez en 16 cuadrados terciarios y este último en 25 cuadrados terciarios para ayudar a contar. Acompañando al portaobjetos de la cámara de Neubauer hay un cubreobjetos grueso y de superficie uniforme. Los cubreobjetos comunes pueden tener superficies irregulares, lo que puede introducir errores en el recuento de células; por lo tanto, es imperativo que se utilice el cubreobjetos proporcionado con la cámara de Neubauer para determinar el número de células.
""";

  @override
  Widget build(BuildContext context) {
    return TheoryScaffold(
      title: "Cámara de Neubauer",
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              TextHelper(
                  header: """
      ¿Qué características tiene la  cámara de Neubauer?""",
                  body: Text(
                    camExplain,
                    textAlign: TextAlign.center,
                  )),
              Image.asset("assets/neubauer.png"),
            ],
          ),
        ),
      ),
    );
  }
}
