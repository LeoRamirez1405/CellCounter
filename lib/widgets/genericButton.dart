import 'package:flutter/material.dart';
import 'package:cell_counter/colors.dart'; // Asegúrate de que este archivo existe y contiene las definiciones de color mencionadas

class GenericButton extends StatelessWidget {
  final String name;
  final IconData iconData;
  final String routeToNav;
  final bool inv; // Cambiado a lowercase 'b'

  // Constructor para pasar los parámetros necesarios
  const GenericButton({
    required this.name,
    required this.iconData,
    required this.routeToNav,
    required this.inv,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determina los colores basados en el valor de 'inv'
    Color buttonBackgroundColor = inv ? primary_en : text_Color_white;
    // Color shadowColor = inv ? primary_dis : text_Color_white;
    Color textColor = inv ? text_Color_white : primary_en;

    return MaterialButton(
      onPressed: () {
        if (routeToNav != "") {
          Navigator.pushReplacementNamed(context, routeToNav);
        }
        // setState(() {});
      },
      color: buttonBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(10), // Radio de las esquinas redondeadas
      ),
      child: Row(
        // padding: const EdgeInsets.all(8.0), // Espacio alrededor del contenido del botón
        mainAxisAlignment:
            MainAxisAlignment.center, // Centrar el contenido horizontalmente
        children: [
          Icon(iconData, color: textColor), // Muestra el ícono proporcionado
          const SizedBox(width: 8), // Espacio entre el ícono y el texto
          Container(
            // width: 100, // Define un ancho fijo para el texto
            child: Text(
              name,
              textAlign: TextAlign.center, // Alinea el texto al centro
              style: TextStyle(color: textColor),
            ),
          ),
        ],
      ),
    );
  }
}
