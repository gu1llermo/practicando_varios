import 'dart:math';

import 'package:flutter/material.dart';
import 'package:practicando/core/extensions/int_extension.dart';

class StackScreen extends StatelessWidget {
  const StackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const  alignment = FractionalOffset.center;
    return Scaffold(
      appBar: AppBar(title: const Text('Stack Screen')),
      body:  Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children:  [
           Container(
            height: 100,
            width: 100,
            transformAlignment: FractionalOffset.center,
            transform: Matrix4.identity()
            ..rotateZ(45.toRadians())
            ,
            color: Colors.yellow),
          Transform(
            alignment: alignment,
            transform: Matrix4.identity()
            //..rotateZ(-45.toRadians())
            ,
            child: const ClipRect(
              child: Align(
                alignment: alignment,
                heightFactor: 0.5,
                child: CajaWidget( color: Colors.blue)),
            ),
          ),
          const CajaWidget( color: Colors.red),
        ],
      ),
    );
  }
}

class CajaWidget extends StatelessWidget {
  const CajaWidget({super.key, this.color, this.dimension=100.0});
  final Color? color;
  final double dimension;


  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: color),
      child: SizedBox.square(dimension: dimension,));
  }
}
