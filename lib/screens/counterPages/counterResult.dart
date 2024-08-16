import 'package:cell_counter/widgets/genericButtonOnPress.dart';
import 'package:cell_counter/widgets/myScaffold.dart';
import 'package:cell_counter/widgets/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:cell_counter/widgets/genericButton.dart';
import 'package:cell_counter/model.dart';

class CounterResult extends StatelessWidget {
  final List<Sample> samplesList;

  const CounterResult({super.key, required this.samplesList});

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
                  // DataColumn(label: Text('No.')),
                  DataColumn(label: Text('Nombre')),
                  DataColumn(
                      label: Text(
                    'Vivas',
                    style: TextStyle(color: Colors.green),
                  )),
                  DataColumn(
                      label: Text(
                    'Muertas',
                    style: TextStyle(color: Colors.red),
                  )),
                  DataColumn(label: Text('Total')),
                  DataColumn(label: Text('Viabilidad')),
                  DataColumn(label: Text('Volumen')),
                  DataColumn(label: Text('Dilución')),
                  // DataColumn(label: Text('Vivas')),
                  // DataColumn(label: Text('Muertas')),
                  DataColumn(label: Text('Células Totales Concentradas')),
                  // DataColumn(label: Text('Concentración Homogenado')),
                ],
                rows: List<DataRow>.generate(
                  samplesList.length,
                  (index) {
                    final sample = samplesList[index];
                    return DataRow(
                      cells: [
                        DataCell(Center(child: Text(sample.name.toString()))),

                        // DataCell(Center(child: Text((index + 1).toString()))),
                        DataCell(Center(
                            child: Text(sample.vivas.toString(),
                                style: TextStyle(color: Colors.green)))),
                        DataCell(Center(
                            child: Text(sample.muertas.toString(),
                                style: TextStyle(color: Colors.red)))),
                        DataCell(Center(child: Text(sample.total.toString()))),
                        DataCell(
                            Center(child: Text(sample.viabilidad.toString()))),
                        DataCell(Center(child: Text(sample.volume.toString()))),
                        DataCell(
                            Center(child: Text(sample.dilution.toString()))),
                        // DataCell(Center(child: Text(sample.vivas.toString()))),
                        // DataCell(Center(child: Text(sample.muertas.toString()))),
                        DataCell(Center(
                            child: Text(
                                sample.cellTotalesConcentradas.toString()))),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GenericButtonOnPress(
                name: "Finalizar",
                iconData: Icons.done,
                inv: true,
                onPress: () {
                  Navigator.pushNamed(context, 'myFiles',
                      arguments: {'samplesList': samplesList});
                },
              ),
              SizedBox(width: 40),
              GenericButtonOnPress(
                  name: "Sembrar",
                  iconData: Icons.grass_outlined,
                  onPress: () {
                    Navigator.pushNamed(context, 'siembraForm',
                        arguments: samplesList);
                  },
                  inv: true),
            ],
          ),
        ],
      ),
    );
  }
}
