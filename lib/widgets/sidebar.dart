import 'package:cell_counter/colors.dart';
import 'package:cell_counter/widgets/genericButton.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Drawer();
  }
}

class _Drawer extends StatelessWidget {
  const _Drawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the inv. This ensures the user can scroll
      // through the options in the inv if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: text_Color_white),
            child: Image.asset("assets/cellStudy-04.png"),
          ),
          const ListTile(
            tileColor: text_Color_white,
            title: GenericButton(
              name: "Inicio",
              inv: false,
              iconData: Icons.home,
              routeToNav: "home",
            ),
          ),
          const ListTile(
            tileColor: text_Color_white,
            title: GenericButton(
                name: "Contador",
                iconData: Icons.calculate,
                routeToNav: "counter",
                inv: false),
          ),
          const ListTile(
            tileColor: text_Color_white,
            title: GenericButton(
                name: "Teoría",
                iconData: Icons.book,
                routeToNav: "theory",
                inv: false),
          ),
          const ListTile(
            tileColor: text_Color_white,
            title: GenericButton(
                name: "Mis Archivos",
                iconData: Icons.file_open,
                routeToNav: "myFiles",
                inv: false),
          ),
          const ListTile(
            tileColor: text_Color_white,
            title: GenericButton(
              name: "Acerca De",
              iconData: Icons.question_answer_rounded,
              routeToNav: "about",
              inv: false,
            ),
          ),
        ],
      ),
    );
  }
}
