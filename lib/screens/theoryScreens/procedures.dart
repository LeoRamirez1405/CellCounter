import 'package:cell_counter/widgets/textHelper.dart';
import 'package:cell_counter/widgets/theoryScaffold.dart';
// import 'package:cell_counter/widgets/sidebar.dart';
import 'package:flutter/material.dart';

class Procedures extends StatelessWidget {
  const Procedures({super.key});

  @override
  Widget build(BuildContext context) {
    return TheoryScaffold(
      title: "Procedimientos",
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TextHelper(
              header: "¿Cuáles son los pasos para realizar el conteo celular?",
              body: Text(
                """1.	Preparación de la muestra
        2.	Introducción de la muestra en la Cámara de Neubauer
        3.	Preparación del microscopio y enfoque
        4.	Cálculos
          """,
                textAlign: TextAlign.center,
              ),
            ),
            const TextHelper(
              header: "¿Cómo se prepara el homogenado celular?",
              body: Text(
                """1.	Para células que crecen en monocapas, se desprenden de la superficie usando tripsina
        2.	Diluir las células según sea necesario para obtener una suspensión uniforme. Dispersar cualquier grumo.
        
          """,
                textAlign: TextAlign.center,
              ),
            ),
            const TextHelper(
              header: "¿Cuál es el procedimiento a seguir con el tripán azul?",
              body: Text(
                """Se realiza una mezcla con suspensión de células que sea equivalente 1:1 a la solución de azul
        de tripán 0.4%, se toma 10-15 μL de la solución y se lleva a la cámara de Neubauer previa
        limpieza de este instrumento con etanol al 70%, luego examinar con un microscopio. La cámara de Neubauer
        está delineada por líneas de cuadrícula que identifican las zonas de la cámara, con cuatro zonas que
        están divididas por 16 cuadrados pequeños Se realiza el recuento del número de células viables (sin teñir)
        y no viables (teñidas), en cada una de las 4 zonas.
          """,
                textAlign: TextAlign.center,
              ),
            ),
            const TextHelper(
              header: "¿Cómo se prepara la cámara de Neubauer?",
              body: Text(
                """1.	Limpiar la superficie de la cámara y el cubreobjetos con alcohol al 70%. Tanto el portaobjetos como el cubreobjetos deben estar limpios, secos, y libres de pelusas, huellas dactilares y marcas de agua. 
        2.	Coloca el cubreobjetos en la parte central de la cámara de Neubauer y presiona firmemente en esa posición. 
        
        TIP: Algunos investigadores colocan una pequeña cantidad de alcohol o agua en el área de vidrio esmerilado de la cámara de Neubauer, sobre el que se apoya el cubreobjetos, para mejorar el sellado
        
          """,
                textAlign: TextAlign.center,
              ),
            ),
            TextHelper(
              header:
                  "¿Cómo se procede para introducir la muestra a la cámara de Neubauer?",
              body: Column(
                children: [
                  const Text(
                    """Toma 10 μL de la preparación diluida en el paso 1 con la micropipeta.
        1.	Coloca el cristal de la cámara de Neubauer en el área central. Para colocar la cámara, usa una superficie plana, por ejemplo, una mesa. 
        2.	Añada una punta desechable a la micropipeta  
        3.	Ajuste la micropipeta a 10 μL. 
        4.	Introduce la punta de la micropipeta en la dilución previamente preparada en el paso 1. 
        5.	Tome la muestra diluida lentamente hasta que se haya cogido la cantidad especificada. 
        6.	Remueva la punta de la pipeta de la dilución y llévela a la cámara de Neubauer. La pipeta cargada debe sostenerse siempre en posición vertical. 
        7.	Coloca la punta de la pipeta cerca del cristal, justo en el centro de la cámara de Neubauer. 
        8.	Libere el líquido lentamente, observando como entra en la cámara de forma uniforme, siendo absorbido por capilaridad 
        9.	Si aparecen burbujas o se mueve el cristal, repita la operación. 
        10.	Llenar la segunda cámara de igual manera
          """,
                    textAlign: TextAlign.center,
                  ),
                  Image.asset("assets/proced1.jpg"),
                  const Text(
                    """
        La cámara de Neubauer ya ha sido cargada y se comienza el conteo celular.""",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            TextHelper(
              header:
                  "¿Cómo se procede para introducir la muestra a la cámara de Neubauer?",
              body: Column(
                children: [
                  const Text(
                    """
         1.	Coloque la cámara de Neubauer en el microscopio. Si el microscopio cuenta con una abrazadera de fijación, fije la cámara de Neubauer. 
        2.	Encienda la luz del microscopio 
        3.	Enfoque el microscopio hasta que se pueda ver una imagen clara de las células. 
        4.	Busque el primer cuadrante de la cuadrícula de conteo donde comenzará el conteo de células. 
        En la siguiente imagen se señalan los 5 cuadrantes grandes de una cámara 
        
        """,
                    textAlign: TextAlign.center,
                  ),
                  Image.asset("assets/proced2.png"),
                  const Text(
                    """5.	Comience a contar las células en el primer cuadrante. Los laboratorios tienen diferentes protocolos para contar células, pero una regla muy popular es:
        Las células que tocan los límites superior e izquierdo se cuentan, pero las que tocan los límites inferior y derecho no serán contadas.
        """,
                    textAlign: TextAlign.center,
                  ),
                  Image.asset("assets/proced3.png"),
                  const Text(
                    """TIP: En caso de que hay una alta concentración celular, será más fácil perderse contando células. Es por ello que se recomienda contar en zigzag.
        """,
                    textAlign: TextAlign.center,
                  ),
                  Image.asset(
                    "assets/proced4.jpg",
                    height: 200,
                    width: 200,
                  ),
                  const Text(
                    """
        6. Escribe la cantidad de células contadas en el primer cuadrante. 
        7. Repite el proceso para los cuadrantes restantes, escribe los resultados del conteo para cada uno de ellos. Mientras más células se cuenten, mayor será la veracidad del conteo.
        
        
        """,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
