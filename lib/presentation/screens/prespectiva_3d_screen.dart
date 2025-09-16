import 'dart:math';

import 'package:flutter/material.dart';
import 'package:practicando/core/extensions/int_extension.dart';

class Perspectiva3DScreen extends StatefulWidget {
  const Perspectiva3DScreen({super.key});

  @override
  State<Perspectiva3DScreen> createState() => _Perspectiva3DScreenState();
}

class _Perspectiva3DScreenState extends State<Perspectiva3DScreen> {
  int count = 0;
   Offset _offset = Offset(25.toRadians(), 25.toRadians());
  //  Offset _offset = Offset.zero;
  void increment() {
    setState(() {
      count++;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
      ..setEntry(3, 2, 0.001)
      
      ..rotateX(0.01*_offset.dy)
      ..rotateY(-0.01*_offset.dx)
      
      ,
      alignment: FractionalOffset.center,
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            _offset+=details.delta;
          });
        },
        onDoubleTap: () {
          setState(() {
            _offset = Offset.zero;
          });
        },
        onPanEnd: (details) {
          print(details.velocity);
        },
        child: _PantallaView(count: count, onTap: increment)),
      );
  }
}

class _PantallaView extends StatelessWidget {
  const _PantallaView({
    required this.count,
    required this.onTap,
  });

  final int count;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final mensaje = 'Has pulsado $count ve${count == 1 ? 'z' : 'ces'}';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perspectiva 3D'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$count',
              style: const TextStyle(fontSize: 40),
            ),
            Text(mensaje)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onTap,
        child: const Icon(Icons.add),
      ),
    );
  }
}

