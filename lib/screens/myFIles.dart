import 'package:cell_counter/widgets/myScaffold.dart';
import 'package:cell_counter/widgets/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:cell_counter/widgets/genericButton.dart';

class MyFiles extends StatelessWidget {
  const MyFiles({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: "Mis Archivos",
      // body: Text("Hi"),
    );
  }
}
