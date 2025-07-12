import 'package:flutter/material.dart';

class DetectorGestosScreen extends StatelessWidget {
  const DetectorGestosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detector de gestos Screen')),
      body: GestureDetector(
          onPanEnd: (details) {
            final offset = details.globalPosition;
            print('onPanEnd: $offset');
          },
          onPanStart: (details) {
            final offset = details.globalPosition;
            print('onPanStart: $offset');
          },
          onPanUpdate: (details) {
            final offset = details.globalPosition;
            print('onPanUpdate: $offset');
          },
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.blue.withOpacity(.3),
          )),
    );
  }
}
