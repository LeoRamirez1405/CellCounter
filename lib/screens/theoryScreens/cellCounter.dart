import 'package:cell_counter/widgets/textHelper.dart';
import 'package:cell_counter/widgets/theoryScaffold.dart';
// import 'package:cell_counter/widgets/sidebar.dart';
import 'package:flutter/material.dart';

class CellCounter extends StatelessWidget {
  const CellCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return TheoryScaffold(
      title: "Conteo Celular",
      body: SingleChildScrollView(
        child: Column(children: [
          const TextHelper(
              header:
                  "¿Por qué es importante determinar el número de células en una preparación o cultivo?",
              body: Text(
                """1. Para monitorear el crecimiento y la proliferación celular. Esto es esencial en la investigación en biología celular, el desarrollo de medicamentos y el diagnóstico de enfermedades. 
2. Para garantizar resultados precisos y reproducibles.
3. Para calibrar experimentos y análisis; medir la actividad enzimática, la expresión génica y otras mediciones biológicas.
4. Para garantizar la calidad y la efectividad de medicamentos 
5. Para la detección y seguimiento de diversas enfermedades, incluyendo cáncer infecciones virales y trastornos""",
                textAlign: TextAlign.justify,
              )),
          const TextHelper(
            header:
                "¿Qué materiales son necesarios  para realizar el conteo celular?",
            body: Text(
              """
- Etanol al 70 %  
- Homogenado celular  
- Tripán azul al 0.4%  
- Cámara de Neubauer  
- Contador""",
              textAlign: TextAlign.center,
            ),
          ),
          const TextHelper(
            header:
                "¿Cómo se determina la concentración celular y cómo se cuentan las células?",
            body: Text(
              """
La suspensión celular se aplica a un volumen definido y se cuenta para poder calcular la concentración celular, la que puede determinarse mediante la tinción con el tripán azul. Las células se pueden contar directamente en un microscopio con la ayuda de la cámara de Neubauer.
        """,
              textAlign: TextAlign.justify,
            ),
          ),
          const TextHelper(
            header: "¿Qué es el tripán azul?",
            body: Text(
              """
El tripán azul es un colorante que deja las células muertas con un color azul al ser observadas bajo un microscopio, mientras que las células viables aparecen sin teñir, blancas o con un halo azul. Las células viables tienen membranas celulares intactas, estas son selectivas a los compuestos que dejan pasar y, por ende, no permiten el ingreso de tinciones en la célula siendo no absorbido el azul de tripán por estas
        """,
              textAlign: TextAlign.justify,
            ),
          ),
          Image.asset("assets/conteo1.png"),
          const TextHelper(
            header:
                "¿Qué precauciones se deben tener en cuenta durante la preparación de la muestra?",
            body: Text(
              """
En función del tipo de muestra, para el conteo celular se preparará una dilución con una concentración viable.
Típicamente, el rango de concentración para el conteo celular con la cámara de Neubauer está entre 250.000 células/mL y 2,5 millones células/mL.
Se recomienda que la concentración de la dilución esté sobre las 106 células/mL (1 millón células/mL), aplicando las diluciones requeridas.
Con concentraciones por debajo de 2.5 millones de células/mL, la cantidad de células contadas no será suficiente para obtener una estimación apropiada de la concentración original. 
Por encima de 2.5 millones de células/mL (2,5∙10^6 células/mL), aumenta la probabilidad de errores de conteo, así como el tiempo y esfuerzo necesarios para lograr un conteo de células confiable.
Por encima de 2.5 millones de células/mL, es preferible diluir la muestra para obtener una concentración final cercana a 1 millón de células por mL.
TIP: Escribe la dilución empleada en la muestra original. 

        """,
              textAlign: TextAlign.justify,
            ),
          ),
        ]),
      ),
    );
  }
}
