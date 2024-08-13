import 'package:cell_counter/widgets/myInkWell.dart';
import 'package:cell_counter/widgets/myScaffold.dart';
import 'package:flutter/material.dart';

class Theory extends StatefulWidget {
  const Theory({Key? key}) : super(key: key);

  @override
  _TheoryState createState() => _TheoryState();
}

class _TheoryState extends State<Theory> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return const MyScaffold(
        title: "Teoría",
        body: Padding(
          padding: EdgeInsets.all(18.0),
          child: Column(
            children: [
              MyInkWell(title: "Cálculos", nextTo: 'calculations'),
              MyInkWell(title: "Cámara de Neubauer", nextTo: 'neubauerCam'),
              MyInkWell(title: "Conteo Celular", nextTo: 'cellCounter'),
              MyInkWell(title: "Procedimientos", nextTo: 'procedures'),
            ],
          ),
        ));
  }
}
