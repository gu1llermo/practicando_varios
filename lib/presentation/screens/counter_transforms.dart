import 'package:flutter/material.dart';
import 'package:practicando/core/extensions/int_extension.dart';

class CounterTransforms extends StatefulWidget {
  const CounterTransforms({super.key});

  @override
  State<CounterTransforms> createState() => _CounterTransformsState();
}

class _CounterTransformsState extends State<CounterTransforms> {
  int count = 0;
  int? oldCount;
  final counterKey = GlobalKey();
  double widthCounter = 0.0;
  ValueKey<String> incrementoKey = const ValueKey('0');
  ValueKey<String>? decrementoKey;
  bool estaDecrementando = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        setState(() {
          final size = counterKey.currentContext?.size;
          widthCounter = size?.width ?? 0.0;
          print('debugCounter: initState ancho: $widthCounter');
          //print('debugCounter: initState alto: ${size?.height}');
        });
      },
    );
  }

  void increment() {
    setState(() {
      if (count >= 9) return;
      estaDecrementando = false;
      oldCount = count++;
      incrementoKey = ValueKey(getTimeStamp().toString());
    });
  }

  int getTimeStamp() {
    final now = DateTime.now().millisecondsSinceEpoch;
    return now;
  }

  void decrement() {
    setState(() {
      if (count <= 0) return;

      oldCount = count--;
      estaDecrementando = true;
      final timeStamp = getTimeStamp();
      decrementoKey = ValueKey(timeStamp.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    //final mensaje = 'Has pulsado $count ve${count == 1 ? 'z' : 'ces'}';
    const color1 = Color.fromARGB(255, 52, 30, 163);
    const color2 = Color.fromARGB(255, 12, 212, 209);
    final textStyle = Theme.of(context).textTheme.displaySmall;
    const fontSize = 200.0;

    final oldCountSuperior = ClipRect(
      clipper: MyRectClipper(parte: Parte.superior),
      child: CounterWidget(count: oldCount ?? 0, fontSize: fontSize),
    );
    final oldCountInferior = GradienteInferior(
      width: widthCounter,
      height: fontSize / 2,
      child: ClipRect(
        clipper: MyRectClipper(parte: Parte.inferior),
        child: CounterWidget(count: oldCount ?? 0, fontSize: fontSize),
      ),
    );

    final countSuperior = ClipRect(
      clipper: MyRectClipper(parte: Parte.superior),
      child: CounterWidget(count: count, fontSize: fontSize),
    );
    final countInferior = GradienteInferior(
      height: fontSize / 2,
      width: widthCounter,
      child: ClipRect(
        clipper: MyRectClipper(parte: Parte.inferior),
        child: CounterWidget(count: count, fontSize: fontSize),
      ),
    );

    return DecoratedBox(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [color1, color2])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Counter Transforms'),
        ),
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (oldCount != null) ...[
                oldCountSuperior,
                oldCountInferior,
              ],

              if (estaDecrementando) countInferior,

              if (oldCount == null || decrementoKey == null)
                //countSuperior
                ClipRect(
                  clipper: MyRectClipper(parte: Parte.superior),
                  child: CounterWidget(
                      counterKey: counterKey, count: count, fontSize: fontSize),
                )
              else
                TweenAnimationBuilder<int>(
                  key: decrementoKey,
                  tween: IntTween(begin: 0, end: 180),
                  duration: const Duration(milliseconds: 500),
                  //curve: Curves.bounceOut,
                  builder: (context, value, child) {
                    final showOldCount = value < 90;
                    final angulo = showOldCount ? value : 180 - value;
                    return Transform(
                      alignment: FractionalOffset.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.002)
                        ..rotateX(angulo.toRadians()), //
                      child: showOldCount ? oldCountInferior : countSuperior,
                    );
                  },
                ),

              if (!estaDecrementando)
                TweenAnimationBuilder<int>(
                  key: incrementoKey,
                  tween: IntTween(begin: 180, end: 0),
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.bounceOut,
                  builder: (context, value, child) {
                    final showOldCount = value > 90;
                    int angulo = showOldCount ? (180 - value) : -value;
                    return Transform(
                      alignment: FractionalOffset.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.002)
                        ..rotateX(angulo.toRadians()), // desde -180 hasta 0
                      child: showOldCount ? oldCountSuperior : countInferior,
                    );
                  },
                ),

              Container(
                height: 2,
                width: widthCounter,
                decoration: const BoxDecoration(
                    color: Colors.black, boxShadow: [BoxShadow(blurRadius: 1)]),
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Opacity(
              opacity: count >= 9 ? 0.5 : 1,
              child: FloatingActionButton(
                heroTag: 'increment',
                onPressed: count >= 9 ? null : increment,
                shape: const CircleBorder(),
                backgroundColor: Colors.blue.shade800,
                child: Text('+', style: textStyle),
              ),
            ),
            const SizedBox(height: 8),
            Opacity(
              opacity: count <= 0 ? 0.5 : 1,
              child: FloatingActionButton(
                heroTag: 'decrement',
                onPressed: count <= 0 ? null : decrement,
                shape: const CircleBorder(),
                backgroundColor: Colors.blue.shade800,
                child: Text('-', style: textStyle),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum Parte { superior, inferior }

class MyRectClipper extends CustomClipper<Rect> {
  final Parte parte;

  MyRectClipper({super.reclip, required this.parte});

  bool get isSuperior => parte == Parte.superior;

  @override
  Rect getClip(Size size) {
    if (isSuperior) {
      return Rect.fromLTWH(0, 0, size.width, size.height / 2);
    }
    return Rect.fromLTWH(0, size.height / 2, size.width, size.height / 2);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return true; //  true porque se necesita redibujar cuando algo cambia
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget(
      {super.key,
      required this.count,
      required this.fontSize,
      this.counterKey});
  final double fontSize;
  final int count;
  final Key? counterKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: counterKey,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey[900]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          '$count',
          style: TextStyle(fontSize: fontSize, height: 1.0),
        ),
      ),
    );
  }
}

class GradienteInferior extends StatelessWidget {
  const GradienteInferior(
      {super.key,
      required this.child,
      required this.width,
      required this.height});
  final Widget child;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        child,
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.white12,
                  ])),
        ),
      ],
    );
  }
}
