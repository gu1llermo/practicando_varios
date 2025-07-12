import 'package:flutter/material.dart';

class KanScreen extends StatelessWidget {
  const KanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practicando'),
        backgroundColor: Colors.blue.withOpacity(.2),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(AppImages.pizza),
              radius: 35,
            ),
            SizedBox(width: 10),
            Flexible(
              flex: 1,
              child: SizedBox(
                height: 100,
                child: Stack(alignment: Alignment.bottomCenter, children: [
                  _Marco(side: Side.left),
                  TextoInferior(text: 'Kan'),
                  Center(
                    child: Text(
                      '3.9',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 26),
                    ),
                  ),
                ]),
              ),
            ),
            Flexible(
              flex: 3,
              child: SizedBox(
                height: 100,
                child: Stack(alignment: Alignment.bottomCenter, children: [
                  _Marco(side: Side.right),
                  TextoInferior(text: 'Mencionado'),
                  SeparadorVertical(),
                  Stadistics(
                    veces: 32,
                    medios: 17,
                    autores: 27,
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

BorderSide drawBorder(Color color) => BorderSide(color: color, width: 2);

enum Side { left, right }

class _Marco extends StatelessWidget {
  final Side side;
  const _Marco({required this.side});

  @override
  Widget build(BuildContext context) {
    Theme.of(context).textTheme.titleMedium;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          border: _drawBorder(), borderRadius: _drawBorderRadius()),
    );
  }

  Border _drawBorder() {
    return Border(
      top: drawBorder(Colors.blue),
      bottom: drawBorder(Colors.blue),
      right: side == Side.right ? drawBorder(Colors.blue) : BorderSide.none,
      left: side == Side.left ? drawBorder(Colors.blue) : BorderSide.none,
    );
  }

  BorderRadius _drawBorderRadius() {
    return BorderRadius.only(
      topRight: side == Side.right ? const Radius.circular(10) : Radius.zero,
      bottomRight: side == Side.right ? const Radius.circular(10) : Radius.zero,
      topLeft: side == Side.left ? const Radius.circular(10) : Radius.zero,
      bottomLeft: side == Side.left ? const Radius.circular(10) : Radius.zero,
    );
  }
}

class SeparadorVertical extends StatelessWidget {
  const SeparadorVertical({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: VerticalDivider(
        width: 0,
        color: Colors.blue,
        thickness: 2,
        indent: 20,
        endIndent: 20,
      ),
    );
  }
}

class TextoInferior extends StatelessWidget {
  final String text;
  const TextoInferior({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          text.toUpperCase(),
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
        ),
      ),
    );
  }
}

class Stadistics extends StatelessWidget {
  final int veces;
  final int medios;
  final int autores;
  const Stadistics(
      {super.key,
      required this.veces,
      required this.medios,
      required this.autores});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElementoEstadistico(title: 'veces', valor: veces),
        ElementoEstadistico(title: 'medios', valor: medios),
        ElementoEstadistico(title: 'autores', valor: autores),
      ],
    );
  }
}

class ElementoEstadistico extends StatelessWidget {
  final String title;
  final int valor;
  const ElementoEstadistico(
      {super.key, required this.title, required this.valor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$valor',
              style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          Text(
            title,
            style: const TextStyle(color: Colors.blue),
          )
        ],
      ),
    );
  }
}

class AppImages {
  static const pizza = 'assets/images/pizza.png';
}
