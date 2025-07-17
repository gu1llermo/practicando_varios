import 'package:flutter/material.dart';
import 'package:practicando/presentation/screens/animaciones/cuadrado.dart';

class CirculoColoresWidget extends StatelessWidget {
  const CirculoColoresWidget({super.key, this.color1, this.color2});
  final Color? color1;
  final Color? color2;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ClipOval(
        
        child: Stack(
          //alignment: Alignment.center,
          children: [
          CirculoWidget(color: color1),
          Positioned(
            left:50,
            child: Cuadrado(color: color2)),
        ],),
      ),
    );
  }
}

class CirculoWidget extends StatelessWidget {
  const CirculoWidget({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
      ),
    );
  }
}