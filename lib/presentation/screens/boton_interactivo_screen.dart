import 'dart:math';

import 'package:flutter/material.dart';

enum TrianguloPosition {
  top(0),
  right(pi / 2),
  bottom(pi),
  left(3 * pi / 2);

  final double angle;
  const TrianguloPosition(this.angle);
}

// enum CombinacionTriangulo {
//   uno(Colors.transparent, Colors.transparent),
//   dos(Colors.blue, Colors.blue),
//   tres(Colors.blue, Colors.red),
//   cuatro(Colors.red, Colors.red),
//   ;

//   final Color fillColor;
//   final Color borderColor;
//   const CombinacionTriangulo(this.fillColor, this.borderColor);

//   int get nextIndex {
//     final length = CombinacionTriangulo.values.length;
//     if (index >= length - 1) {
//       return 0;
//     }
//     return index + 1;
//   }
// }

class BotonInteractivoScreen extends StatefulWidget {
  const BotonInteractivoScreen({super.key});

  @override
  State<BotonInteractivoScreen> createState() => _BotonInteractivoScreenState();
}

class _BotonInteractivoScreenState extends State<BotonInteractivoScreen> {
  final strokeWidth = 20.0;
  final anchoBoderExterior = 2.0;
  final double radiusPercentage = 0.2;
  final lado = 300.0;

  late Color surfaceColor;

  late List<ComposicionColores> _combinacionColoresTriangulo;

  late List<ComposicionColores> _combinacionColoresCirculo;

  Triangulo topTriangle = Triangulo(position: TrianguloPosition.top);
  Triangulo bottomTriangle = Triangulo(position: TrianguloPosition.bottom);
  Triangulo leftTriangle = Triangulo(position: TrianguloPosition.left);
  Triangulo rightTriangle = Triangulo(position: TrianguloPosition.right);

  Circulo circulo = Circulo();

  void onTapCenter() {
    setState(() {
      int index = circulo.index + 1;
      if (index >= _combinacionColoresCirculo.length ) {
        index = 0;
      }
      circulo = Circulo(
          borderColor: _combinacionColoresCirculo[index].borderColor,
          fillColor: _combinacionColoresCirculo[index].fillColor,
          index: index);
    });

    // print('Centro');
  }

  void onTapTop() {
    setState(() {
      int index = topTriangle.index + 1;
      if (index >= _combinacionColoresTriangulo.length ) {
        index = 0;
      }
      topTriangle = Triangulo(
          borderColor: _combinacionColoresTriangulo[index].borderColor,
          fillColor: _combinacionColoresTriangulo[index].fillColor,
          index: index, position: TrianguloPosition.top);
    });
    // print('Top');
  }

  void onTapBottom() {
    setState(() {
      int index = bottomTriangle.index + 1;
      if (index >= _combinacionColoresTriangulo.length ) {
        index = 0;
      }
      bottomTriangle = Triangulo(
          borderColor: _combinacionColoresTriangulo[index].borderColor,
          fillColor: _combinacionColoresTriangulo[index].fillColor,
          index: index, position: TrianguloPosition.bottom);
    });
  }
  void onTapLeft() {
    setState(() {
      int index = leftTriangle.index + 1;
      if (index >= _combinacionColoresTriangulo.length ) {
        index = 0;
      }
      leftTriangle = Triangulo(
          borderColor: _combinacionColoresTriangulo[index].borderColor,
          fillColor: _combinacionColoresTriangulo[index].fillColor,
          index: index, position: TrianguloPosition.left);
    });
  }
  void onTapRight() {
    setState(() {
      int index = rightTriangle.index + 1;
      if (index >= _combinacionColoresTriangulo.length ) {
        index = 0;
      }
      rightTriangle = Triangulo(
          borderColor: _combinacionColoresTriangulo[index].borderColor,
          fillColor: _combinacionColoresTriangulo[index].fillColor,
          index: index, position: TrianguloPosition.right);
    });
  }


  @override
  void didChangeDependencies() {
    final colors = Theme.of(context).colorScheme;
    surfaceColor = colors.surface;

    _combinacionColoresCirculo = <ComposicionColores>[
      ComposicionColores(surfaceColor, surfaceColor),
      ComposicionColores(Colors.blue, Colors.blue),
      ComposicionColores(Colors.blue, Colors.red),
      ComposicionColores(Colors.red, Colors.red),
    ];

    _combinacionColoresTriangulo = <ComposicionColores>[
      ComposicionColores(Colors.transparent, Colors.transparent),
      ComposicionColores(Colors.blue, Colors.blue),
      ComposicionColores(Colors.blue, Colors.red),
      ComposicionColores(Colors.red, Colors.red),
    ];

    circulo = Circulo(
      borderColor: surfaceColor,
      fillColor: surfaceColor,
    );

    super.didChangeDependencies();
  }

  void _handleTap(Offset position) {
    double x = position.dx;
    double y = position.dy;
    double centerX = lado / 2;
    double centerY = lado / 2;
    double radius = lado * radiusPercentage; // Radio del círculo central

    // Verificar si está en el círculo central
    double distanceFromCenter =
        ((x - centerX) * (x - centerX) + (y - centerY) * (y - centerY)).abs();

    if (distanceFromCenter <= radius * radius) {
      onTapCenter();

      return;
    }

    // Determinar en qué triángulo está el punto
    if (y < x && y < lado - x) {
      // Triángulo superior
      onTapTop();
    } else if (y > x && y < lado - x) {
      // Triángulo izquierdo
      onTapLeft();
    } else if (y > x && y > lado - x) {
      // Triángulo inferior
      onTapBottom();
    } else if (y < x && y > lado - x) {
      // Triángulo derecho (cian)
      onTapRight();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Botón interactivo'),
      ),
      body: Center(
        child: SizedBox.square(
          dimension: lado,
          child: GestureDetector(
            onTapUp: (details) {
              // tengo que detectar qué zona se pulsó y en base a eso
              // ejecutar un acción
              // te voy a pasar las coordenadas y me vas a decir
              // qué zona se pulsó

              _handleTap(details.localPosition);
            },
            child: Stack(
              children: [
                // topTriangle
                // CustomTrianguloWidget(
                //   strokeWidth: strokeWidth,
                //   anchoBoderExterior: anchoBoderExterior,
                //   radiusPercentage: radiusPercentage,
                //   borderColor: Colors.red,
                //   fillColor: Colors.blue,
                // ),
                // topTriangle
                TrianguloWidget(
                  strokeWidth: strokeWidth,
                  anchoBoderExterior: anchoBoderExterior,
                  radiusPercentage: radiusPercentage,
                  borderColor: topTriangle.borderColor,
                  fillColor: topTriangle.fillColor,
                  position: topTriangle.position,
                ),
                // rightTriangle
                TrianguloWidget(
                  strokeWidth: strokeWidth,
                  anchoBoderExterior: anchoBoderExterior,
                  radiusPercentage: radiusPercentage,
                  borderColor: rightTriangle.borderColor,
                  fillColor: rightTriangle.fillColor,
                  position: rightTriangle.position,
                ),
                // bottomTriangle
                TrianguloWidget(
                  strokeWidth: strokeWidth,
                  anchoBoderExterior: anchoBoderExterior,
                  radiusPercentage: radiusPercentage,
                  borderColor: bottomTriangle.borderColor,
                  fillColor: bottomTriangle.fillColor,
                  position: bottomTriangle.position,
                ),
                // leftTriangle
                TrianguloWidget(
                  strokeWidth: strokeWidth,
                  anchoBoderExterior: anchoBoderExterior,
                  radiusPercentage: radiusPercentage,
                  borderColor: leftTriangle.borderColor,
                  fillColor: leftTriangle.fillColor,
                  position: leftTriangle.position,
                ),
                // topTriangle
                // Transform(
                //   transform: Matrix4.identity()..rotateZ(0),
                //   alignment: Alignment.topLeft,
                //   origin: Offset(lado / 2, lado / 2),
                //   child: CustomTrianguloWidget(
                //     strokeWidth: strokeWidth,
                //     anchoBoderExterior: anchoBoderExterior,
                //     radiusPercentage: radiusPercentage,
                //     borderColor: Colors.red,
                //     fillColor: Colors.blue,
                //   ),
                // ),
                // rightTriangle
                // Transform(
                //   transform: Matrix4.identity()..rotateZ(pi / 2),
                //   alignment: Alignment.topLeft,
                //   origin: Offset(lado / 2, lado / 2),
                //   child: CustomTrianguloWidget(
                //     // lado: lado,
                //     strokeWidth: strokeWidth,
                //     anchoBoderExterior: anchoBoderExterior,
                //     radiusPercentage: radiusPercentage,
                //     borderColor: Colors.red,
                //     fillColor: Colors.blue,
                //   ),
                // ),
                // // bottomTriangle
                // Transform(
                //   transform: Matrix4.identity()..rotateZ(pi),
                //   alignment: Alignment.topLeft,
                //   origin: Offset(lado / 2, lado / 2),
                //   child: CustomTrianguloWidget(
                //     // lado: lado,
                //     strokeWidth: strokeWidth,
                //     anchoBoderExterior: anchoBoderExterior,
                //     radiusPercentage: radiusPercentage,
                //     borderColor: Colors.red,
                //     fillColor: Colors.blue,
                //   ),
                // ),
                // // leftTriangle
                // Transform(
                //   transform: Matrix4.identity()..rotateZ(3 * pi / 2),
                //   alignment: Alignment.topLeft,
                //   origin: Offset(lado / 2, lado / 2),
                //   child: CustomTrianguloWidget(
                //     // lado: lado,
                //     strokeWidth: strokeWidth,
                //     anchoBoderExterior: anchoBoderExterior,
                //     radiusPercentage: radiusPercentage,
                //     borderColor: Colors.red,
                //     fillColor: Colors.blue,
                //   ),
                // ),
                // dibujo base esqueleto
                CustomPaint(
                  size: Size.square(double.infinity),
                  painter: MyCustomPainter(
                    radiusPercentage: radiusPercentage,
                    anchoBorderExterior: anchoBoderExterior,
                    borderColor: colors.onSurface,
                  ),
                ),
                // circulo central
                CustomPaint(
                  size: Size.square(double.infinity),
                  painter: CustomCirculoPainter(
                    strokeWidth: strokeWidth,
                    anchoBordeExterior: anchoBoderExterior,
                    radiusPercentage: radiusPercentage,
                    fillColor: circulo.fillColor,
                    borderColor: circulo.borderColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TrianguloWidget extends StatelessWidget {
  const TrianguloWidget({
    super.key,
    required this.strokeWidth,
    required this.anchoBoderExterior,
    required this.radiusPercentage,
    required this.borderColor,
    required this.fillColor,
    required this.position,
  });

  final double strokeWidth;
  final double anchoBoderExterior;
  final double radiusPercentage;
  final Color borderColor;
  final Color fillColor;
  final TrianguloPosition position;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final lado = constraints.biggest.width;
        return Transform(
          transform: Matrix4.identity()..rotateZ(position.angle),
          alignment: Alignment.topLeft,
          origin: Offset(lado / 2, lado / 2),
          child: CustomTrianguloWidget(
            strokeWidth: strokeWidth,
            anchoBoderExterior: anchoBoderExterior,
            radiusPercentage: radiusPercentage,
            borderColor: borderColor,
            fillColor: fillColor,
          ),
        );
      },
    );
  }
}

class MyCustomPainter extends CustomPainter {
  final Color borderColor;
  final double radiusPercentage;
  final double anchoBorderExterior;

  MyCustomPainter({
    super.repaint,
    required this.borderColor,
    required this.anchoBorderExterior,
    this.radiusPercentage = 0.2,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final lado = size.width;
    final radius = lado * radiusPercentage;
    final paint = Paint()
      ..color = borderColor
      ..strokeWidth = anchoBorderExterior
      ..style = PaintingStyle.stroke;

    canvas.drawRect(Rect.fromLTWH(0, 0, lado, lado), paint);

    final p1 = Offset(0, 0);
    final p2 = Offset(lado, lado);
    final p3 = Offset(lado, 0);
    final p4 = Offset(0, lado);
    canvas.drawLine(p1, p2, paint);
    canvas.drawLine(p3, p4, paint);

    final center = Offset(lado / 2, lado / 2);

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class CustomBorderTrianguloPainter extends CustomPainter {
  final double strokeWidth;
  final double anchoBordeExterior;
  final double radiusPercentage;
  final Color borderColor;

  CustomBorderTrianguloPainter({
    super.repaint,
    required this.strokeWidth,
    required this.anchoBordeExterior,
    required this.radiusPercentage,
    required this.borderColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final lado = size.width;
    final radius = lado * radiusPercentage;

    final borderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = borderColor
      ..strokeWidth = strokeWidth;

    Path trianglePath = Path()
      ..moveTo(strokeWidth + 2 * anchoBordeExterior, strokeWidth / 2)
      ..lineTo(lado - strokeWidth - 2 * anchoBordeExterior, strokeWidth / 2)
      ..lineTo(lado / 2, lado / 2 - strokeWidth / 2 - 2 * anchoBordeExterior)
      ..close(); // Esto cierra el triángulo conectando el último punto con el primero

    canvas.drawPath(trianglePath, borderPaint);

    final center = Offset(lado / 2, lado / 2);

    final ladoRect = 2 * radius + strokeWidth / 2 + 6 * anchoBordeExterior;

    canvas.drawArc(
        Rect.fromCenter(center: center, width: ladoRect, height: ladoRect),
        5 * pi / 4,
        pi / 2,
        false,
        borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class CustomCirculoPainter extends CustomPainter {
  final double strokeWidth;
  final double anchoBordeExterior;
  final double radiusPercentage;
  final Color borderColor;
  final Color fillColor;

  CustomCirculoPainter(
      {super.repaint,
      required this.strokeWidth,
      required this.anchoBordeExterior,
      required this.radiusPercentage,
      required this.borderColor,
      required this.fillColor});
  @override
  void paint(Canvas canvas, Size size) {
    final lado = size.width;
    final radius = radiusPercentage * lado - anchoBordeExterior / 2;
    final radiusInterior = radius - strokeWidth;
    final borderExteriorPaint = Paint()..color = borderColor;
    final fillPaint = Paint()..color = fillColor;
    final center = Offset(lado / 2, lado / 2);
    canvas.drawCircle(center, radius, borderExteriorPaint);
    canvas.drawCircle(center, radiusInterior, fillPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class CustomFillTrianguloPainter extends CustomPainter {
  final double strokeWidth;
  final double anchoBordeExterior;

  final Color fillColor;

  CustomFillTrianguloPainter(
      {super.repaint,
      required this.strokeWidth,
      required this.anchoBordeExterior,
      required this.fillColor});

  @override
  void paint(Canvas canvas, Size size) {
    final lado = size.width;

    final fillPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = fillColor;

    Path trianglePath = Path()
      ..moveTo(strokeWidth + 2 * anchoBordeExterior, strokeWidth / 2)
      ..lineTo(lado - strokeWidth - 2 * anchoBordeExterior, strokeWidth / 2)
      ..lineTo(lado / 2, lado / 2 - strokeWidth / 2 - 2 * anchoBordeExterior)
      ..close(); // Esto cierra el triángulo conectando el último punto con el primero

    canvas.drawPath(trianglePath, fillPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class ComposicionColores {
  final Color fillColor;
  final Color borderColor;

  ComposicionColores(this.fillColor, this.borderColor);
}

class Figura {
  final Color fillColor;
  final Color borderColor;
  final int index;

  Figura({
    this.fillColor = Colors.transparent,
    this.borderColor = Colors.transparent,
    this.index = 0,
  });
}

class Triangulo extends Figura {
  final TrianguloPosition position;

  Triangulo({
    super.borderColor,
    super.fillColor,
    required this.position,
    super.index,
  });
}

class Circulo extends Figura {
  Circulo({
    super.borderColor,
    super.fillColor,
    super.index,
  });
}

class CustomTrianguloWidget extends StatelessWidget {
  const CustomTrianguloWidget({
    super.key,
    // required this.lado,
    required this.strokeWidth,
    required this.anchoBoderExterior,
    required this.radiusPercentage,
    required this.borderColor,
    required this.fillColor,
  });
  // final double lado;
  final double strokeWidth;
  final double anchoBoderExterior;
  final double radiusPercentage;
  final Color borderColor;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          size: Size.square(double.infinity),
          painter: CustomFillTrianguloPainter(
              strokeWidth: strokeWidth,
              anchoBordeExterior: anchoBoderExterior,
              fillColor: fillColor),
        ),
        CustomPaint(
          size: Size.square(double.infinity),
          painter: CustomBorderTrianguloPainter(
            radiusPercentage: radiusPercentage,
            strokeWidth: strokeWidth,
            borderColor: borderColor,
            anchoBordeExterior: anchoBoderExterior,
          ),
        ),
      ],
    );
  }
}
