import 'package:cell_counter/widgets/genericButtonOnPress.dart';
import 'package:cell_counter/widgets/myScaffold.dart';
import 'package:cell_counter/widgets/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:cell_counter/widgets/genericButton.dart';
import 'package:cell_counter/model.dart';

class SiembraResult extends StatelessWidget {
  final List<Sample> samplesList;
  final double concentracion;
  final double vol;

  const SiembraResult(
      {super.key,
      required this.samplesList,
      required this.concentracion,
      required this.vol});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: "Resultados",
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 550,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Nombre')),
                  DataColumn(label: Text('Volumen a tomar (mL)')),
                  // DataColumn(label: Text('Concentración Homogenado')),
                ],
                rows: List<DataRow>.generate(
                  samplesList.length,
                  (index) {
                    final sample = samplesList[index];
                    sample.concentracionSiembra = concentracion;
                    sample.volumenSiembra = vol;
                    return DataRow(
                      cells: [
                        DataCell(Center(child: Text(sample.name.toString()))),
                        DataCell(Center(
                            child: Text(_roundToTwoDecimals(sample.volAtomar)
                                .toString()))),
                        // DataCell(Center(
                        //     child: Text(sample.concentracionHomogenado.toString()))),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: GenericButtonOnPress(
                name: "Regresar",
                iconData: Icons.done,
                onPress: () {
                  Navigator.pushNamed(context, "myFiles",
                      arguments: {'samplesList': samplesList});
                },
                inv: true),
          ),
        ],
      ),
    );
  }
}

double _roundToTwoDecimals(double value) {
  return double.parse(value.toStringAsFixed(2));
}
