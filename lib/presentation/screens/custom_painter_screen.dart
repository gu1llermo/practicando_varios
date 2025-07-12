import 'package:flutter/material.dart';

class CustomPainterScreen extends StatelessWidget {
  const CustomPainterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Painter')),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: CustomPaint(
          painter: _CustomPainter(),
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
    path.lineTo(0, size.height * .25);
    path.lineTo(size.width * .4, size.height * .4);
    path.lineTo(size.width * .9, size.height * .4);
    path.lineTo(size.width, size.height * .35);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
