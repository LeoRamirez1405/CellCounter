import 'package:cell_counter/colors.dart';
import 'package:cell_counter/widgets/genericButton.dart';
import 'package:cell_counter/widgets/genericButtonOnPress.dart';
import 'package:cell_counter/widgets/sidebar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: SizedBox(
              // height: 270, // Ajusta la altura según sea necesario
              // width: 300, // Ajusta el ancho según sea necesario
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Padding(
                  padding: const EdgeInsets.only(right: 40.0),
                  child: Image.asset("assets/cellStudy-02.png",
                      fit: BoxFit.values[1]),
                ),
              ),
            ),
          ),
        ),
        drawer: const MyDrawer(),
        body: Container(
          width: 360,
          height: 700,
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.only(top: 100),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: 150,
                    height: 150,
                    child: Image.asset("assets/icon/icon.png")),
                const ListTile(
                  tileColor: text_Color_white,
                  title: GenericButton(
                    name: "Teoría",
                    iconData: Icons.book,
                    routeToNav: "theory",
                    inv: true,
                  ),
                ),
                Container(
                  width: double
                      .infinity, // Asegura que el contenedor ocupe todo el ancho disponible
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 18),
                    child: Center(
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center, // Centra los elementos
                        children: [
                          Expanded(
                            child: GenericButton(
                              name: "Contador",
                              iconData: Icons.calculate,
                              routeToNav: "counterForm",
                              inv: true,
                            ),
                          ),
                          const SizedBox(
                              width: 20), // Espacio de 22 unidades de ancho
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: GenericButtonOnPress(
                                name: "Mis Archivos",
                                iconData: Icons.file_open_sharp,
                                onPress: () {
                                  Navigator.pushNamed(context, "myFiles",
                                      arguments: {'samplesList': null});
                                },
                                inv: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const ListTile(
                  tileColor: text_Color_white,
                  title: GenericButton(
                    name: "Acerca De",
                    iconData: Icons.question_answer_rounded,
                    routeToNav: "about",
                    inv: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
