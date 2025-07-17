import 'package:flutter/material.dart';

class Cuadrado extends StatelessWidget {
  const Cuadrado({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 100,
      child: DecoratedBox(decoration: BoxDecoration(color: color)),
    );
  }
}