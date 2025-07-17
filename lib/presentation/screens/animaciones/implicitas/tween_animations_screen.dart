import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../circulo_colores_widget.dart';
import '../cuadrado.dart';

class TweenAnimationsScreen extends StatefulWidget {
  const TweenAnimationsScreen({super.key});

  @override
  State<TweenAnimationsScreen> createState() => _TweenAnimationsScreenState();
}

class _TweenAnimationsScreenState extends State<TweenAnimationsScreen> {
  Color _color = Colors.blue;
  double desplazamiento = 180;
  double posInicial = 0.0;
  double posFinal = 0.0;
  double anguloInicial = 0.0;
  double anguloFinal = 0.0;

  double toRadians(double grados) {
    const pi = math.pi;
    return grados / 180 * pi;
  }
  // double _normalizaGrados(double grados){

  //   double factor = 1.0;
  //   if (grados < 0){
  //     factor = -1.0;// entonces los grados son negativos
  //   }
  //   double gradosResult= grados.abs();// lo llevo a positivo

  //   while(gradosResult > 360){
  //     gradosResult-=360;
  //   }
  //   return gradosResult * factor;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tween Animation'),
      ),
      body: ListView(
        children: [
          const Cuadrado(
            color: Colors.yellow,
          ),
          TweenAnimationBuilder<Color?>(
            tween: ColorTween(begin: Colors.white, end: _color),
            duration: const Duration(seconds: 1),
            builder: (BuildContext context, Color? value, Widget? child) {
              return Cuadrado(color: value);
            },
          ),
          TweenAnimationBuilder<double>(
            tween: Tween(begin: posInicial, end: posFinal),
            duration: const Duration(milliseconds: 300),
            builder: (context, value, child) {
              return Transform.translate(
                  offset: Offset(0.0, value),
                  child: const Cuadrado(
                    color: Colors.purple,
                  ));
            },
          ),
          const AnimatedSlide(
              offset: Offset(0.0, 0.0),
              duration: Duration(seconds: 1),
              child: Cuadrado(
                color: Colors.red,
              )),
          TweenAnimationBuilder<double>(
            tween: Tween(begin: anguloInicial, end: anguloFinal),
            duration: const Duration(milliseconds: 500),
            builder: (context, value, child) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.02)
                  ..translate(0.0, value)
                  ..rotateZ(toRadians(value))
                  ,
                child: const CirculoColoresWidget(
                  color1: Colors.black,
                  color2: Color.fromARGB(255, 199, 231, 16),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: '-1',
            onPressed: () {
              setState(() {
                anguloInicial = anguloFinal == 0
                    ? anguloInicial
                    : (anguloInicial - desplazamiento);
                anguloFinal -= desplazamiento;
                //desplazamiento -= desplazamiento;
              });
            },
            child: const Icon(Icons.rotate_left),
          ),
          FloatingActionButton(
            heroTag: '0',
            onPressed: () {
              setState(() {
                anguloInicial = anguloFinal == 0
                    ? anguloInicial
                    : (anguloInicial + desplazamiento);
                anguloFinal += desplazamiento;

                //desplazamiento += 20;
              });
            },
            child: const Icon(Icons.rotate_right),
          ),
          FloatingActionButton(
            heroTag: '1',
            onPressed: () {
              setState(() {
                if (_color == Colors.black) {
                  _color = Colors.blue;
                } else {
                  _color = Colors.black;
                }
              });
            },
            child: const Icon(Icons.change_circle),
          ),
          FloatingActionButton(
            heroTag: '2',
            onPressed: () {
              setState(() {
                posInicial = posFinal == 0 ? posInicial : (posInicial - 20);
                posFinal -= 20;
                //desplazamiento -= 20;
              });
            },
            child: const Icon(Icons.arrow_circle_up),
          ),
          FloatingActionButton(
            heroTag: '3',
            onPressed: () {
              setState(() {
                posInicial = posFinal == 0 ? posInicial : (posInicial + 20);
                posFinal += 20;
                //desplazamiento += 20;
              });
            },
            child: const Icon(Icons.arrow_circle_down),
          ),
        ],
      ),
    );
  }
}
