import 'package:cell_counter/colors.dart';
import 'package:flutter/material.dart';

class MyInkWell extends StatelessWidget {
  final String title;
  final String nextTo;

  const MyInkWell({
    required this.title,
    required this.nextTo,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      //splashColor: Colors.transparent,
      //focusColor: Colors.transparent,
      //hoverColor: Colors.transparent,
      highlightColor: primary_en,
      onTap: () async {
        Navigator.pushReplacementNamed(context, nextTo);
      },
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: primary_dis),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 20,
        ),
        dense: false,
      ),
    );
  }
}
