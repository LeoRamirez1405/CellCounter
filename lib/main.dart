import 'package:cell_counter/model.dart';
import 'package:cell_counter/screens/about.dart';
import 'package:cell_counter/screens/counterPages/counter.dart';
// import 'package:cell_counter/screens/counter.dart';
import 'package:cell_counter/screens/counterPages/counterForm.dart';
import 'package:cell_counter/screens/home.dart';
import 'package:cell_counter/screens/myFIles.dart';
import 'package:cell_counter/screens/siembraForm.dart';
import 'package:cell_counter/screens/siembraResult.dart';
import 'package:cell_counter/screens/teoria.dart';
import 'package:cell_counter/screens/theoryScreens/calculations.dart';
import 'package:cell_counter/screens/theoryScreens/cellCounter.dart';
import 'package:cell_counter/screens/theoryScreens/neubauerCam.dart';
import 'package:cell_counter/screens/theoryScreens/procedures.dart';
// import 'package:cell_counter/widgets/sidebar.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

void main() {
  // Initialize FFI
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    // Initialize FFI for desktop platforms
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
  // Set the database factory
  // databaseFactory = databaseFactoryFfi;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily:
            'OpenSans', // Usa el nombre de la familia que declaraste en pubspec.yaml
      ),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routes: {
        'about': (context) => const About(),
        'myFiles': (context) => MyFiles(
              samplesList: (ModalRoute.of(context)!.settings.arguments
                  as Map)['samplesList'] as List<Sample>?,
            ),
        'counterForm': (context) => const CounterForm(),
        'counter': (context) => Counter(),
        // 'counterResult': (context) => CounterResult(),
        'theory': (context) => const Theory(),
        'home': (context) => const HomePage(),
        'siembraForm': (context) => SiembraForm(
              samplesList:
                  ModalRoute.of(context)!.settings.arguments as List<Sample>,
            ),
        'siembraResult': (context) => SiembraResult(
              samplesList: (ModalRoute.of(context)!.settings.arguments
                  as Map)['samplesList'] as List<Sample>,
              concentracion: (ModalRoute.of(context)!.settings.arguments
                  as Map)['concentracion'] as double,
              vol: (ModalRoute.of(context)!.settings.arguments as Map)['vol']
                  as double,
            ),
        'calculations': (context) => const Calculations(),
        'cellCounter': (context) => const CellCounter(),
        'neubauerCam': (context) => const NeubauerCam(),
        'procedures': (context) => const Procedures(),
      },
      home: const HomePage(),
    );
  }
}
