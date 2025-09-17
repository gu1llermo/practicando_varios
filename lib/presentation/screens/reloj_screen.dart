import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RelojScreen extends StatelessWidget {
  const RelojScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reloj Screen')),
      body: const Center(
        child: Stack(alignment: Alignment.center, children: [
          _Circulo(radio: 200),
          _Circulo(radio: 100),
          Positioned(
            right: 35,
            child: Manecilla(
              direction: Direction.horizontal,
              size: 80,
              color: Colors.green,
            ),
          ),
          Positioned(
            top: 25,
            child: Manecilla(
              direction: Direction.vertical,
              size: 90,
              color: Colors.purple,
            ),
          ),
          Positioned(
            right: 0,
            child: Manecilla(
                size: 15, direction: Direction.horizontal, color: Colors.black),
          ),
          Positioned(
            left: 0,
            child: Manecilla(
                size: 15, direction: Direction.horizontal, color: Colors.black),
          ),
          Positioned(
            top: 0,
            child: Manecilla(
                size: 15, direction: Direction.vertical, color: Colors.black),
          ),
          Positioned(
            bottom: 0,
            child: Manecilla(
                size: 15, direction: Direction.vertical, color: Colors.black),
          ),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Star'),
          BottomNavigationBarItem(icon: Icon(Icons.sunny), label: 'Sunny'),
        ],
        onTap: (value) {},
      ),
    );
  }
}

class _Circulo extends StatelessWidget {
  final double radio;
  const _Circulo({
    super.key,
    required this.radio,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radio,
      width: radio,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.4),
                offset: const Offset(5, 5),
                blurRadius: 10),
            BoxShadow(
                color: Colors.white.withOpacity(.4),
                offset: const Offset(-5, -5),
                blurRadius: 10),
          ]),
    );
  }
}

enum Direction { vertical, horizontal }

class Manecilla extends StatelessWidget {
  final double size;
  final Direction direction;
  final Color color;
  const Manecilla(
      {super.key,
      required this.size,
      required this.direction,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: direction == Direction.vertical ? 2 : size,
      height: direction == Direction.horizontal ? 2 : size,
      decoration: BoxDecoration(color: color),
    );
  }
}
