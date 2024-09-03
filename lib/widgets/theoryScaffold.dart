import 'package:cell_counter/colors.dart';
import 'package:cell_counter/widgets/sidebar.dart';
import 'package:flutter/material.dart';

class TheoryScaffold extends StatelessWidget {
  final String title;
  final Widget? body;

  const TheoryScaffold({
    required this.title,
    this.body,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, 'theory');
        return true;
      },
      child: Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          backgroundColor:
              primary_en, // Establece el color de fondo del AppBar en negro
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.arrow_back_ios), // Ícono del menú
              color: Colors.white, // Establece el color del ícono a blanco
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'theory');
              }, // Abre el drawer cuando se presiona el ícono
            ),
          ),

          title: Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 45.0),
              child: Text(
                title,
                style: const TextStyle(
                  color:
                      text_Color_white, // Usa el color que desees para el texto
                  fontSize: 24,
                  fontWeight: FontWeight.bold, // Hace que el texto sea negrita
                  //fontFamily: 'MyCustomFont',
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: body,
        ),
      ),
    );
  }
}
