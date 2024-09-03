import 'dart:math';

import 'package:cell_counter/colors.dart';
import 'package:cell_counter/screens/counterPages/counter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ButtonCounter extends StatefulWidget {
  final Color counterColor;
  int contando;
  Function onPress;

  ButtonCounter(
      {super.key,
      required this.counterColor,
      required this.contando,
      required this.onPress});

  @override
  _ButtonCounterState createState() => _ButtonCounterState();
}

class _ButtonCounterState extends State<ButtonCounter> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialButton(
      height: min(230, size.width * 0.55),
      minWidth: min(230, size.width * 0.55),
      color: Colors.white,
      onPressed: () {
        setState(() {
          this.widget.onPress();
        });
      },
      visualDensity: VisualDensity.comfortable,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
        side: BorderSide(color: widget.counterColor, width: 2), // Borde verde
      ),
      child: Text(
        "${widget.contando}",
        style: TextStyle(
            color: widget.counterColor,
            fontSize: 25,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
