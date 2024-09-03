import 'dart:math';

import 'package:cell_counter/colors.dart';
import 'package:cell_counter/screens/counterPages/counterResult.dart';
import 'package:cell_counter/model.dart';
import 'package:cell_counter/widgets/buttonCounter.dart';
// import 'package:cell_counter/widgets/genericButton.dart';
import 'package:cell_counter/widgets/genericButtonOnPress.dart';
import 'package:cell_counter/widgets/myScaffold.dart';
import 'package:flutter/cupertino.dart';
// import 'package:cell_counter/widgets/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Counter extends StatefulWidget {
  Counter({super.key});

  int vivas = 0;
  int muertas = 0;
  int elem = 1;
  late String Date;
  late String Name;
  late int Samples;
  late double Volume;
  late double Dilution;
  late int Quadrants;
  late double viabilidad;
  late double cellTotalesConcentradas;
  late double concentracionHomogenado;
  late double totalCellHomogenado;
  late double concentracionSiembra;
  late double volATomar;
  late double volSiembra;
  late Size size;

  List<Sample> samples_list = [];

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    widget.size = MediaQuery.of(context).size;

    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    widget.Date = args['date'];
    widget.Name = args['name'];
    widget.Samples = args['samples'];
    widget.Volume = args['volume'];
    widget.Dilution = args['dilution'];
    widget.Quadrants = args['quadrants'];

    return MyScaffold(
      title: "Contador",
      body: Center(
        child: Container(
          width: min(450, widget.size.width),
          height: min(600, widget.size.height),
          alignment: Alignment.center,
          transformAlignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Encabezados fijos
              Container(
                child: Row(
                  children: const [
                    Expanded(
                        child: Center(
                            child: Text('No.',
                                style: TextStyle(color: Colors.black)))),
                    Expanded(
                        child: Center(
                            child: Text('Vivas',
                                style: TextStyle(color: green_counter_color)))),
                    Expanded(
                        child: Center(
                            child: Text('Muertas',
                                style: TextStyle(color: red_counter_color)))),
                    Expanded(
                        child: Center(
                            child: Text('Total',
                                style: TextStyle(color: Colors.black)))),
                  ],
                ),
              ),
              // DataTable con scroll
              Container(
                height: 200,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children:
                        List.generate(widget.samples_list.length, (index) {
                      final sample = widget.samples_list[index];
                      return Row(
                        children: [
                          Expanded(
                              child:
                                  Center(child: Text((index + 1).toString()))),
                          Expanded(
                              child: Center(
                                  child: Text(sample.vivas.toString(),
                                      style: TextStyle(
                                          color: green_counter_color)))),
                          Expanded(
                              child: Center(
                                  child: Text(sample.muertas.toString(),
                                      style: TextStyle(
                                          color: red_counter_color)))),
                          Expanded(
                              child:
                                  Center(child: Text(sample.total.toString()))),
                        ],
                      );
                    }),
                  ),
                ),
              ),
              const SizedBox(height: 80),
              Stack(
                children: isSwitched
                    ? [
                        ButtonCounter(
                          counterColor: Colors.red,
                          contando: widget.muertas,
                          onPress: () {
                            setState(() {
                              widget.muertas++;
                            });
                          },
                        ),
                      ]
                    : [
                        ButtonCounter(
                          counterColor: Colors.green,
                          contando: widget.vivas,
                          onPress: () {
                            setState(() {
                              widget.vivas++;
                            });
                          },
                        ),
                      ],
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GenericButtonOnPress(
                          name: "Reiniciar",
                          iconData: Icons.rotate_left_sharp,
                          onPress: () {
                            setState(() {
                              widget.vivas = 0;
                              widget.muertas = 0;
                            });
                          },
                          inv: true,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        },
                        activeColor: red_counter_color,
                        inactiveThumbColor: green_counter_color,
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Stack(
                          children: widget.Samples != widget.elem
                              ? [
                                  GenericButtonOnPress(
                                    name: "Siguiente",
                                    iconData: Icons.navigate_next_outlined,
                                    onPress: () {
                                      setState(() {
                                        update();
                                        widget.elem = widget.elem + 1;
                                      });
                                    },
                                    inv: true,
                                  ),
                                ]
                              : [
                                  GenericButtonOnPress(
                                    name: "Finalizar",
                                    iconData: Icons.done,
                                    inv: true,
                                    onPress: () {
                                      update();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CounterResult(
                                              samplesList: widget.samples_list),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void update() {
    isSwitched = false;
    Sample samp = Sample(
      date: widget.Date.toString(),
      name: "${widget.Name}_${widget.elem}",
      volume: widget.Volume,
      dilution: widget.Dilution,
      quadrants: widget.Quadrants,
      vivas: widget.vivas,
      muertas: widget.muertas,
    );

    widget.samples_list.add(samp);
    widget.vivas = 0;
    widget.muertas = 0;
  }
}
