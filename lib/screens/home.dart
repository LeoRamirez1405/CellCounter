import 'package:cell_counter/colors.dart';
import 'package:cell_counter/widgets/genericButton.dart';
import 'package:cell_counter/widgets/sidebar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 230,
        title: Center(
          child: SizedBox(
            height: 250, // Ajusta la altura según sea necesario
            width: 300, // Ajusta el ancho según sea necesario
            child: Image.asset("assets/cellStudy-02.png", fit: BoxFit.fitWidth),
          ),
        ),
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Container(
          width: 360,
          height: 800,
          alignment: Alignment.topCenter,
          child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  tileColor: text_Color_white,
                  title: GenericButton(
                      name: "Teoría",
                      iconData: Icons.book,
                      routeToNav: "theory",
                      inv: true),
                ),
                Center(
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 17), // Espacio de 20 unidades de ancho
                      GenericButton(
                        name: "Contador",
                        iconData: Icons.calculate,
                        routeToNav: "counter",
                        inv: true,
                      ),
                      SizedBox(width: 22), // Espacio de 20 unidades de ancho
                      GenericButton(
                        name: "Mis Archivos",
                        iconData: Icons.file_open_sharp,
                        routeToNav: "myFiles",
                        inv: true,
                      ),

                      // Continúa agregando SizedBox y más botones según sea necesario
                    ],
                  ),
                ),
                ListTile(
                  tileColor: text_Color_white,
                  title: GenericButton(
                    name: "Acerca De",
                    iconData: Icons.question_answer_rounded,
                    routeToNav: "about",
                    inv: true,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
