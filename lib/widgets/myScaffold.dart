import 'package:cell_counter/colors.dart';
import 'package:cell_counter/widgets/sidebar.dart';
import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget {
  final String title;
  final Widget? body;

  const MyScaffold({
    required this.title,
    this.body,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, 'home');
        return true;
      },
      child: Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          backgroundColor: primary_en, // Establece el color de fondo del AppBar
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu), // Ícono del menú
              color: Colors.white, // Establece el color del ícono a blanco
              onPressed: () => Scaffold.of(context)
                  .openDrawer(), // Abre el drawer cuando se presiona el ícono
            ),
          ),
          title: Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 40.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    title,
                    style: const TextStyle(
                      color:
                          text_Color_white, // Usa el color que desees para el texto
                      fontSize: 24,
                      fontWeight:
                          FontWeight.w400, // Hace que el texto sea negrita
                      //fontFamily: 'MyCustomFont',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: body,
      ),
    );
  }
}
