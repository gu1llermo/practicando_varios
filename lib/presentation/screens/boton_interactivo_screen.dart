import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class BotonInteractivoScreen extends StatelessWidget {
  const BotonInteractivoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final strokeWidth = 20.0;
    final anchoBoderExterior = 2.0;
    final double radiusPercentage = 0.2;
    final lado = 300.0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Botón interactivo'),
      ),
      body: Center(
        child: Stack(
          children: [
            CustomTrianguloWidget(
              lado: lado,
              strokeWidth: strokeWidth,
              anchoBoderExterior: anchoBoderExterior,
              radiusPercentage: radiusPercentage,
            ),

            // Transform(
            //   transform: Matrix4.identity()..rotateZ(0),
            //   alignment: Alignment.topLeft,
            //   origin: Offset(lado / 2, lado / 2),
            //   child: CustomTrianguloWidget(
            //     lado: lado,
            //     strokeWidth: strokeWidth,
            //     anchoBoderExterior: anchoBoderExterior,
            //     radiusPercentage: radiusPercentage,
            //   ),
            // ),
            Transform(
              transform: Matrix4.identity()..rotateZ(pi / 2),
              alignment: Alignment.topLeft,
              origin: Offset(lado / 2, lado / 2),
              child: CustomTrianguloWidget(
                lado: lado,
                strokeWidth: strokeWidth,
                anchoBoderExterior: anchoBoderExterior,
                radiusPercentage: radiusPercentage,
              ),
            ),

            Transform(
              transform: Matrix4.identity()..rotateZ(pi),
              alignment: Alignment.topLeft,
              origin: Offset(lado / 2, lado / 2),
              child: CustomTrianguloWidget(
                lado: lado,
                strokeWidth: strokeWidth,
                anchoBoderExterior: anchoBoderExterior,
                radiusPercentage: radiusPercentage,
              ),
            ),

            Transform(
              transform: Matrix4.identity()..rotateZ(3 * pi / 2),
              alignment: Alignment.topLeft,
              origin: Offset(lado / 2, lado / 2),
              child: CustomTrianguloWidget(
                lado: lado,
                strokeWidth: strokeWidth,
                anchoBoderExterior: anchoBoderExterior,
                radiusPercentage: radiusPercentage,
              ),
            ),
            CustomPaint(
              size: Size.square(lado),
              painter: MyCustomPainter(
                radiusPercentage: radiusPercentage,
                anchoBorderExterior: anchoBoderExterior,
              ),
            ),
            CustomPaint(
              size: Size.square(lado),
              painter: CustomCirculoPainter(
                strokeWidth: strokeWidth,
                anchoBordeExterior: anchoBoderExterior,
                fillColor: Colors.blue,
                radiusPercentage: radiusPercentage,
                borderColor: Colors.red,
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  final Color borderColor;
  final double radiusPercentage;
  final double anchoBorderExterior;

  MyCustomPainter({
    super.repaint,
    this.borderColor = Colors.white,
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

class CuadradoConBorde extends CustomPainter {
  final double strokeWidth;
  final Color borderColor;
  final Color fillColor;

  CuadradoConBorde({
    super.repaint,
    required this.strokeWidth,
    required this.borderColor,
    required this.fillColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    final lado = min(width, height);

    final p1 = Offset(0, 0);
    final p2 = Offset(width, height);
    final p3 = Offset(width, 0);
    final p4 = Offset(0, height);

    final borderPainter = Paint()
      ..color = borderColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final fillPainter = Paint()
      ..color = fillColor
      ..strokeWidth = 0
      ..style = PaintingStyle.fill;

    // dibujando líneas
    // canvas.drawLine(p1, p2, paint);
    // canvas.drawLine(p3, p4, paint);

    // dibujando el borde del cuadrado
    canvas.drawRect(
        Rect.fromLTWH(
          0 + strokeWidth / 2,
          0 + strokeWidth / 2,
          lado - strokeWidth,
          lado - strokeWidth,
        ),
        borderPainter);

    // Dibujando el cuadrado relleno
    canvas.drawRect(
        Rect.fromLTWH(
          0 + strokeWidth,
          0 + strokeWidth,
          lado - 2 * strokeWidth,
          lado - 2 * strokeWidth,
        ),
        fillPainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class CustomTrianguloPainter extends CustomPainter {
  CustomTrianguloPainter({
    super.repaint,
    this.strokeWidth = 6,
    this.radiusPercentage = 1 / 6, // 16,67%
    required this.borderColor,
    required this.fillColor,
  });

  final double strokeWidth;
  final double radiusPercentage;
  final Color borderColor;
  final Color fillColor;

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    final center = Offset(width / 2, height);

    final radius = width * radiusPercentage;

    final componenteY = sin(pi / 4) * radius;
    final componenteX = cos(pi / 4) * radius;

    // canvas.save();

    final paintBaseLine = Paint()
      ..strokeWidth = strokeWidth
      ..color = borderColor;

    final paintLineasInternas = Paint()
      ..strokeWidth = strokeWidth / 2
      ..style = PaintingStyle.stroke
      ..color = borderColor;

    final paintArcPrueba = Paint()
      ..strokeWidth = strokeWidth / 2
      ..style = PaintingStyle.stroke
      ..color = borderColor;

    final p1 = Offset(strokeWidth, strokeWidth / 2);
    final p2 = Offset(width - strokeWidth, strokeWidth / 2);

    final tinyOffsetX = (strokeWidth / 4) * cos(pi / 4);
    final tinyOffsetY = (strokeWidth / 4) * sin(pi / 4);

    final p2A = Offset(
        width - strokeWidth / 2 - tinyOffsetX, strokeWidth / 2 - tinyOffsetY);
    final p3 = Offset(width / 2 + componenteX - strokeWidth / 4 - tinyOffsetX,
        height - componenteY - tinyOffsetY);

    final p1A = Offset(
        0 + strokeWidth / 2 + tinyOffsetX, strokeWidth / 2 - tinyOffsetY);
    final p4 = Offset(width / 2 - componenteX + strokeWidth / 4 + tinyOffsetX,
        height - componenteY - tinyOffsetY);

    final centerAux = Offset(width / 2, height - strokeWidth / 4);

    canvas.drawLine(p1, p2, paintBaseLine);
    canvas.drawLine(p2A, p3, paintLineasInternas); //p3
    canvas.drawLine(p1A, p4, paintLineasInternas); //p4

    canvas.drawArc(
        Rect.fromCenter(
            center: centerAux, width: 2 * radius, height: 2 * radius),
        5 * pi / 4,
        pi / 2,
        false,
        paintArcPrueba);

    final borderLateralPainter = Paint()
      ..color = Colors.green
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final borderInternoPainter = Paint()
      ..color = Colors.green
      ..strokeWidth = strokeWidth / 2
      ..style = PaintingStyle.stroke;

    final fillPainter = Paint()
      ..color = Colors.cyan
      ..strokeWidth = 0
      ..style = PaintingStyle.fill;

    // dibujando líneas
    // canvas.drawLine(p1, p2, paint);
    // canvas.drawLine(p3, p4, paint);

    // dibujando el borde del cuadrado
    // canvas.drawRect(
    //     Rect.fromLTWH(
    //       0 + strokeWidth / 2,
    //       0 + strokeWidth / 2,
    //       lado - strokeWidth,
    //       lado - strokeWidth,
    //     ),
    //     borderPainter);

    // Dibujando el cuadrado relleno
    // canvas.drawRect(
    //     Rect.fromLTWH(
    //       0 + strokeWidth,
    //       0 + strokeWidth,
    //       lado - 2 * strokeWidth,
    //       lado - 2 * strokeWidth,
    //     ),
    //     fillPainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class CustomTrianguloPainter2 extends CustomPainter {
  CustomTrianguloPainter2({
    super.repaint,
    this.strokeWidth = 6,
    this.radiusPercentage = 1 / 6, // 16,67%
    required this.borderColor,
    required this.fillColor,
  });

  final double strokeWidth;
  final double radiusPercentage;
  final Color borderColor;
  final Color fillColor;

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    final radius = width * radiusPercentage;

    final componenteY = sin(pi / 4) * radius;
    final componenteX = cos(pi / 4) * radius;

    // canvas.save();

    final paintBaseRect = Paint()
      ..strokeWidth = 0
      ..style = PaintingStyle.fill
      ..color = borderColor;

    final paintTest = Paint()
      ..strokeWidth = 0
      ..style = PaintingStyle.fill
      ..color = Colors.green;

    final paintArcPrueba = Paint()
      ..strokeWidth = strokeWidth / 2
      ..style = PaintingStyle.stroke
      ..color = borderColor;

    final p1 = Offset(strokeWidth, 0);
    final p2 = Offset(width - strokeWidth, strokeWidth);
    canvas.drawRect(Rect.fromPoints(p1, p2), paintBaseRect);

    Path path1 = Path()
      ..addRect(Rect.fromLTWH(
          strokeWidth, strokeWidth / 2, width / 2, strokeWidth / 2));

    // Calcular el punto de pivote (esquina inferior izquierda)
    double pivotX = strokeWidth; // X de la esquina izquierda
    double pivotY =
        strokeWidth; // Y de la esquina inferior (strokeWidth/2 + strokeWidth/2)

    // Crear la matriz de transformación
    Matrix4 matrix4 = Matrix4.identity();

    // 1. Trasladar para que el pivote esté en el origen
    matrix4.setTranslationRaw(-pivotX, -pivotY, 0);

    // 2. Crear matriz de rotación y combinarla
    Matrix4 rotationMatrix = Matrix4.identity()..rotateZ(pi / 4);
    matrix4 = rotationMatrix * matrix4;

    // 3. Trasladar de vuelta a la posición original
    Matrix4 translationBack = Matrix4.identity()
      ..setTranslationRaw(pivotX, pivotY, 0);
    matrix4 = translationBack * matrix4;

    // Aplicar la transformación
    path1 = path1.transform(matrix4.storage);
    canvas.drawPath(path1, paintTest);

    final centerAux = Offset(width / 2, height - strokeWidth / 4);

    canvas.drawArc(
        Rect.fromCenter(
            center: centerAux, width: 2 * radius, height: 2 * radius),
        5 * pi / 4,
        pi / 2,
        false,
        paintArcPrueba);

    final borderLateralPainter = Paint()
      ..color = Colors.green
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final borderInternoPainter = Paint()
      ..color = Colors.green
      ..strokeWidth = strokeWidth / 2
      ..style = PaintingStyle.stroke;

    final fillPainter = Paint()
      ..color = Colors.cyan
      ..strokeWidth = 0
      ..style = PaintingStyle.fill;

    // dibujando líneas
    // canvas.drawLine(p1, p2, paint);
    // canvas.drawLine(p3, p4, paint);

    // dibujando el borde del cuadrado
    // canvas.drawRect(
    //     Rect.fromLTWH(
    //       0 + strokeWidth / 2,
    //       0 + strokeWidth / 2,
    //       lado - strokeWidth,
    //       lado - strokeWidth,
    //     ),
    //     borderPainter);

    // Dibujando el cuadrado relleno
    // canvas.drawRect(
    //     Rect.fromLTWH(
    //       0 + strokeWidth,
    //       0 + strokeWidth,
    //       lado - 2 * strokeWidth,
    //       lado - 2 * strokeWidth,
    //     ),
    //     fillPainter);
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
    final radius = radiusPercentage * lado-anchoBordeExterior/2;
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

abstract class Figura {
  final double strokeWidth;
  final Color borderColor;
  final Color fillColor;

  Figura(
      {this.strokeWidth = 6,
      required this.borderColor,
      this.fillColor = Colors.transparent});
}

enum Position { top, left, bottom, right }

class Triangulo extends Figura {
  final Position position;
  Triangulo({
    super.strokeWidth,
    required super.borderColor,
    super.fillColor,
    required this.position,
  });
}

class Circulo extends Figura {
  final double radius;
  Circulo({
    super.strokeWidth,
    required super.borderColor,
    super.fillColor,
    required this.radius,
  });
}

class CustomTrianguloWidget extends StatelessWidget {
  const CustomTrianguloWidget({
    super.key,
    required this.lado,
    required this.strokeWidth,
    required this.anchoBoderExterior,
    required this.radiusPercentage,
  });
  final double lado;
  final double strokeWidth;
  final double anchoBoderExterior;
  final double radiusPercentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          size: Size.square(lado),
          painter: CustomFillTrianguloPainter(
              strokeWidth: strokeWidth,
              anchoBordeExterior: anchoBoderExterior,
              fillColor: Colors.blue),
        ),
        CustomPaint(
          size: Size.square(lado),
          painter: CustomBorderTrianguloPainter(
            radiusPercentage: radiusPercentage,
            strokeWidth: strokeWidth,
            borderColor: Colors.red,
            anchoBordeExterior: anchoBoderExterior,
          ),
        ),
      ],
    );
  }
}
