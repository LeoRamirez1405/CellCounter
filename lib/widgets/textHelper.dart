import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tex/flutter_tex.dart';

class TextHelper extends StatelessWidget {
  final String header;
  final Widget body;

  const TextHelper({
    required this.header,
    required this.body,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Text(
        header,
        style:
            TextStyle(fontSize: 25, fontWeight: FontWeight.bold, height: 1.1),
        textAlign: TextAlign.center,
      ),
      SizedBox(
        height: 20,
      ),
      body,
      SizedBox(
        height: 15,
      )
    ]);
  }
}
