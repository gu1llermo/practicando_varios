import 'package:flutter/material.dart';

import '../cuadrado.dart';

const _title = 'AnimatedContainer';

class AnimatedContainerScreen extends StatefulWidget {
  const AnimatedContainerScreen({super.key});

  @override
  State<AnimatedContainerScreen> createState() =>
      _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
  bool flag = true;
  void toggle() {
    setState(() {
      flag = !flag;
    });
  }

  @override
  Widget build(BuildContext context) {
    final transform = flag
        ? (Matrix4.identity()
          ..rotateX(0)
          ..setEntry(3, 2, 0.02))
        : (Matrix4.identity()
          ..rotateX(-3.14)
          ..setEntry(3, 2, 0.02)
          ..translate(100.0, -100.0));

    return Scaffold(
      appBar: AppBar(
        title: const Text(_title),
      ),
      body: ListView(
        children: [
          const Cuadrado(color: Colors.purple),
          AnimatedContainer(
            alignment: Alignment.center,
            duration: const Duration(milliseconds: 3000),
            height: 100,
            width: 100,
            // height: flag ? 100 : 200,
            // width: flag ? 100 : 200,
            curve: Curves.bounceOut,
            transform: transform,
            child: InkWell(
                onTap: toggle,
                child: Container(
                    decoration: BoxDecoration(
                  color: flag ? Colors.red : Colors.blue,
                ))),
          ),
          const Cuadrado(color: Colors.green),
        ],
      ),
      floatingActionButton: ElevatedButton(
        onPressed: toggle,
        child: const Text('ClickMe'),
      ),
    );
  }
}


