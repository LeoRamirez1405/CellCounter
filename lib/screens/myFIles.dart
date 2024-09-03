import 'package:cell_counter/colors.dart';
import 'package:cell_counter/widgets/genericButtonOnPress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cell_counter/widgets/myScaffold.dart';
import 'package:cell_counter/widgets/sidebar.dart';
import 'package:cell_counter/widgets/genericButton.dart';
import 'package:cell_counter/model.dart';
import 'package:cell_counter/database_helper.dart';
import 'package:flutter/widgets.dart';

class MyFiles extends StatefulWidget {
  final List<Sample>? samplesList;

  const MyFiles({super.key, this.samplesList});

  @override
  _MyFilesState createState() => _MyFilesState();
}

class _MyFilesState extends State<MyFiles> {
  late Future<List<Sample>> _samples;

  @override
  void initState() {
    super.initState();
    _samples = DatabaseHelper.instance.fetchSamples();
    _addSamplesIfNotEmpty();
  }

  void _addSamplesIfNotEmpty() async {
    if (widget.samplesList != null && widget.samplesList!.isNotEmpty) {
      for (var sample in widget.samplesList!) {
        await DatabaseHelper.instance.insertSample(sample);
      }
      setState(() {
        _samples = DatabaseHelper.instance.fetchSamples();
      });
    }
  }

  void _deleteSample(int id) async {
    await DatabaseHelper.instance.deleteSample(id);
    setState(() {
      _samples = DatabaseHelper.instance.fetchSamples();
    });
  }

  void _deleteAllSamples() async {
    await DatabaseHelper.instance.deleteAllSamples();
    setState(() {
      _samples = DatabaseHelper.instance.fetchSamples();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: "Mis Archivos",
      body: FutureBuilder<List<Sample>>(
        future: _samples,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/logo_empty.png",
                  width: 400,
                  height: 300,
                ),
                Text(
                  'No hay conteos disponibles.',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: primary_en),
                ),
              ],
            ));
          } else {
            return Column(
              children: [
                Container(
                  height: 500,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('ID')),
                          DataColumn(label: Text('Fecha')),
                          DataColumn(label: Text('Nombre')),
                          DataColumn(label: Text('Vivas')),
                          DataColumn(label: Text('Muertas')),
                          DataColumn(label: Text('Total')),
                          DataColumn(label: Text('Volumen')),
                          DataColumn(label: Text('Dilución')),
                          DataColumn(label: Text('Cuadrantes')),
                          DataColumn(label: Text('Concentración de células')),
                          DataColumn(label: Text('Vol A Tomar')),
                          DataColumn(label: Text('Viabilidad')),
                          DataColumn(
                              label:
                                  Text('Total de células por concentración')),
                          DataColumn(label: Text('Acciones')),
                        ],
                        rows: snapshot.data!.map((sample) {
                          return DataRow(
                            cells: [
                              DataCell(Text(sample.id.toString())),
                              DataCell(Text(sample.date)),
                              DataCell(Text(sample.name)),
                              DataCell(Text(sample.vivas.toString())),
                              DataCell(Text(sample.muertas.toString())),
                              DataCell(Text(sample.total.toString())),
                              DataCell(Text(sample.volume.toString())),
                              DataCell(Text(sample.dilution.toString())),
                              DataCell(Text(sample.quadrants.toString())),
                              DataCell(Text(_toScientificNotation(
                                  sample.cellTotalesConcentradas))),
                              DataCell(Text(sample.volAtomar.toString())),
                              DataCell(Text(sample.viabilidad.toString())),
                              DataCell(Text(_toScientificNotation(
                                  sample.totalCellHomogenado))),
                              DataCell(
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    _deleteSample(sample.id!);
                                  },
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: GenericButtonOnPress(
                    inv: true,
                    name: "Eliminar todos",
                    iconData: Icons.delete,
                    onPress: () async {
                      bool? confirm = await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Confirmar eliminación'),
                            content: Text(
                                '¿Estás seguro de que deseas eliminar todos los archivos?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                                child: Text('Cancelar'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                                child: Text('Eliminar'),
                              ),
                            ],
                          );
                        },
                      );

                      if (confirm == true) {
                        _deleteAllSamples();
                      }
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

String _toScientificNotation(double value) {
  return value.toStringAsExponential(2);
}
