import 'package:cell_counter/colors.dart';
import 'package:cell_counter/widgets/genericButton.dart';
import 'package:cell_counter/widgets/genericButtonOnPress.dart';
import 'package:cell_counter/widgets/sidebar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // titleSpacing: 250,
        title: Center(
          child: SizedBox(
            height: 270, // Ajusta la altura según sea necesario
            width: 300, // Ajusta el ancho según sea necesario
            child:
                Image.asset("assets/cellStudy-02.png", fit: BoxFit.values[1]),
          ),
        ),
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Container(
          width: 360,
          height: 800,
          alignment: Alignment.topCenter,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const ListTile(
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
                  const SizedBox(width: 17), // Espacio de 20 unidades de ancho
                  const GenericButton(
                    name: "Contador",
                    iconData: Icons.calculate,
                    routeToNav: "counterForm",
                    inv: true,
                  ),
                  const SizedBox(width: 22), // Espacio de 20 unidades de ancho
                  GenericButtonOnPress(
                    name: "Mis Archivos",
                    iconData: Icons.file_open_sharp,
                    //routeToNav: "myFiles",
                    onPress: () {
                      Navigator.pushNamed(context, "myFiles",
                          arguments: {'samplesList': null});
                    },
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
