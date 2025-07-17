import 'package:flutter/material.dart';

class ExamplePageScreen extends StatelessWidget {
  const ExamplePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final witdh = size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      body: const SizedBox(
        height: 100,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              _Avatar(),
              SizedBox(width: 10),
              StadisticTag(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar();

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 35,
      backgroundColor: Colors.yellow,
    );
  }
}

class StadisticTag extends StatelessWidget {
  const StadisticTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 80,
        // width: 200,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
