import 'package:cell_counter/screens/about.dart';
// import 'package:cell_counter/screens/counter.dart';
import 'package:cell_counter/screens/counterForm.dart';
import 'package:cell_counter/screens/home.dart';
import 'package:cell_counter/screens/myFIles.dart';
import 'package:cell_counter/screens/teoria.dart';
import 'package:cell_counter/screens/theoryScreens/calculations.dart';
import 'package:cell_counter/screens/theoryScreens/cellCounter.dart';
import 'package:cell_counter/screens/theoryScreens/neubauerCam.dart';
import 'package:cell_counter/screens/theoryScreens/procedures.dart';
// import 'package:cell_counter/widgets/sidebar.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routes: {
        'about': (context) => const About(),
        'myFiles': (context) => const MyFiles(),
        'counter': (context) => const CounterForm(),
        'theory': (context) => const Theory(),
        'home': (context) => const HomePage(),
        'calculations': (context) => const Calculations(),
        'cellCounter': (context) => const CellCounter(),
        'neubauerCam': (context) => const NeubauerCam(),
        'procedures': (context) => const Procedures(),
      },
      home: const HomePage(),
    );
  }
}
