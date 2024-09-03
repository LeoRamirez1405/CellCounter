import 'package:cell_counter/widgets/myScaffold.dart';
import 'package:cell_counter/widgets/textHelper.dart';
// import 'package:cell_counter/widgets/sidebar.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: "Acerca De ...",
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const TextHelper(
                header: 'Desarrolladores',
                body: Text(
                  """Leonardo Javier Ramirez Calatayud\nJordi Hernández Delgado\n""",
                  textAlign: TextAlign.center,
                )),
            const TextHelper(
                header: 'Asesora',
                body: Text(
                  """Dra C. Laura Lazo Vázquez\n""",
                  textAlign: TextAlign.center,
                )),
            const TextHelper(
                header: 'Versión de la Aplicación',
                body: Text(
                  """1.0\n""",
                  textAlign: TextAlign.center,
                )),
            const TextHelper(
                header: 'Contacto',
                body: Text(
                  """cellStudy.app@gmail.com\n""",
                  textAlign: TextAlign.center,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/bio.png', width: 100, height: 100),
                Image.asset('assets/matcom.png', width: 100, height: 100),
                Image.asset('assets/uh.png', width: 100, height: 100),
              ],
            ),
            Image.asset('assets/cigb.png', width: 100, height: 100),
          ],
        ),
      ),
    );
  }
}
