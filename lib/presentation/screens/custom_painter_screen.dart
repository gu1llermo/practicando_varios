import 'package:flutter/material.dart';

class CustomPainterScreen extends StatelessWidget {
  const CustomPainterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Painter')),
      body: Center(
        child: CustomPaint(
          size: Size(300, 300),
          painter: _Triangulo(),
        ),
      ),
    );
  }
}

class _CustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    // Propiedades
    lapiz.color = Colors.cyan;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 5;

    final path = Path();
    // Dibujar el lapiz y el path
    // path.moveTo(0, 0);
    path.lineTo(0, size.height * .9);
    path.lineTo(size.width * .4, size.height * .4);
    path.lineTo(size.width * .9, size.height * .4);
    path.lineTo(size.width, size.height * .35);
    path.lineTo(size.width, 0);

    path.close();

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _Triangulo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    final width = size.width;
    final height= size.height;

    // Propiedades
    lapiz.color = Colors.cyan;
    lapiz.style = PaintingStyle.stroke;
    // lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 5;

    final path = Path();
    // Dibujar el lapiz y el path
    path.moveTo( width/2, 0);
    path.lineTo(width, height);
    path.lineTo(0, height );
    path.lineTo(width/2, 0);
  
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
