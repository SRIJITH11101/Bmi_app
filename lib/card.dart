import 'package:flutter/material.dart';
import 'dart:ui';

class reusecard extends StatelessWidget {
  const reusecard({
    required this.cardchild,
    this.color,
    super.key,
  });
  final Widget cardchild;
  final color;
  @override
  Widget build(BuildContext context) {
    return  Container(
        child: cardchild,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(15.0)),
        margin: EdgeInsets.all(17),
      );

  }
}
//Colorint i.fromARGB(155, 39, 3, 63)